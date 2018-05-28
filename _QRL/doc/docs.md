# Protocol Documentation
<a name="top"/>

## Table of Contents

- [qrl.proto](#qrl.proto)
    - [AddressAmount](#qrl.AddressAmount)
    - [AddressList](#qrl.AddressList)
    - [AddressState](#qrl.AddressState)
    - [AddressState.SlavePksAccessTypeEntry](#qrl.AddressState.SlavePksAccessTypeEntry)
    - [AddressState.TokensEntry](#qrl.AddressState.TokensEntry)
    - [Block](#qrl.Block)
    - [BlockDataPoint](#qrl.BlockDataPoint)
    - [BlockExtended](#qrl.BlockExtended)
    - [BlockHeader](#qrl.BlockHeader)
    - [BlockHeaderExtended](#qrl.BlockHeaderExtended)
    - [BlockHeightData](#qrl.BlockHeightData)
    - [BlockMetaData](#qrl.BlockMetaData)
    - [BlockMetaDataList](#qrl.BlockMetaDataList)
    - [BlockNumberMapping](#qrl.BlockNumberMapping)
    - [Empty](#qrl.Empty)
    - [EncryptedEphemeralMessage](#qrl.EncryptedEphemeralMessage)
    - [EncryptedEphemeralMessage.Channel](#qrl.EncryptedEphemeralMessage.Channel)
    - [GenesisBalance](#qrl.GenesisBalance)
    - [GetAddressFromPKReq](#qrl.GetAddressFromPKReq)
    - [GetAddressFromPKResp](#qrl.GetAddressFromPKResp)
    - [GetAddressStateReq](#qrl.GetAddressStateReq)
    - [GetAddressStateResp](#qrl.GetAddressStateResp)
    - [GetBlockReq](#qrl.GetBlockReq)
    - [GetBlockResp](#qrl.GetBlockResp)
    - [GetKnownPeersReq](#qrl.GetKnownPeersReq)
    - [GetKnownPeersResp](#qrl.GetKnownPeersResp)
    - [GetLatestDataReq](#qrl.GetLatestDataReq)
    - [GetLatestDataResp](#qrl.GetLatestDataResp)
    - [GetLocalAddressesReq](#qrl.GetLocalAddressesReq)
    - [GetLocalAddressesResp](#qrl.GetLocalAddressesResp)
    - [GetNodeStateReq](#qrl.GetNodeStateReq)
    - [GetNodeStateResp](#qrl.GetNodeStateResp)
    - [GetObjectReq](#qrl.GetObjectReq)
    - [GetObjectResp](#qrl.GetObjectResp)
    - [GetPeersStatReq](#qrl.GetPeersStatReq)
    - [GetPeersStatResp](#qrl.GetPeersStatResp)
    - [GetStatsReq](#qrl.GetStatsReq)
    - [GetStatsResp](#qrl.GetStatsResp)
    - [LRUStateCache](#qrl.LRUStateCache)
    - [LatticePK](#qrl.LatticePK)
    - [LatticePublicKeyTxnReq](#qrl.LatticePublicKeyTxnReq)
    - [MessageTxnReq](#qrl.MessageTxnReq)
    - [NodeChainState](#qrl.NodeChainState)
    - [NodeHeaderHash](#qrl.NodeHeaderHash)
    - [NodeInfo](#qrl.NodeInfo)
    - [P2PAcknowledgement](#qrl.P2PAcknowledgement)
    - [Peer](#qrl.Peer)
    - [PeerInfo](#qrl.PeerInfo)
    - [PeerStat](#qrl.PeerStat)
    - [Peers](#qrl.Peers)
    - [PushTransactionReq](#qrl.PushTransactionReq)
    - [PushTransactionResp](#qrl.PushTransactionResp)
    - [SlaveTxnReq](#qrl.SlaveTxnReq)
    - [StateLoader](#qrl.StateLoader)
    - [StateObjects](#qrl.StateObjects)
    - [StoredPeers](#qrl.StoredPeers)
    - [TokenList](#qrl.TokenList)
    - [TokenMetadata](#qrl.TokenMetadata)
    - [TokenTxnReq](#qrl.TokenTxnReq)
    - [Transaction](#qrl.Transaction)
    - [Transaction.CoinBase](#qrl.Transaction.CoinBase)
    - [Transaction.LatticePublicKey](#qrl.Transaction.LatticePublicKey)
    - [Transaction.Message](#qrl.Transaction.Message)
    - [Transaction.Slave](#qrl.Transaction.Slave)
    - [Transaction.Token](#qrl.Transaction.Token)
    - [Transaction.Transfer](#qrl.Transaction.Transfer)
    - [Transaction.TransferToken](#qrl.Transaction.TransferToken)
    - [TransactionCount](#qrl.TransactionCount)
    - [TransactionCount.CountEntry](#qrl.TransactionCount.CountEntry)
    - [TransactionExtended](#qrl.TransactionExtended)
    - [TransferCoinsReq](#qrl.TransferCoinsReq)
    - [TransferCoinsResp](#qrl.TransferCoinsResp)
    - [TransferTokenTxnReq](#qrl.TransferTokenTxnReq)
  
    - [GetLatestDataReq.Filter](#qrl.GetLatestDataReq.Filter)
    - [NodeInfo.State](#qrl.NodeInfo.State)
    - [PushTransactionResp.ResponseCode](#qrl.PushTransactionResp.ResponseCode)
  
  
    - [AdminAPI](#qrl.AdminAPI)
    - [PublicAPI](#qrl.PublicAPI)
  

- [Scalar Value Types](#scalar-value-types)



<a name="qrl.proto"/>
<p align="right"><a href="#top">Top</a></p>

## qrl.proto



<a name="qrl.AddressAmount"/>

### AddressAmount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |
| amount | [uint64](#uint64) |  |  |






<a name="qrl.AddressList"/>

### AddressList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |






<a name="qrl.AddressState"/>

### AddressState



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






<a name="qrl.AddressState.SlavePksAccessTypeEntry"/>

### AddressState.SlavePksAccessTypeEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [uint32](#uint32) |  |  |






<a name="qrl.AddressState.TokensEntry"/>

### AddressState.TokensEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [uint64](#uint64) |  |  |






<a name="qrl.Block"/>

### Block



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| transactions | [Transaction](#qrl.Transaction) | repeated |  |
| genesis_balance | [GenesisBalance](#qrl.GenesisBalance) | repeated | This is only applicable to genesis blocks |






<a name="qrl.BlockDataPoint"/>

### BlockDataPoint
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

### BlockExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| extended_transactions | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |
| genesis_balance | [GenesisBalance](#qrl.GenesisBalance) | repeated | This is only applicable to genesis blocks |
| size | [uint64](#uint64) |  |  |






<a name="qrl.BlockHeader"/>

### BlockHeader



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

### BlockHeaderExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| transaction_count | [TransactionCount](#qrl.TransactionCount) |  |  |






<a name="qrl.BlockHeightData"/>

### BlockHeightData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| block_headerhash | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |






<a name="qrl.BlockMetaData"/>

### BlockMetaData



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| is_orphan | [bool](#bool) |  |  |
| block_difficulty | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |
| child_headerhashes | [bytes](#bytes) | repeated |  |
| last_N_headerhashes | [bytes](#bytes) | repeated | Keeps last N headerhashes, for measurement of timestamp difference |






<a name="qrl.BlockMetaDataList"/>

### BlockMetaDataList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number_hashes | [BlockMetaData](#qrl.BlockMetaData) | repeated |  |






<a name="qrl.BlockNumberMapping"/>

### BlockNumberMapping



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| headerhash | [bytes](#bytes) |  |  |
| prev_headerhash | [bytes](#bytes) |  |  |






<a name="qrl.Empty"/>

### Empty
Empty message definition






<a name="qrl.EncryptedEphemeralMessage"/>

### EncryptedEphemeralMessage



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| msg_id | [bytes](#bytes) |  | b&#39;NEW&#39; or PRF |
| ttl | [uint64](#uint64) |  | Expiry Timestamp in seconds |
| ttr | [uint64](#uint64) |  | Time to relay |
| channel | [EncryptedEphemeralMessage.Channel](#qrl.EncryptedEphemeralMessage.Channel) |  |  |
| nonce | [uint64](#uint64) |  | nonce |
| payload | [bytes](#bytes) |  | JSON content, encrypted by aes256_symkey |






<a name="qrl.EncryptedEphemeralMessage.Channel"/>

### EncryptedEphemeralMessage.Channel



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enc_aes256_symkey | [bytes](#bytes) |  | aes256_symkey encrypted by kyber |






<a name="qrl.GenesisBalance"/>

### GenesisBalance



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  | Address is string only here to increase visibility |
| balance | [uint64](#uint64) |  |  |






<a name="qrl.GetAddressFromPKReq"/>

### GetAddressFromPKReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pk | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressFromPKResp"/>

### GetAddressFromPKResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressStateReq"/>

### GetAddressStateReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| address | [bytes](#bytes) |  |  |






<a name="qrl.GetAddressStateResp"/>

### GetAddressStateResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state | [AddressState](#qrl.AddressState) |  |  |






<a name="qrl.GetBlockReq"/>

### GetBlockReq
NOT USED -&gt; RM?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| index | [uint64](#uint64) |  | Indicates the index number in mainchain |
| after_hash | [bytes](#bytes) |  | request the node that comes after hash |






<a name="qrl.GetBlockResp"/>

### GetBlockResp
NOT USED -&gt; RM?


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_info | [NodeInfo](#qrl.NodeInfo) |  |  |
| block | [Block](#qrl.Block) |  |  |






<a name="qrl.GetKnownPeersReq"/>

### GetKnownPeersReq
Represents a query to get known peers






<a name="qrl.GetKnownPeersResp"/>

### GetKnownPeersResp
Represents the reply message to known peers query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_info | [NodeInfo](#qrl.NodeInfo) |  | NodeInfo object containing node state information |
| known_peers | [Peer](#qrl.Peer) | repeated | List of Peer objects containing peer nodes detailed information |






<a name="qrl.GetLatestDataReq"/>

### GetLatestDataReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| filter | [GetLatestDataReq.Filter](#qrl.GetLatestDataReq.Filter) |  |  |
| offset | [uint32](#uint32) |  | Offset in the result list (works backwards in this case) |
| quantity | [uint32](#uint32) |  | Number of items to retrive. Capped at 100 |






<a name="qrl.GetLatestDataResp"/>

### GetLatestDataResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blockheaders | [BlockHeaderExtended](#qrl.BlockHeaderExtended) | repeated |  |
| transactions | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |
| transactions_unconfirmed | [TransactionExtended](#qrl.TransactionExtended) | repeated |  |






<a name="qrl.GetLocalAddressesReq"/>

### GetLocalAddressesReq







<a name="qrl.GetLocalAddressesResp"/>

### GetLocalAddressesResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |






<a name="qrl.GetNodeStateReq"/>

### GetNodeStateReq
Represents a query to get node state






<a name="qrl.GetNodeStateResp"/>

### GetNodeStateResp
Represents the reply message to node state query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| info | [NodeInfo](#qrl.NodeInfo) |  |  |






<a name="qrl.GetObjectReq"/>

### GetObjectReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| query | [bytes](#bytes) |  |  |






<a name="qrl.GetObjectResp"/>

### GetObjectResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| found | [bool](#bool) |  |  |
| address_state | [AddressState](#qrl.AddressState) |  |  |
| transaction | [TransactionExtended](#qrl.TransactionExtended) |  |  |
| block_extended | [BlockExtended](#qrl.BlockExtended) |  |  |






<a name="qrl.GetPeersStatReq"/>

### GetPeersStatReq
Represents a query to get connected peers stat






<a name="qrl.GetPeersStatResp"/>

### GetPeersStatResp
Represents the reply message to peers stat query


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peers_stat | [PeerStat](#qrl.PeerStat) | repeated | PeerState object contains peer_ip, port and peer state information |






<a name="qrl.GetStatsReq"/>

### GetStatsReq
Represents a query to get statistics about node


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| include_timeseries | [bool](#bool) |  | Boolean to define if block timeseries should be included in reply or not |






<a name="qrl.GetStatsResp"/>

### GetStatsResp
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

### LRUStateCache







<a name="qrl.LatticePK"/>

### LatticePK



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| txhash | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |
| kyber_pk | [bytes](#bytes) |  |  |






<a name="qrl.LatticePublicKeyTxnReq"/>

### LatticePublicKeyTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| kyber_pk | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.MessageTxnReq"/>

### MessageTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| message | [bytes](#bytes) |  |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.NodeChainState"/>

### NodeChainState



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| header_hash | [bytes](#bytes) |  |  |
| cumulative_difficulty | [bytes](#bytes) |  |  |
| timestamp | [uint64](#uint64) |  |  |






<a name="qrl.NodeHeaderHash"/>

### NodeHeaderHash



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  |  |
| headerhashes | [bytes](#bytes) | repeated |  |






<a name="qrl.NodeInfo"/>

### NodeInfo



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






<a name="qrl.P2PAcknowledgement"/>

### P2PAcknowledgement



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| bytes_processed | [uint32](#uint32) |  |  |






<a name="qrl.Peer"/>

### Peer



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ip | [string](#string) |  |  |






<a name="qrl.PeerInfo"/>

### PeerInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_ip | [bytes](#bytes) |  |  |
| port | [uint32](#uint32) |  |  |
| banned_timestamp | [uint32](#uint32) |  |  |
| credibility | [uint32](#uint32) |  |  |
| last_connections_timestamp | [uint32](#uint32) | repeated |  |






<a name="qrl.PeerStat"/>

### PeerStat



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_ip | [bytes](#bytes) |  |  |
| port | [uint32](#uint32) |  |  |
| node_chain_state | [NodeChainState](#qrl.NodeChainState) |  |  |






<a name="qrl.Peers"/>

### Peers



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peer_info_list | [PeerInfo](#qrl.PeerInfo) | repeated |  |






<a name="qrl.PushTransactionReq"/>

### PushTransactionReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transaction_signed | [Transaction](#qrl.Transaction) |  |  |






<a name="qrl.PushTransactionResp"/>

### PushTransactionResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error_code | [PushTransactionResp.ResponseCode](#qrl.PushTransactionResp.ResponseCode) |  |  |
| error_description | [string](#string) |  |  |
| tx_hash | [bytes](#bytes) |  |  |






<a name="qrl.SlaveTxnReq"/>

### SlaveTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| slave_pks | [bytes](#bytes) | repeated |  |
| access_types | [uint32](#uint32) | repeated |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |






<a name="qrl.StateLoader"/>

### StateLoader



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addresses | [bytes](#bytes) | repeated |  |
| token_txhash | [bytes](#bytes) | repeated |  |
| txhash | [bytes](#bytes) | repeated |  |
| total_coin_supply | [uint64](#uint64) |  |  |






<a name="qrl.StateObjects"/>

### StateObjects



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| state_loaders | [bytes](#bytes) | repeated |  |






<a name="qrl.StoredPeers"/>

### StoredPeers



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| peers | [Peer](#qrl.Peer) | repeated |  |






<a name="qrl.TokenList"/>

### TokenList



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) | repeated |  |






<a name="qrl.TokenMetadata"/>

### TokenMetadata



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) |  |  |
| transfer_token_tx_hashes | [bytes](#bytes) | repeated |  |






<a name="qrl.TokenTxnReq"/>

### TokenTxnReq



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

### Transaction



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

### Transaction.CoinBase



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addr_to | [bytes](#bytes) |  |  |
| amount | [uint64](#uint64) |  |  |






<a name="qrl.Transaction.LatticePublicKey"/>

### Transaction.LatticePublicKey



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| kyber_pk | [bytes](#bytes) |  |  |
| dilithium_pk | [bytes](#bytes) |  |  |






<a name="qrl.Transaction.Message"/>

### Transaction.Message



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| message_hash | [bytes](#bytes) |  |  |






<a name="qrl.Transaction.Slave"/>

### Transaction.Slave



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| slave_pks | [bytes](#bytes) | repeated |  |
| access_types | [uint32](#uint32) | repeated |  |






<a name="qrl.Transaction.Token"/>

### Transaction.Token



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| symbol | [bytes](#bytes) |  |  |
| name | [bytes](#bytes) |  |  |
| owner | [bytes](#bytes) |  |  |
| decimals | [uint64](#uint64) |  |  |
| initial_balances | [AddressAmount](#qrl.AddressAmount) | repeated |  |






<a name="qrl.Transaction.Transfer"/>

### Transaction.Transfer



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| addrs_to | [bytes](#bytes) | repeated |  |
| amounts | [uint64](#uint64) | repeated |  |






<a name="qrl.Transaction.TransferToken"/>

### Transaction.TransferToken



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_txhash | [bytes](#bytes) |  |  |
| addrs_to | [bytes](#bytes) | repeated |  |
| amounts | [uint64](#uint64) | repeated |  |






<a name="qrl.TransactionCount"/>

### TransactionCount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| count | [TransactionCount.CountEntry](#qrl.TransactionCount.CountEntry) | repeated |  |






<a name="qrl.TransactionCount.CountEntry"/>

### TransactionCount.CountEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [uint32](#uint32) |  |  |
| value | [uint32](#uint32) |  |  |






<a name="qrl.TransactionExtended"/>

### TransactionExtended



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [BlockHeader](#qrl.BlockHeader) |  |  |
| tx | [Transaction](#qrl.Transaction) |  |  |
| addr_from | [bytes](#bytes) |  |  |
| size | [uint64](#uint64) |  |  |
| timestamp_seconds | [uint64](#uint64) |  |  |






<a name="qrl.TransferCoinsReq"/>

### TransferCoinsReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  | Transaction source address |
| addresses_to | [bytes](#bytes) | repeated | Transaction destination address |
| amounts | [uint64](#uint64) | repeated | Amount. It should be expressed in Shor |
| fee | [uint64](#uint64) |  | Fee. It should be expressed in Shor |
| xmss_pk | [bytes](#bytes) |  | XMSS Public key |






<a name="qrl.TransferCoinsResp"/>

### TransferCoinsResp



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| extended_transaction_unsigned | [TransactionExtended](#qrl.TransactionExtended) |  |  |






<a name="qrl.TransferTokenTxnReq"/>

### TransferTokenTxnReq



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| master_addr | [bytes](#bytes) |  |  |
| addresses_to | [bytes](#bytes) | repeated |  |
| token_txhash | [bytes](#bytes) |  |  |
| amounts | [uint64](#uint64) | repeated |  |
| fee | [uint64](#uint64) |  |  |
| xmss_pk | [bytes](#bytes) |  |  |





 


<a name="qrl.GetLatestDataReq.Filter"/>

### GetLatestDataReq.Filter


| Name | Number | Description |
| ---- | ------ | ----------- |
| ALL | 0 |  |
| BLOCKHEADERS | 1 |  |
| TRANSACTIONS | 2 |  |
| TRANSACTIONS_UNCONFIRMED | 3 |  |



<a name="qrl.NodeInfo.State"/>

### NodeInfo.State


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| UNSYNCED | 1 |  |
| SYNCING | 2 |  |
| SYNCED | 3 |  |
| FORKED | 4 |  |



<a name="qrl.PushTransactionResp.ResponseCode"/>

### PushTransactionResp.ResponseCode


| Name | Number | Description |
| ---- | ------ | ----------- |
| UNKNOWN | 0 |  |
| ERROR | 1 |  |
| VALIDATION_FAILED | 2 |  |
| SUBMITTED | 3 |  |


 

 


<a name="qrl.AdminAPI"/>

### AdminAPI
This is a place holder for testing/instrumentation APIs

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|


<a name="qrl.PublicAPI"/>

### PublicAPI
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

 



## Scalar Value Types

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

