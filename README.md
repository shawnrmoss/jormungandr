# jormungandr
Run a Jormungandr node on the Shelley testnet of the Cardano blockchain

## Instructions
Clone and build image:
```bash
git clone https://github.com/shawnrmoss/jormungandr
cd jormungandr
docker build -t jormungandr .
```
Run image:
```bash
docker run -d jormungandr
```
Find container ID with:
```bash
docker ps
```
Logs:
```bash
docker logs -f <container_ID>
```
Interact with bash:
```bash
docker exec -it <container_ID> bash
```

[docs](https://input-output-hk.github.io/jormungandr/introduction.html)<br/>
[official github](https://github.com/input-output-hk/jormungandr)
