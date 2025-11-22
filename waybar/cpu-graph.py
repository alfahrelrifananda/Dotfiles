#!/usr/bin/env python3
import json
import time

# Unicode block characters for graph (8 levels)
BLOCKS = ['▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']

# History file to store past CPU values
HISTORY_FILE = '/tmp/waybar_cpu_history.txt'
HISTORY_LENGTH = 5  # Number of bars in the graph

def get_cpu_usage():
    """Get current CPU usage percentage"""
    with open('/proc/stat', 'r') as f:
        line = f.readline()
        fields = line.split()
        
    # Calculate CPU times
    idle = int(fields[4])
    total = sum(int(x) for x in fields[1:])
    
    return idle, total

def calculate_cpu_percent(idle1, total1, idle2, total2):
    """Calculate CPU percentage between two readings"""
    idle_delta = idle2 - idle1
    total_delta = total2 - total1
    
    if total_delta == 0:
        return 0
    
    usage = 100.0 * (1.0 - idle_delta / total_delta)
    return max(0, min(100, usage))

def load_history():
    """Load CPU history from file"""
    try:
        with open(HISTORY_FILE, 'r') as f:
            history = [float(x) for x in f.read().strip().split(',') if x]
            return history[-HISTORY_LENGTH:]
    except:
        return []

def save_history(history):
    """Save CPU history to file"""
    try:
        with open(HISTORY_FILE, 'w') as f:
            f.write(','.join(str(x) for x in history))
    except:
        pass

def value_to_block(value):
    """Convert CPU percentage to block character"""
    index = int(value / 100 * (len(BLOCKS) - 1))
    return BLOCKS[min(index, len(BLOCKS) - 1)]

def create_graph(history):
    """Create sparkline graph from history"""
    if not history:
        return '▁' * HISTORY_LENGTH
    
    # Pad history if needed
    while len(history) < HISTORY_LENGTH:
        history.insert(0, 0)
    
    return ''.join(value_to_block(v) for v in history)

# Get CPU measurements
idle1, total1 = get_cpu_usage()
time.sleep(0.5)
idle2, total2 = get_cpu_usage()

# Calculate current CPU usage
cpu_percent = calculate_cpu_percent(idle1, total1, idle2, total2)

# Load history and add current reading
history = load_history()
history.append(cpu_percent)
history = history[-HISTORY_LENGTH:]  # Keep only recent history
save_history(history)

# Create graph
graph = create_graph(history)

# Format output
text = f"{graph}"
tooltip = f"CPU Usage: {cpu_percent:.1f}%\nGraph shows last {HISTORY_LENGTH} readings"

output = {
    "text": text,
    "tooltip": tooltip,
    "class": "cpu-graph",
    "percentage": int(cpu_percent)
}

print(json.dumps(output))
