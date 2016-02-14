#!/bin/sh

confd -log-level="debug" -onetime -backend env 
exec /bin/bash
