# About

This is to build HA Proxy with some of its libraries statically linked.

# Local Usage

## Compile

`./create-local-release.sh`

The file is then in `build/haproxy/haproxy`

# Create release

`./create-public-release.sh`

That will show the latest created version. Then, you can choose one and execute:
`./create-public-release.sh X.X.X`

# Use with debian

```bash
echo "deb https://dl.bintray.com/foilen/debian stable main" | sudo tee /etc/apt/sources.list.d/foilen.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
sudo apt update
sudo apt install foilen-haproxy
```
