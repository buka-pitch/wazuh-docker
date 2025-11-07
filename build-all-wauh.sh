#!/bin/bash
# build-all-wazuh.sh

set -e

echo "=== Building All Wazuh 4.14.0 Components for Older CPUs ==="

# Build Wazuh Indexer
echo "1. Building Wazuh Indexer..."
docker build -t wazuh-indexer-compatible:4.14.0 -f Dockerfile.wazuh-indexer-compatible .

# Build Wazuh Manager
echo "2. Building Wazuh Manager..."
docker build -t wazuh-manager-compatible:4.14.0 -f Dockerfile.wazuh-manager-compatible .

# Build Wazuh Dashboard
echo "3. Building Wazuh Dashboard..."
docker build -t wazuh-dashboard-compatible:4.14.0 -f Dockerfile.wazuh-dashboard-compatible .

echo "=== All Images Built Successfully ==="
echo ""
echo "Images created:"
echo "  - wazuh-indexer-compatible:4.14.0"
echo "  - wazuh-manager-compatible:4.14.0"
echo "  - wazuh-dashboard-compatible:4.14.0"
echo ""
echo "To deploy: docker-compose -f docker-compose-custom.yml up -d"