FROM jcs/hpcc-baseimage

EXPOSE 7100 7600 7601

# NB: seems to be a bug in logic to create log path.. creates mydafilesrv/mydafilesrv/

# "mydafilesrv" because dealing with generic environment
CMD ["/scripts/init/start-hpcccomp.sh", "dafilesrv", "mydafilesrv", "-I", "mydafilesrv"]
