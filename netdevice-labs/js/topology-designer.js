/**
 * NETWORK TOPOLOGY DESIGNER - FULLY FIXED VERSION
 * All bugs resolved: Load topology, Undo/Redo, Tool toggle
 */

// ===== CANVAS SETUP =====
const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

// State variables
let devices = [];
let connections = [];
let history = [];
let historyIndex = -1;
let currentTool = null;
let selectedDevice = null;
let draggedDevice = null;
let cableFrom = null;
let zoom = 1;

// Resize canvas
function resizeCanvas() {
    canvas.width = canvas.parentElement.clientWidth;
    canvas.height = canvas.parentElement.clientHeight - 100;
    draw();
}
resizeCanvas();
window.addEventListener('resize', resizeCanvas);

// ===== DEVICE CLASS =====
class Device {
    constructor(type, x, y, id = null) {
        this.id = id || Date.now() + Math.random();
        this.type = type;
        this.x = x;
        this.y = y;
        this.width = 70;
        this.height = 70;
        this.name = `${type.toUpperCase()}_${devices.length + 1}`;
        this.ip = '';
        this.color = this.getColor();
        this.icon = this.getIcon();
    }

    getColor() {
        const colors = { 
            pc: '#3498db', 
            router: '#e74c3c', 
            server: '#2ecc71' 
        };
        return colors[this.type] || '#95a5a6';
    }

    getIcon() {
        const icons = { pc: '💻', router: '🔀', server: '🖥️' };
        return icons[this.type] || '📦';
    }

    draw(ctx, isSelected = false) {
        const connected = this.getConnections().length > 0;
        
        // Shadow
        ctx.shadowColor = 'rgba(0, 0, 0, 0.2)';
        ctx.shadowBlur = 10;
        ctx.shadowOffsetX = 0;
        ctx.shadowOffsetY = 4;

        // Device box
        ctx.fillStyle = this.color;
        ctx.fillRect(
            (this.x - this.width/2) * zoom, 
            (this.y - this.height/2) * zoom, 
            this.width * zoom, 
            this.height * zoom
        );

        // Reset shadow
        ctx.shadowColor = 'transparent';
        ctx.shadowBlur = 0;

        // Border
        ctx.strokeStyle = isSelected ? '#FFD700' : '#333';
        ctx.lineWidth = isSelected ? 4 : 2;
        ctx.strokeRect(
            (this.x - this.width/2) * zoom, 
            (this.y - this.height/2) * zoom, 
            this.width * zoom, 
            this.height * zoom
        );

        // Icon
        ctx.font = `bold ${32 * zoom}px Arial`;
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillStyle = '#fff';
        ctx.fillText(this.icon, this.x * zoom, this.y * zoom);

        // Name
        ctx.font = `bold ${12 * zoom}px Arial`;
        ctx.fillStyle = '#333';
        ctx.fillText(this.name, this.x * zoom, (this.y + 45) * zoom);

        // IP Address
        if (this.ip) {
            ctx.font = `${10 * zoom}px Arial`;
            ctx.fillStyle = '#666';
            ctx.fillText(this.ip, this.x * zoom, (this.y + 60) * zoom);
        }

        // Connection indicator
        if (connected) {
            ctx.fillStyle = '#28a745';
            ctx.beginPath();
            ctx.arc(
                (this.x + 30) * zoom, 
                (this.y - 30) * zoom, 
                8 * zoom, 
                0, 
                2 * Math.PI
            );
            ctx.fill();
        }
    }

    contains(x, y) {
        return x >= this.x - this.width/2 && x <= this.x + this.width/2 &&
               y >= this.y - this.height/2 && y <= this.y + this.height/2;
    }

    getConnections() {
        return connections.filter(c => c.from === this.id || c.to === this.id);
    }
}

// ===== CONNECTION CLASS =====
class Connection {
    constructor(fromId, toId, id = null) {
        this.id = id || Date.now() + Math.random();
        this.from = fromId;
        this.to = toId;
        this.label = `Cable_${connections.length + 1}`;
    }

    draw(ctx) {
        const fromDevice = devices.find(d => d.id === this.from);
        const toDevice = devices.find(d => d.id === this.to);

        if (fromDevice && toDevice) {
            // Line
            ctx.strokeStyle = '#666';
            ctx.lineWidth = 3;
            ctx.beginPath();
            ctx.moveTo(fromDevice.x * zoom, fromDevice.y * zoom);
            ctx.lineTo(toDevice.x * zoom, toDevice.y * zoom);
            ctx.stroke();

            // Label background
            const midX = (fromDevice.x + toDevice.x) / 2;
            const midY = (fromDevice.y + toDevice.y) / 2;
            
            ctx.fillStyle = '#fff';
            ctx.strokeStyle = '#666';
            ctx.lineWidth = 1;
            ctx.fillRect(
                (midX - 40) * zoom, 
                (midY - 10) * zoom, 
                80 * zoom, 
                20 * zoom
            );
            ctx.strokeRect(
                (midX - 40) * zoom, 
                (midY - 10) * zoom, 
                80 * zoom, 
                20 * zoom
            );

            // Label text
            ctx.font = `bold ${11 * zoom}px Arial`;
            ctx.fillStyle = '#333';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.fillText(this.label, midX * zoom, midY * zoom);
        }
    }
}

// ===== DRAWING =====
function draw() {
    // Clear
    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    // Grid
    ctx.strokeStyle = '#e8e8e8';
    ctx.lineWidth = 1;
    const gridSize = 50 * zoom;
    for (let x = 0; x < canvas.width; x += gridSize) {
        ctx.beginPath();
        ctx.moveTo(x, 0);
        ctx.lineTo(x, canvas.height);
        ctx.stroke();
    }
    for (let y = 0; y < canvas.height; y += gridSize) {
        ctx.beginPath();
        ctx.moveTo(0, y);
        ctx.lineTo(canvas.width, y);
        ctx.stroke();
    }

    // Temp cable
    if (currentTool === 'cable' && cableFrom) {
        const fromDevice = devices.find(d => d.id === cableFrom);
        if (fromDevice && canvas.mouseX && canvas.mouseY) {
            ctx.strokeStyle = '#FFD700';
            ctx.lineWidth = 3;
            ctx.setLineDash([5, 5]);
            ctx.beginPath();
            ctx.moveTo(fromDevice.x * zoom, fromDevice.y * zoom);
            ctx.lineTo(canvas.mouseX, canvas.mouseY);
            ctx.stroke();
            ctx.setLineDash([]);
        }
    }

    // Connections
    connections.forEach(conn => conn.draw(ctx));

    // Devices
    devices.forEach(device => {
        device.draw(ctx, device.id === selectedDevice?.id);
    });

    updateStats();
}

// ===== TOOLS =====
function setTool(tool) {
    // Toggle tool - if clicking same tool, deselect it
    if (currentTool === tool) {
        currentTool = null;
        cableFrom = null;
        document.querySelectorAll('.tool-btn').forEach(btn => btn.classList.remove('active'));
        canvas.style.cursor = 'default';
    } else {
        currentTool = tool;
        cableFrom = null;
        
        document.querySelectorAll('.tool-btn').forEach(btn => btn.classList.remove('active'));
        const btnId = `btn-${tool}`;
        const btn = document.getElementById(btnId);
        if (btn) btn.classList.add('active');
        
        if (tool === 'cable' || tool === 'delete' || tool === 'duplicate') {
            canvas.style.cursor = 'crosshair';
        } else {
            canvas.style.cursor = 'pointer';
        }
    }
    
    updateInstructions();
}

function updateInstructions() {
    const instructions = {
        'pc': '💡 Click on canvas to add a PC (Click tool again to deselect)',
        'router': '💡 Click on canvas to add a Router (Click tool again to deselect)',
        'server': '💡 Click on canvas to add a Server (Click tool again to deselect)',
        'cable': '💡 Click first device, then second device to connect',
        'delete': '💡 Click on device to delete it',
        'duplicate': '💡 Click on device to duplicate it',
        null: '💡 Select a tool from the left panel (or click devices to edit)'
    };
    document.getElementById('instructions').textContent = instructions[currentTool] || instructions[null];
}

// ===== HISTORY (COMPLETELY FIXED) =====
function saveHistory() {
    // Remove future history if we're not at the end
    if (historyIndex < history.length - 1) {
        history = history.slice(0, historyIndex + 1);
    }
    
    // Deep clone current state
    const state = {
        devices: devices.map(d => ({...d})),
        connections: connections.map(c => ({...c}))
    };
    
    history.push(state);
    historyIndex = history.length - 1;
    
    // Limit to 50 states
    if (history.length > 50) {
        history.shift();
        historyIndex = history.length - 1;
    }
}

function undo() {
    if (historyIndex > 0) {
        historyIndex--;
        restoreState(history[historyIndex]);
    } else {
        console.log('Nothing to undo');
    }
}

function redo() {
    if (historyIndex < history.length - 1) {
        historyIndex++;
        restoreState(history[historyIndex]);
    } else {
        console.log('Nothing to redo');
    }
}

function restoreState(state) {
    // Deep clone to avoid reference issues
    devices = state.devices.map(d => {
        const device = new Device(d.type, d.x, d.y, d.id);
        device.name = d.name;
        device.ip = d.ip;
        device.color = d.color;
        device.icon = d.icon;
        return device;
    });
    
    connections = state.connections.map(c => {
        const conn = new Connection(c.from, c.to, c.id);
        conn.label = c.label;
        return conn;
    });
    
    selectedDevice = null;
    updateProperties();
    draw();
}

// ===== CANVAS EVENTS =====
canvas.addEventListener('mousedown', (e) => {
    const rect = canvas.getBoundingClientRect();
    const x = (e.clientX - rect.left) / zoom;
    const y = (e.clientY - rect.top) / zoom;

    if (currentTool === 'pc' || currentTool === 'router' || currentTool === 'server') {
        const device = new Device(currentTool, x, y);
        devices.push(device);
        saveHistory();
        draw();
    } else if (currentTool === 'cable') {
        const device = devices.find(d => d.contains(x, y));
        if (device) {
            if (!cableFrom) {
                cableFrom = device.id;
            } else {
                if (device.id !== cableFrom) {
                    connections.push(new Connection(cableFrom, device.id));
                    saveHistory();
                }
                cableFrom = null;
            }
        }
        draw();
    } else if (currentTool === 'delete') {
        const device = devices.find(d => d.contains(x, y));
        if (device) {
            deleteDevice(device.id);
            saveHistory();
            draw();
        }
    } else if (currentTool === 'duplicate') {
        const device = devices.find(d => d.contains(x, y));
        if (device) {
            const newDevice = new Device(device.type, device.x + 60, device.y + 60);
            newDevice.name = device.name + '_Copy';
            newDevice.ip = device.ip;
            devices.push(newDevice);
            saveHistory();
            draw();
        }
    } else {
        const device = devices.find(d => d.contains(x, y));
        if (device) {
            selectedDevice = device;
            draggedDevice = device;
            updateProperties();
            draw();
        } else {
            selectedDevice = null;
            updateProperties();
            draw();
        }
    }
});

canvas.addEventListener('mousemove', (e) => {
    const rect = canvas.getBoundingClientRect();
    canvas.mouseX = e.clientX - rect.left;
    canvas.mouseY = e.clientY - rect.top;

    if (draggedDevice && !currentTool) {
        draggedDevice.x = canvas.mouseX / zoom;
        draggedDevice.y = canvas.mouseY / zoom;
        draw();
    } else if (currentTool === 'cable' && cableFrom) {
        draw();
    }
});

canvas.addEventListener('mouseup', () => {
    if (draggedDevice && !currentTool) {
        saveHistory();
    }
    draggedDevice = null;
});

// ===== DEVICE MANAGEMENT =====
function deleteDevice(id) {
    devices = devices.filter(d => d.id !== id);
    connections = connections.filter(c => c.from !== id && c.to !== id);
    if (selectedDevice?.id === id) {
        selectedDevice = null;
        updateProperties();
    }
}

function deleteSelected() {
    if (selectedDevice) {
        deleteDevice(selectedDevice.id);
        saveHistory();
        draw();
    }
}

// ===== PROPERTIES =====
function updateProperties() {
    const propsDiv = document.getElementById('device-properties');
    const noSelDiv = document.getElementById('no-selection');

    if (selectedDevice) {
        noSelDiv.style.display = 'none';
        propsDiv.style.display = 'block';

        document.getElementById('prop-type').textContent = selectedDevice.type.toUpperCase();
        document.getElementById('prop-name').value = selectedDevice.name;
        document.getElementById('prop-ip').value = selectedDevice.ip || '';
        
        const connected = selectedDevice.getConnections().length;
        const statusBadge = document.getElementById('prop-status');
        if (connected > 0) {
            statusBadge.textContent = 'Online';
            statusBadge.className = 'status-badge status-online';
        } else {
            statusBadge.textContent = 'Offline';
            statusBadge.className = 'status-badge status-offline';
        }
        
        document.getElementById('prop-connections').textContent = `${connected} device(s)`;

        document.getElementById('prop-name').onchange = () => {
            selectedDevice.name = document.getElementById('prop-name').value || selectedDevice.type;
            saveHistory();
            draw();
        };

        document.getElementById('prop-ip').onchange = () => {
            const ip = document.getElementById('prop-ip').value;
            if (validateIP(ip) || ip === '') {
                selectedDevice.ip = ip;
                saveHistory();
                draw();
            } else {
                alert('Invalid IP address! Use format: 192.168.1.1');
                document.getElementById('prop-ip').value = selectedDevice.ip;
            }
        };
    } else {
        noSelDiv.style.display = 'block';
        propsDiv.style.display = 'none';
    }
}

function validateIP(ip) {
    if (ip === '') return true;
    const ipRegex = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
    return ipRegex.test(ip);
}

// ===== STATS =====
function updateStats() {
    document.getElementById('stats-devices').textContent = devices.length;
    document.getElementById('stats-connections').textContent = connections.length;
}

// ===== ZOOM =====
function zoomIn() {
    if (zoom < 1.5) {
        zoom += 0.1;
        updateZoom();
    }
}

function zoomOut() {
    if (zoom > 0.5) {
        zoom -= 0.1;
        updateZoom();
    }
}

function updateZoom() {
    document.getElementById('zoom-level').textContent = Math.round(zoom * 100) + '%';
    draw();
}

// ===== CONNECTIVITY CHECK =====
function showConnectivityCheck() {
    if (devices.length === 0) {
        alert('Add devices first!');
        return;
    }

    let results = '<div style="font-size: 13px;">';
    devices.forEach(device => {
        const connectedDevices = device.getConnections().map(conn => {
            const otherDevice = conn.from === device.id ? 
                devices.find(d => d.id === conn.to) : 
                devices.find(d => d.id === conn.from);
            return otherDevice?.name || 'Unknown';
        });

        const status = connectedDevices.length > 0 ? '✅ Online' : '❌ Offline';
        const color = connectedDevices.length > 0 ? '#28a745' : '#dc3545';

        results += `
            <div style="margin: 10px 0; padding: 12px; background: #f9f9f9; border-radius: 6px; border-left: 4px solid ${color};">
                <strong>${device.name}</strong> - ${status}
                ${device.ip ? `<br/><small>IP: ${device.ip}</small>` : ''}
                ${connectedDevices.length > 0 ? `<br/><small>Connected to: ${connectedDevices.join(', ')}</small>` : '<br/><small>Not connected</small>'}
            </div>
        `;
    });
    results += '</div>';
    
    document.getElementById('connectivity-results').innerHTML = results;
    document.getElementById('connectivityModal').classList.add('active');
}

// ===== MODALS =====
function closeModal(modalId) {
    document.getElementById(modalId).classList.remove('active');
}

function resetCanvas() {
    if (confirm('Delete everything?')) {
        devices = [];
        connections = [];
        selectedDevice = null;
        currentTool = null;
        history = [];
        historyIndex = -1;
        saveHistory();
        updateInstructions();
        draw();
    }
}

// ===== SAVE/LOAD (FIXED) =====
function saveTopologyModal() {
    if (devices.length === 0) {
        alert('Add devices first!');
        return;
    }
    document.getElementById('save-name').value = '';
    document.getElementById('saveModal').classList.add('active');
}

function saveTopology() {
    const name = document.getElementById('save-name').value.trim();
    if (!name) {
        alert('Enter a name!');
        return;
    }

    const data = {
        name: name,
        devices: devices,
        connections: connections
    };

    fetch('../php/save_topology.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            alert('✅ Saved!');
            closeModal('saveModal');
        } else {
            alert('❌ Error: ' + data.message);
        }
    })
    .catch(err => {
        console.error(err);
        alert('Error saving: ' + err);
    });
}

function loadTopologyModal() {
    fetch('../php/get_topologies.php')
    .then(r => r.json())
    .then(data => {
        if (data.success && data.topologies.length > 0) {
            let html = '';
            data.topologies.forEach(topo => {
                html += `
                    <div style="padding: 12px; margin: 8px 0; background: #f9f9f9; border-radius: 6px; cursor: pointer; border: 2px solid #ddd;" 
                         onclick="loadTopology(${topo.topology_id})"
                         onmouseover="this.style.borderColor='#667eea'"
                         onmouseout="this.style.borderColor='#ddd'">
                        <strong>${topo.topology_name}</strong><br>
                        <small style="color: #999;">${topo.created_at}</small>
                    </div>
                `;
            });
            document.getElementById('topology-list').innerHTML = html;
        } else {
            document.getElementById('topology-list').innerHTML = '<p style="color: #999; text-align: center; padding: 20px;">No saved topologies yet</p>';
        }
        document.getElementById('loadModal').classList.add('active');
    })
    .catch(err => {
        console.error(err);
        alert('Error loading list: ' + err);
    });
}

function loadTopology(id) {
    fetch(`../php/load_topology.php?id=${id}`)
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            // Reconstruct devices properly
            devices = data.devices.map(d => {
                const device = new Device(d.type, d.x, d.y, d.id);
                device.name = d.name;
                device.ip = d.ip || '';
                device.width = d.width || 70;
                device.height = d.height || 70;
                return device;
            });
            
            // Reconstruct connections properly
            connections = data.connections.map(c => {
                const conn = new Connection(c.from, c.to, c.id);
                conn.label = c.label;
                return conn;
            });
            
            // Reset history
            history = [];
            historyIndex = -1;
            saveHistory();
            
            selectedDevice = null;
            updateProperties();
            draw();
            closeModal('loadModal');
            alert('✅ Topology loaded successfully!');
        } else {
            alert('❌ Error: ' + (data.message || 'Failed to load'));
        }
    })
    .catch(err => {
        console.error(err);
        alert('Error loading topology: ' + err);
    });
}

// Initialize
saveHistory();
draw();
updateInstructions();