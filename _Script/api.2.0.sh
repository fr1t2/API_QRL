#!/bin/bash
#
#------ github updates --------

## update slate docs from my repo/branch
cd ${HOME}/repo/slate
git fetch origin
## Reset the local repo removing any changes before we pull
## Change the repo to the correcct origin if needed
git reset --hard origin/QRL
git pull

## update the QRL repo
cd ${HOME}/repo/qrl
git pull

## Move the proto file to our working directory
rsync -azPv ${HOME}/repo/qrl/src/qrl/protos/qrl.proto ${HOME}/manualAPI/examples/proto/


## Generate the docs from the .proto files using protoc-gen-doc
docker run --rm -v ${HOME}/manualAPI/examples/doc:/out -v ${HOME}/manualAPI/examples/proto/:/protos   pseudomuto/protoc-gen-doc --doc_opt=markdown,docs.md

docker run --rm -v ${HOME}/manualAPI/examples/doc:/out -v ${HOME}/manualAPI/examples/proto/:/protos   pseudomuto/protoc-gen-doc --doc_opt=json,docs.json

docker run --rm -v ${HOME}/manualAPI/examples/doc:/out -v ${HOME}/manualAPI/examples/proto/:/protos   pseudomuto/protoc-gen-doc --doc_opt=html,docs.html

docker run --rm -v ${HOME}/manualAPI/examples/doc:/out -v ${HOME}/manualAPI/examples/proto/:/protos   pseudomuto/protoc-gen-doc --doc_opt=docbook,docs.xml



### Pull out any ### to <a name in the docs.md file and strip the <a name> tag

#sed -n '/###/,/a name/p' ${HOME}/manualAPI/examples/doc/docs.md > ${HOME}/manualAPI/examples/doc/out.txt

# change "### to ##" and "## to #"
sed -i -e 's/##/#/g' ${HOME}/manualAPI/examples/doc/docs.md


# strip everything before # qrl.proto
sed '/# qrl.proto/,$!d' ${HOME}/manualAPI/examples/doc/docs.md > ${HOME}/manualAPI/examples/doc/out1.txt 

# Add blank line to beginning of file
sed -s -i '1i\\' ${HOME}/manualAPI/examples/doc/out1.txt

grep -vE "(<a name|# Table|<p|# Prot)" ${HOME}/manualAPI/examples/doc/out1.txt > ${HOME}/manualAPI/examples/doc/out2.txt

## converg front matter and API docs file
cat ${HOME}/repo/slate/front.txt ${HOME}/manualAPI/examples/doc/out2.txt > ${HOME}/manualAPI/examples/doc/QRL_index.html.md

cd ${HOME}/repo/slate
#git pull

### copy the index.html.md file we created into the root buld dir for slate
cp ${HOME}/manualAPI/examples/doc/QRL_index.html.md ${HOME}/repo/slate/QRL/

## Push the docs to the late directory
cd ${HOME}/repo/slate
git add .
git commit -m "AutoUpdating QRL_index.html.md, see the changes in the /QRL/QRL_index.html.md file"
git push

## Build the site
#cd ${HOME}/repo/slate
#bundle install
## Bundle the slate site up into static files
#bundle exec middleman build --clean 

#cp -r ${HOME}/repo/slate/build/* ${HOME}/site

## Move the site into the webroot and assign permissions
## Se webRootMove.sh

