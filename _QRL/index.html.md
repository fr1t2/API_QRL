---
title: QRL API

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript: JavaScript

toc_footers:
  - <a href='httsp://theqrl.org'>TheQRL.org</a>
  - <a href='https://github.com/theqrl'>QRL Github</a>

includes:
  - errors

search: true
---

# QRL Protocol Documentation

> Something here about setting up and running the API. This is from the test.js file

```javascript
let grpc = require('grpc');
let temp = require('temp').track();
let fs = require("fs-extra");
let qrllib = require('./node_modules/qrllib/build/libjsqrl.js');
var assert = require('assert');
var expect = require('chai').expect

async function fetchRemoteProto(nodeAddr) {
    let protoDescriptor = grpc.load('qrlbase.proto');
    let client = new protoDescriptor.qrl.Base(nodeAddr, grpc.credentials.createInsecure());

    return new Promise( (resolve) => {
        client.getNodeInfo({}, function (err, nodeInfo) {
            if (err) {
                throw err;
            }
            let requiredFile = '/tmp/google/protobuf/timestamp.proto';
            if (!fs.existsSync(requiredFile))
            {
                fs.ensureDirSync('/tmp/google/protobuf');
                fs.copySync('timestamp.proto', requiredFile, { overwrite : true });
            }
            temp.open('proto', (err, info) => {
                if (!err) {
                    fs.write(info.fd, nodeInfo.grpcProto);
                    fs.close(info.fd, function () {
                        let remoteProtoDescriptor = grpc.load(info.path);
                        resolve(remoteProtoDescriptor);
                    });
                }
            });
        });
    });
}
```

The QRL Protocol documentation is intended to lessen the on boarding and get developers up to speed quickly. We want you building into the protocol, not trying to learn how to read it!

This is a work in progress and a such will change over time. Please make sure you are referencing the correct version of code and docs.

<aside class="notice">
We need to update this section and give good info for setup and usage.
</aside>





# Addresses

## AddressList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |







## AddressState



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |
| balance | [uint64](#uint64) |  |  |
| nonce | [uint64](#uint64) |  | FIXME: Discuss. 32 or 64 bits? |
| ots_bitfield | [bytes](#bytes) | repeated |  |
| transaction_hashes | [bytes](#bytes) | repeated |  |
| tokens | [AddressState.TokensEntry](#qrl.AddressState.TokensEntry) | repeated |  |
| latticePK_list | [LatticePK](#qrl.LatticePK) | repeated |  |
| slave_pks_access_type | [AddressState.SlavePksAccessTypeEntry](#qrl.AddressState.SlavePksAccessTypeEntry) | repeated |  |
| ots_counter | [uint64](#uint64) |  |  |







## AddressState.SlavePksAccessTypeEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [uint32](#uint32) |  |  |






<a name="qrl.AddressState.TokensEntry"/>

## AddressState.TokensEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [uint64](#uint64) |  |  |






<a name="qrl.Block"/>

# Block



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| transactions | [Transaction](#qrl.Transaction) | repeated |  |
| genesis_balance | [GenesisBalance](#qrl.GenesisBalance) | repeated | This is only applicable to genesis blocks |






<a name="qrl.BlockDataPoint"/>

## BlockDataPoint
BlockDataPoint message definition


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| number | [uint64](#uint64) |  | Block number |
| difficulty | [string](#string) |  | Block difficulty |
| timestamp | [uint64](#uint64) |  | Block timestamp |
| time_last | [uint64](#uint64) |  |  |
| time_movavg | [uint64](#uint64) |  |  |
| hash_power | [float](#float) |  | Hash power |
| header_hash | [bytes](#bytes) |  | Block header hash |
| header_hash_prev | [bytes](#bytes) |  | Previous block&#39;s header hash |






<a name="qrl.BlockExtended"/>

## BlockExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| extended_transactions | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |
| genesis_balance | [GenesisBalance](#qrl.GenesisBalance) | repeated | This is only applicable to genesis blocks |
| size | [uint64](#uint64) |  |  |






<a name="qrl.BlockHeader"/>

## BlockHeader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hash_header | [bytes](#bytes) |  | Header |
| block_number | [uint64](#uint64) |  |  |
| timestamp_seconds | [uint64](#uint64) |  |  |
| hash_header_prev | [bytes](#bytes) |  |  |
| reward_block | [uint64](#uint64) |  |  |
| reward_fee | [uint64](#uint64) |  |  |
| merkle_root | [bytes](#bytes) |  |  |
| mining_nonce | [uint32](#uint32) |  |  |
| extra_nonce | [uint64](#uint64) |  |  |






<a name="qrl.BlockHeaderExtended"/>

## BlockHeaderExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| transaction_count | [TransactionCount](#qrl.TransactionCount) |  |  |






<a name="qrl.BlockHeightData"/>

## BlockHeightData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| block_headerhash | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |






<a name="qrl.BlockMetaData"/>

## BlockMetaData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| is_orphan | [bool](#bool) |  |  |
| block_difficulty | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |
| child_headerhashes | [bytes](#bytes) | repeated |  |
| last_N_headerhashes | [bytes](#bytes) | repeated | Keeps last N headerhashes, for measurement of timestamp difference |






<a name="qrl.BlockMetaDataList"/>

## BlockMetaDataList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number_hashes | [BlockMetaData](#qrl.BlockMetaData) | repeated |  |






<a name="qrl.BlockNumberMapping"/>

## BlockNumberMapping



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| headerhash | [bytes](#bytes) |  |  |
| prev_headerhash | [bytes](#bytes) |  |  |






<a name="qrl.Empty"/>

# Empty
Empty message definition




# Ephemeral

<a name="qrl.EncryptedEphemeralMessage"/>

## EncryptedEphemeralMessage



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| msg_id | [bytes](#bytes) |  | b&#39;NEW&#39; or PRF |
| ttl | [uint64](#uint64) |  | Expiry Timestamp in seconds |
| ttr | [uint64](#uint64) |  | Time to relay |
| channel | [EncryptedEphemeralMessage.Channel](#qrl.EncryptedEphemeralMessage.Channel) |  |  |
| nonce | [uint64](#uint64) |  | nonce |
| payload | [bytes](#bytes) |  | JSON content, encrypted by aes256_symkey |






<a name="qrl.EncryptedEphemeralMessage.Channel"/>

## EncryptedEphemeralMessage.Channel



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enc_aes256_symkey | [bytes](#bytes) |  | aes256_symkey encrypted by kyber |






<a name="qrl.GenesisBalance"/>

# GenesisBalance



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  | Address is string only here to increase visibility |
| balance | [uint64](#uint64) |  |  |



# Get


<a name="qrl.GetAddressFromPKReq"/>

## GetAddressFromPKReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pk | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressFromPKResp"/>

## GetAddressFromPKResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressStateReq"/>

## GetAddressStateReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressStateResp"/>

## GetAddressStateResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state | [AddressState](#qrl.AddressState) |  |  |






<a name="qrl.GetBlockReq"/>

## GetBlockReq
NOT USED -&gt; RM?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| index | [uint64](#uint64) |  | Indicates the index number in mainchain |
| after_hash | [bytes](#bytes) |  | request the node that comes after hash |






<a name="qrl.GetBlockResp"/>

## GetBlockResp
NOT USED -&gt; RM?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_info | [NodeInfo](#qrl.NodeInfo) |  |  |
| block | [Block](#qrl.Block) |  |  |






<a name="qrl.GetKnownPeersReq"/>

## GetKnownPeersReq
Represents a query to get known peers






<a name="qrl.GetKnownPeersResp"/>

## GetKnownPeersResp
Represents the reply message to known peers query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_info | [NodeInfo](#qrl.NodeInfo) |  | NodeInfo object containing node state information |
| known_peers | [Peer](#qrl.Peer) | repeated | List of Peer objects containing peer nodes detailed information |






<a name="qrl.GetLatestDataReq"/>

## GetLatestDataReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| filter | [GetLatestDataReq.Filter](#qrl.GetLatestDataReq.Filter) |  |  |
| offset | [uint32](#uint32) |  | Offset in the result list (works backwards in this case) |
| quantity | [uint32](#uint32) |  | Number of items to retrive. Capped at 100 |






<a name="qrl.GetLatestDataResp"/>

## GetLatestDataResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blockheaders | [BlockHeaderExtended](#qrl.BlockHeaderExtended) | repeated |  |
| transactions | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |
| transactions_unconfirmed | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |






<a name="qrl.GetLocalAddressesReq"/>

## GetLocalAddressesReq







<a name="qrl.GetLocalAddressesResp"/>

## GetLocalAddressesResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |






<a name="qrl.GetNodeStateReq"/>

## GetNodeStateReq

```javascript
// Test for GetNodeState
describe('GetNodeState', function() {
    let response;
    // call API
    before(function() {
        return new Promise((resolve) => {
            qrlClient.then( function (qrlClient) {
                qrlClient.getNodeState({}, (err, res) => {
                    if (err){
                        console.log("Error: ", err.message);
                        return;
                    }
                    response = res;
                    resolve();
                });
            });
        });
    });
    
});
```

Represents a query to get node state






<a name="qrl.GetNodeStateResp"/>

## GetNodeStateResp


```javascript
it('GetNodeStateResp has NodeInfo *info* property', function(){
        expect(response).to.have.property('info');
    });
    it('GetNodeStateResp.info has correct *state* property', function(){
        expect(response.info).to.have.property('state');
        expect(response.info.state).to.be.a('string');
        expect(response.info.state).to.be.oneOf(['UNKNOWN', 'UNSYNCED', 'SYNCING', 'SYNCED', 'FORKED']);
    });
    it('GetNodeStateResp.info has correct *version* property', function(){
        expect(response.info).to.have.property('version');
        expect(response.info.version).to.be.a('string');
    });
    it('GetNodeStateResp.info has correct *num_connections* property', function(){
        expect(response.info).to.have.property('num_connections');
        expect(response.info.num_connections).to.be.a('number');
        expect(response.info.num_connections).to.be.below(4294967297); // uint32
    });
    it('GetNodeStateResp.info has correct *num_known_peers* property', function(){
        expect(response.info).to.have.property('num_known_peers');
        expect(response.info.num_known_peers).to.be.a('number');
        expect(response.info.num_known_peers).to.be.below(4294967297); // uint32
    });
    it('GetNodeStateResp.info has correct *uptime* property', function(){
        expect(response.info).to.have.property('uptime');
        expect(response.info.uptime).to.be.a('string');
        expect(parseInt(response.info.uptime)).to.be.a('number');
        expect(parseInt(response.info.uptime)).to.be.below(18446744073709551617); // uint64
    });
    it('GetNodeStateResp.info has correct *block_height* property', function(){
        expect(response.info).to.have.property('block_height');
        expect(response.info.block_height).to.be.a('string');
        expect(parseInt(response.info.block_height)).to.be.a('number');
        expect(parseInt(response.info.block_height)).to.be.below(18446744073709551617); // uint64
    });
    it('GetNodeStateResp.info has correct *block_last_hash* property', function(){
        expect(response.info).to.have.property('block_last_hash');
        expect(typeof(response.info.block_last_hash)).to.equal('object');
        expect(Buffer.isBuffer(response.info.block_last_hash)).to.equal(true);
    });
    it('GetNodeStateResp.info has correct *network_id* property', function(){
        expect(response.info).to.have.property('network_id');
        expect(response.info.network_id).to.be.a('string');
    });
```


Represents the reply message to node state query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| info | [NodeInfo](#qrl.NodeInfo) |  |  |






<a name="qrl.GetObjectReq"/>

## GetObjectReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query | [bytes](#bytes) |  |  |






<a name="qrl.GetObjectResp"/>

## GetObjectResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| found | [bool](#bool) |  |  |
| address_state | [AddressState](#qrl.AddressState) |  |  |
| transaction | [TransactionExtended](#qrl.TransactionExtended) |  |  |
| block_extended | [BlockExtended](#qrl.BlockExtended) |  |  |






<a name="qrl.GetPeersStatReq"/>

## GetPeersStatReq
Represents a query to get connected peers stat






<a name="qrl.GetPeersStatResp"/>

## GetPeersStatResp
Represents the reply message to peers stat query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peers_stat | [PeerStat](#qrl.PeerStat) | repeated | PeerState object contains peer_ip, port and peer state information |






<a name="qrl.GetStatsReq"/>

## GetStatsReq
Represents a query to get statistics about node


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| include_timeseries | [bool](#bool) |  | Boolean to define if block timeseries should be included in reply or not |






<a name="qrl.GetStatsResp"/>

## GetStatsResp
Represents the reply message to get statistics about node


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_info | [NodeInfo](#qrl.NodeInfo) |  | NodeInfo object containing node state information |
| epoch | [uint64](#uint64) |  | Current epoch |
| uptime_network | [uint64](#uint64) |  | Indicates uptime in seconds |
| block_last_reward | [uint64](#uint64) |  | Block reward |
| block_time_mean | [uint64](#uint64) |  | Blocktime average |
| block_time_sd | [uint64](#uint64) |  | Blocktime standrad deviation |
| coins_total_supply | [uint64](#uint64) |  | Total coins supply |
| coins_emitted | [uint64](#uint64) |  | Total coins emitted |
| block_timeseries | [BlockDataPoint](#qrl.BlockDataPoint) | repeated |  |






<a name="qrl.LRUStateCache"/>

# LRUStateCache







<a name="qrl.LatticePK"/>

# LatticePK



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| txhash | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |
| kyber_pk | [bytes](#bytes) |  |  |






<a name="qrl.LatticePublicKeyTxnReq"/>

## LatticePublicKeyTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| kyber_pk | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.MessageTxnReq"/>

# MessageTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| message | [bytes](#bytes) |  |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.NodeChainState"/>

# NodeChainState



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| header_hash | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |
| timestamp | [uint64](#uint64) |  |  |




# Node

<a name="qrl.NodeHeaderHash"/>

## NodeHeaderHash



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| headerhashes | [bytes](#bytes) | repeated |  |






<a name="qrl.NodeInfo"/>

## NodeInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  |  |
| state | [NodeInfo.State](#qrl.NodeInfo.State) |  |  |
| num_connections | [uint32](#uint32) |  |  |
| num_known_peers | [uint32](#uint32) |  |  |
| uptime | [uint64](#uint64) |  | Uptime in seconds |
| block_height | [uint64](#uint64) |  |  |
| block_last_hash | [bytes](#bytes) |  |  |
| network_id | [string](#string) |  |  |




# P2P

<a name="qrl.P2PAcknowledgement"/>

## P2PAcknowledgement



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| bytes_processed | [uint32](#uint32) |  |  |






<a name="qrl.Peer"/>

## Peer



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ip | [string](#string) |  |  |






<a name="qrl.PeerInfo"/>

## PeerInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_ip | [bytes](#bytes) |  |  |
| port | [uint32](#uint32) |  |  |
| banned_timestamp | [uint32](#uint32) |  |  |
| credibility | [uint32](#uint32) |  |  |
| last_connections_timestamp | [uint32](#uint32) | repeated |  |






<a name="qrl.PeerStat"/>

## PeerStat



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_ip | [bytes](#bytes) |  |  |
| port | [uint32](#uint32) |  |  |
| node_chain_state | [NodeChainState](#qrl.NodeChainState) |  |  |






<a name="qrl.Peers"/>

## Peers



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_info_list | [PeerInfo](#qrl.PeerInfo) | repeated |  |






<a name="qrl.PushTransactionReq"/>

# PushTransactionReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transaction_signed | [Transaction](#qrl.Transaction) |  |  |






<a name="qrl.PushTransactionResp"/>

## PushTransactionResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error_code | [PushTransactionResp.ResponseCode](#qrl.PushTransactionResp.ResponseCode) |  |  |
| error_description | [string](#string) |  |  |
| tx_hash | [bytes](#bytes) |  |  |






<a name="qrl.SlaveTxnReq"/>

# SlaveTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| slave_pks | [bytes](#bytes) | repeated |  |
| access_types | [uint32](#uint32) | repeated |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.StateLoader"/>

# StateLoader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |
| token_txhash | [bytes](#bytes) | repeated |  |
| txhash | [bytes](#bytes) | repeated |  |
| total_coin_supply | [uint64](#uint64) |  |  |






<a name="qrl.StateObjects"/>

## StateObjects



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_loaders | [bytes](#bytes) | repeated |  |






<a name="qrl.StoredPeers"/>

# StoredPeers



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peers | [Peer](#qrl.Peer) | repeated |  |




# Token

<a name="qrl.TokenList"/>

## TokenList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) | repeated |  |






<a name="qrl.TokenMetadata"/>

## TokenMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) |  |  |
| transfer_token_tx_hashes | [bytes](#bytes) | repeated |  |






<a name="qrl.TokenTxnReq"/>

## TokenTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| symbol | [bytes](#bytes) |  |  |
| name | [bytes](#bytes) |  |  |
| owner | [bytes](#bytes) |  |  |
| decimals | [uint64](#uint64) |  |  |
| initial_balances | [AddressAmount](#qrl.AddressAmount) | repeated |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.Transaction"/>

# Transaction



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| fee | [uint64](#uint64) |  |  |
| public_key | [bytes](#bytes) |  |  |
| signature | [bytes](#bytes) |  |  |
| nonce | [uint64](#uint64) |  |  |
| transaction_hash | [bytes](#bytes) |  |  |
| transfer | [Transaction.Transfer](#qrl.Transaction.Transfer) |  |  |
| coinbase | [Transaction.CoinBase](#qrl.Transaction.CoinBase) |  |  |
| latticePK | [Transaction.LatticePublicKey](#qrl.Transaction.LatticePublicKey) |  |  |
| message | [Transaction.Message](#qrl.Transaction.Message) |  |  |
| token | [Transaction.Token](#qrl.Transaction.Token) |  |  |
| transfer_token | [Transaction.TransferToken](#qrl.Transaction.TransferToken) |  |  |
| slave | [Transaction.Slave](#qrl.Transaction.Slave) |  |  |






<a name="qrl.Transaction.CoinBase"/>

## Transaction.CoinBase



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addr_to | [bytes](#bytes) |  |  |
| amount | [uint64](#uint64) |  |  |






<a name="qrl.Transaction.LatticePublicKey"/>

## Transaction.LatticePublicKey



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| kyber_pk | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |






<a name="qrl.Transaction.Message"/>

## Transaction.Message



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| message_hash | [bytes](#bytes) |  |  |






<a name="qrl.Transaction.Slave"/>

## Transaction.Slave



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| slave_pks | [bytes](#bytes) | repeated |  |
| access_types | [uint32](#uint32) | repeated |  |






<a name="qrl.Transaction.Token"/>

## Transaction.Token



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| symbol | [bytes](#bytes) |  |  |
| name | [bytes](#bytes) |  |  |
| owner | [bytes](#bytes) |  |  |
| decimals | [uint64](#uint64) |  |  |
| initial_balances | [AddressAmount](#qrl.AddressAmount) | repeated |  |






<a name="qrl.Transaction.Transfer"/>

## Transaction.Transfer



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addrs_to | [bytes](#bytes) | repeated |  |
| amounts | [uint64](#uint64) | repeated |  |






<a name="qrl.Transaction.TransferToken"/>

## Transaction.TransferToken



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) |  |  |
| addrs_to | [bytes](#bytes) | repeated |  |
| amounts | [uint64](#uint64) | repeated |  |






<a name="qrl.TransactionCount"/>

## TransactionCount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [TransactionCount.CountEntry](#qrl.TransactionCount.CountEntry) | repeated |  |






<a name="qrl.TransactionCount.CountEntry"/>

## TransactionCount.CountEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [uint32](#uint32) |  |  |
| value | [uint32](#uint32) |  |  |






<a name="qrl.TransactionExtended"/>

## TransactionExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| tx | [Transaction](#qrl.Transaction) |  |  |
| addr_from | [bytes](#bytes) |  |  |
| size | [uint64](#uint64) |  |  |
| timestamp_seconds | [uint64](#uint64) |  |  |




# Transfer

<a name="qrl.TransferCoinsReq"/>

## TransferCoinsReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  | Transaction source address |
| addresses_to | [bytes](#bytes) | repeated | Transaction destination address |
| amounts | [uint64](#uint64) | repeated | Amount. It should be expressed in Shor |
| fee | [uint64](#uint64) |  | Fee. It should be expressed in Shor |
| xmss_pk | [bytes](#bytes) |  | XMSS Public key |






<a name="qrl.TransferCoinsResp"/>

## TransferCoinsResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| extended_transaction_unsigned | [TransactionExtended](#qrl.TransactionExtended) |  |  |






<a name="qrl.TransferTokenTxnReq"/>

## TransferTokenTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| addresses_to | [bytes](#bytes) | repeated |  |
| token_txhash | [bytes](#bytes) |  |  |
| amounts | [uint64](#uint64) | repeated |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |





 


<a name="qrl.GetLatestDataReq.Filter"/>

# GetLatestDataReq.Filter


| Name | Number | Description |
| ---- | ------ | ----------- |
| ALL | 0 |  |
| BLOCKHEADERS | 1 |  |
| TRANSACTIONS | 2 |  |
| TRANSACTIONS_UNCONFIRMED | 3 |  |



<a name="qrl.NodeInfo.State"/>

# NodeInfo.State


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| UNSYNCED | 1 |  |
| SYNCING | 2 |  |
| SYNCED | 3 |  |
| FORKED | 4 |  |



<a name="qrl.PushTransactionResp.ResponseCode"/>

# PushTransactionResp.ResponseCode


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| ERROR | 1 |  |
| VALIDATION_FAILED | 2 |  |
| SUBMITTED | 3 |  |


 

 


<a name="qrl.AdminAPI"/>

# AdminAPI
This is a place holder for testing/instrumentation APIs

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|


<a name="qrl.PublicAPI"/>

# PublicAPI
This service describes the Public API used by clients (wallet/cli/etc)

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetNodeState | [GetNodeStateReq](#qrl.GetNodeStateReq) | [GetNodeStateResp](#qrl.GetNodeStateReq) |  |
| GetKnownPeers | [GetKnownPeersReq](#qrl.GetKnownPeersReq) | [GetKnownPeersResp](#qrl.GetKnownPeersReq) |  |
| GetPeersStat | [GetPeersStatReq](#qrl.GetPeersStatReq) | [GetPeersStatResp](#qrl.GetPeersStatReq) |  |
| GetStats | [GetStatsReq](#qrl.GetStatsReq) | [GetStatsResp](#qrl.GetStatsReq) |  |
| GetAddressState | [GetAddressStateReq](#qrl.GetAddressStateReq) | [GetAddressStateResp](#qrl.GetAddressStateReq) |  |
| GetObject | [GetObjectReq](#qrl.GetObjectReq) | [GetObjectResp](#qrl.GetObjectReq) |  |
| GetLatestData | [GetLatestDataReq](#qrl.GetLatestDataReq) | [GetLatestDataResp](#qrl.GetLatestDataReq) |  |
| TransferCoins | [TransferCoinsReq](#qrl.TransferCoinsReq) | [TransferCoinsResp](#qrl.TransferCoinsReq) |  |
| PushTransaction | [PushTransactionReq](#qrl.PushTransactionReq) | [PushTransactionResp](#qrl.PushTransactionReq) |  |
| GetMessageTxn | [MessageTxnReq](#qrl.MessageTxnReq) | [TransferCoinsResp](#qrl.MessageTxnReq) |  |
| GetTokenTxn | [TokenTxnReq](#qrl.TokenTxnReq) | [TransferCoinsResp](#qrl.TokenTxnReq) |  |
| GetTransferTokenTxn | [TransferTokenTxnReq](#qrl.TransferTokenTxnReq) | [TransferCoinsResp](#qrl.TransferTokenTxnReq) |  |
| GetSlaveTxn | [SlaveTxnReq](#qrl.SlaveTxnReq) | [TransferCoinsResp](#qrl.SlaveTxnReq) |  |
| GetLatticePublicKeyTxn | [LatticePublicKeyTxnReq](#qrl.LatticePublicKeyTxnReq) | [TransferCoinsResp](#qrl.LatticePublicKeyTxnReq) |  |
| GetAddressFromPK | [GetAddressFromPKReq](#qrl.GetAddressFromPKReq) | [GetAddressFromPKResp](#qrl.GetAddressFromPKReq) |  |

 



<a name="qrlbase.proto"/>
<p align="right"><a href="#top">Top</a></p>

# qrlbase.proto



<a name="qrl.GetNodeInfoReq"/>

## GetNodeInfoReq







<a name="qrl.GetNodeInfoResp"/>

## GetNodeInfoResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  |  |
| grpcProto | [string](#string) |  |  |





 

 

 


<a name="qrl.Base"/>

## Base


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetNodeInfo | [GetNodeInfoReq](#qrl.GetNodeInfoReq) | [GetNodeInfoResp](#qrl.GetNodeInfoReq) |  |

 



<a name="qrllegacy.proto"/>
<p align="right"><a href="#top">Top</a></p>

# qrllegacy.proto



<a name="qrl.BKData"/>

## BKData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mrData | [MRData](#qrl.MRData) |  |  |
| block | [Block](#qrl.Block) |  |  |






<a name="qrl.FBData"/>

## FBData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| index | [uint64](#uint64) |  |  |






<a name="qrl.LegacyMessage"/>

## LegacyMessage
Adding old code to refactor while keeping things working


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| func_name | [LegacyMessage.FuncName](#qrl.LegacyMessage.FuncName) |  |  |
| noData | [NoData](#qrl.NoData) |  |  |
| veData | [VEData](#qrl.VEData) |  |  |
| plData | [PLData](#qrl.PLData) |  |  |
| pongData | [PONGData](#qrl.PONGData) |  |  |
| mrData | [MRData](#qrl.MRData) |  |  |
| block | [Block](#qrl.Block) |  |  |
| fbData | [FBData](#qrl.FBData) |  |  |
| pbData | [PBData](#qrl.PBData) |  |  |
| bhData | [BlockHeightData](#qrl.BlockHeightData) |  |  |
| txData | [Transaction](#qrl.Transaction) |  |  |
| mtData | [Transaction](#qrl.Transaction) |  |  |
| tkData | [Transaction](#qrl.Transaction) |  |  |
| ttData | [Transaction](#qrl.Transaction) |  |  |
| ltData | [Transaction](#qrl.Transaction) |  |  |
| slData | [Transaction](#qrl.Transaction) |  |  |
| ephData | [EncryptedEphemeralMessage](#qrl.EncryptedEphemeralMessage) |  |  |
| syncData | [SYNCData](#qrl.SYNCData) |  |  |
| chainStateData | [NodeChainState](#qrl.NodeChainState) |  |  |
| nodeHeaderHash | [NodeHeaderHash](#qrl.NodeHeaderHash) |  |  |
| p2pAckData | [P2PAcknowledgement](#qrl.P2PAcknowledgement) |  |  |






<a name="qrl.MRData"/>

## MRData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| hash | [bytes](#bytes) |  | FIXME: rename this to block_headerhash |
| type | [LegacyMessage.FuncName](#qrl.LegacyMessage.FuncName) |  | FIXME: type/string what is this |
| stake_selector | [bytes](#bytes) |  |  |
| block_number | [uint64](#uint64) |  |  |
| prev_headerhash | [bytes](#bytes) |  |  |
| reveal_hash | [bytes](#bytes) |  |  |






<a name="qrl.NoData"/>

## NoData







<a name="qrl.PBData"/>

## PBData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block | [Block](#qrl.Block) |  |  |






<a name="qrl.PLData"/>

## PLData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_ips | [string](#string) | repeated |  |
| public_port | [uint32](#uint32) |  |  |






<a name="qrl.PONGData"/>

## PONGData


<a name="qrl.SYNCData"/>

## SYNCData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state | [string](#string) |  |  |



<a name="qrl.VEData"/>

## VEData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  |  |
| genesis_prev_hash | [bytes](#bytes) |  |  |
| rate_limit | [uint64](#uint64) |  |  |



<a name="qrl.LegacyMessage.FuncName"/>

## LegacyMessage.FuncName


| Name | Number | Description |
| ---- | ------ | ----------- |
| VE | 0 | Version |
| PL | 1 | Peers List |
| PONG | 2 | Pong TODO: Obsolete |
| MR | 3 | Message received |
| SFM | 4 | Send Full Message |
| BK | 5 | Block |
| FB | 6 | Fetch request for block |
| PB | 7 | Push Block |
| BH | 8 | Block Height |
| TX | 9 | Transfer Transaction |
| LT | 10 | Lattice Transaction |
| EPH | 11 | Ephemeral |
| MT | 12 | Message Transaction |
| TK | 13 | Token Transaction |
| TT | 14 | Transfer Token Transaction |
| SL | 15 | Slave Transaction |
| SYNC | 16 | Add into synced list, if the node replies |
| CHAINSTATE | 17 | Chain State |
| HEADERHASHES | 18 |  |
| P2P_ACK | 19 | P2P Acknowledgement |

<a name="qrlmining.proto"/>
<p align="right"><a href="#top">Top</a></p>

# qrlmining.proto



<a name="qrl.GetBlockMiningCompatibleReq"/>

## GetBlockMiningCompatibleReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| height | [uint64](#uint64) |  | Used for getlastblockheader and getblockheaderbyheight

if height = 0, this means getlastblockheader |






<a name="qrl.GetBlockMiningCompatibleResp"/>

## GetBlockMiningCompatibleResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blockheader | [BlockHeader](#qrl.BlockHeader) |  |  |
| blockmetadata | [BlockMetaData](#qrl.BlockMetaData) |  |  |






<a name="qrl.GetBlockToMineReq"/>

## GetBlockToMineReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| wallet_address | [bytes](#bytes) |  |  |






<a name="qrl.GetBlockToMineResp"/>

## GetBlockToMineResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blocktemplate_blob | [string](#string) |  | max length 112 bytes, otherwise xmr-stak will hiccup |
| difficulty | [uint64](#uint64) |  | difficulty that the new block should meet |
| height | [uint64](#uint64) |  |  |
| reserved_offset | [uint32](#uint32) |  |  |






<a name="qrl.GetLastBlockHeaderReq"/>

## GetLastBlockHeaderReq

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| height | [uint64](#uint64) |  |  |


<a name="qrl.GetLastBlockHeaderResp"/>

## GetLastBlockHeaderResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| difficulty | [uint64](#uint64) |  |  |
| height | [uint64](#uint64) |  |  |
| timestamp | [uint64](#uint64) |  |  |
| reward | [uint64](#uint64) |  |  |
| hash | [string](#string) |  |  |
| depth | [uint64](#uint64) |  |  |


<a name="qrl.SubmitMinedBlockReq"/>

## SubmitMinedBlockReq

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob | [bytes](#bytes) |  | blocktemplate_blob with the correct nonce |

<a name="qrl.SubmitMinedBlockResp"/>

## SubmitMinedBlockResp

| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [bool](#bool) |  | It seems there are no special fields for success/error reporting, does gRPC automatically give me something? |

<a name="qrl.MiningAPI"/>

## MiningAPI


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetBlockMiningCompatible | [GetBlockMiningCompatibleReq](#qrl.GetBlockMiningCompatibleReq) | [GetBlockMiningCompatibleResp](#qrl.GetBlockMiningCompatibleReq) |  |
| GetLastBlockHeader | [GetLastBlockHeaderReq](#qrl.GetLastBlockHeaderReq) | [GetLastBlockHeaderResp](#qrl.GetLastBlockHeaderReq) |  |
| GetBlockToMine | [GetBlockToMineReq](#qrl.GetBlockToMineReq) | [GetBlockToMineResp](#qrl.GetBlockToMineReq) |  |
| SubmitMinedBlock | [SubmitMinedBlockReq](#qrl.SubmitMinedBlockReq) | [SubmitMinedBlockResp](#qrl.SubmitMinedBlockReq) |  |


# Scalar Value Types

| .proto Type | Notes | C++ Type | Java Type | Python Type |
| ----------- | ----- | -------- | --------- | ----------- |
| <a name="double" /> double |  | double | double | float |
| <a name="float" /> float |  | float | float | float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long |
| <a name="bool" /> bool |  | bool | boolean | boolean |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str |

