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

Get the version you want from https://deploy.foilen.com/foilen-haproxy/ .

```bash
wget https://deploy.foilen.com/foilen-haproxy/foilen-haproxy_X.X.X_amd64.deb
sudo dpkg -i foilen-haproxy_X.X.X_amd64.deb
```
