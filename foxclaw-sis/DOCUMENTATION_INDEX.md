# Foxclaw OS - Skill Documentation Index

## Complete Skill Reference

### 📚 Documentation Structure

Each skill has comprehensive documentation:
- `SKILL.md` - Main skill documentation
- `README.md` - User guide
- `API.md` - API reference
- `EXAMPLES.md` - Usage examples
- `CHANGELOG.md` - Version history

---

## 🧠 Cognition Layer

### 1. brain-core
**Purpose**: Central cognitive architecture for intelligent agents

**Capabilities**:
- Multi-modal reasoning (deductive, inductive, abductive, creative)
- Decision making under uncertainty
- Problem solving and planning
- Self-awareness and metacognition

**Key Features**:
- Reasoning engine with 4 modes
- Decision framework
- Problem decomposition
- Solution synthesis

**Usage**:
```python
from foxclaw.cognition import Brain

brain = Brain()
result = brain.reason(problem, mode="creative")
decision = brain.decide(options, criteria)
```

**Documentation**: [brain-core/SKILL.md](brain-core/SKILL.md)

---

### 2. language-mastery
**Purpose**: Human-level communication across all platforms

**Capabilities**:
- Precise expression (concise/detailed/adaptive)
- Contextual awareness (audience/platform/timing)
- Human-like qualities (personality/emotion/imperfection)
- Creative expression (storytelling/metaphors/humor)

**Key Features**:
- PREP communication method
- Platform-specific optimization
- Emotional intelligence
- Creative writing modes

**Usage**:
```python
from foxclaw.cognition import Language

lang = Language()
response = lang.express(message, style="adaptive", platform="discord")
```

**Documentation**: [language-mastery/SKILL.md](language-mastery/SKILL.md)

---

## 💾 Memory Layer

### 3. hierarchical-memory
**Purpose**: 4-level hierarchical reporting system (daily/weekly/monthly/yearly)

**Capabilities**:
- Automatic report generation
- Multi-dimensional retrieval
- Smart retention policies
- Cross-period analysis

**Key Features**:
- 4-level hierarchy
- 5-dimensional classification
- Automatic cleanup
- Scientific retrieval

**Usage**:
```python
from foxclaw.memory import HierarchicalMemory

memory = HierarchicalMemory()
memory.generate_daily_report()
results = memory.query(time="last_week", topic="system")
```

**Documentation**: [hierarchical-memory/SKILL.md](hierarchical-memory/SKILL.md)

---

### 4. knowledge-base
**Purpose**: Document management and conversion to knowledge repository

**Capabilities**:
- Multi-format conversion (PDF/DOC/PPT/TXT → MD)
- Auto-categorization (7 categories)
- Index generation
- Cloud synchronization

**Key Features**:
- Format conversion
- Smart categorization
- Full-text indexing
- Multi-cloud sync

**Usage**:
```python
from foxclaw.memory import KnowledgeBase

kb = KnowledgeBase()
kb.process_documents()
kb.sync_to_cloud()
```

**Documentation**: [knowledge-base/SKILL.md](knowledge-base/SKILL.md)

---

### 5. memory-recovery
**Purpose**: Anti-amnesia protection and emergency recovery

**Capabilities**:
- Complete system restore
- Selective recovery
- Identity restoration
- Skill system recovery

**Key Features**:
- Multiple recovery modes
- Backup verification
- Automatic healing
- Recovery reporting

**Usage**:
```python
from foxclaw.memory import MemoryRecovery

recovery = MemoryRecovery()
recovery.restore_from_backup("latest.zip", mode="full")
```

**Documentation**: [memory-recovery/SKILL.md](memory-recovery/SKILL.md)

---

## 🔄 Evolution Layer

### 6. cognitive-evolution
**Purpose**: Self-improving intelligence through continuous optimization

**Capabilities**:
- Pattern recognition
- Guideline evolution
- Meta-learning
- Performance optimization

**Key Features**:
- Daily reflection
- Weekly meta-analysis
- Monthly paradigm shifts
- Continuous micro-evolution

**Usage**:
```python
from foxclaw.evolution import CognitiveEvolution

evolution = CognitiveEvolution()
evolution.reflect_daily()
evolution.optimize_guidelines()
```

**Documentation**: [cognitive-evolution/SKILL.md](cognitive-evolution/SKILL.md)

---

### 7. ops-logger
**Purpose**: Activity tracking and system operation logging

**Capabilities**:
- Task execution logging
- Performance monitoring
- Error tracking
- Audit trail

**Key Features**:
- Structured logging
- Log rotation
- Search and analysis
- Health monitoring

**Usage**:
```python
from foxclaw.evolution import OpsLogger

logger = OpsLogger()
logger.log_operation("task_name", "status", details)
```

**Documentation**: [ops-logger/SKILL.md](ops-logger/SKILL.md)

---

## 🔌 Plugin Ecosystem Layer

### 8. plugin-manager
**Purpose**: Plugin installation, management, and lifecycle

**Capabilities**:
- Plugin discovery
- Installation/removal
- Version management
- Dependency resolution

**Key Features**:
- Multi-source support
- Automatic updates
- Conflict resolution
- Rollback capability

**Usage**:
```python
from foxclaw.plugins import PluginManager

pm = PluginManager()
pm.install("skill-name")
pm.update_all()
```

**Documentation**: [plugin-manager/SKILL.md](plugin-manager/SKILL.md)

---

### 9. skill-index-sync
**Purpose**: Automatic synchronization with external skill indexes

**Capabilities**:
- Multi-source sync (awesome-openclaw-skills, registry, etc.)
- Daily automatic discovery
- Quality evaluation
- Smart integration

**Key Features**:
- Scheduled sync
- New skill detection
- Auto-install option
- Update notifications

**Usage**:
```python
from foxclaw.plugins import SkillIndexSync

sync = SkillIndexSync()
sync.sync_source("awesome-openclaw-skills")
```

**Documentation**: [skill-index-sync/SKILL.md](skill-index-sync/SKILL.md)

---

### 10. plugin-security-guard
**Purpose**: Security and quality assurance for plugins

**Capabilities**:
- 5-layer security scanning
- Sandboxed testing
- Permission control
- Runtime monitoring

**Key Features**:
- Static analysis
- Dynamic analysis
- Risk classification
- Incident response

**Usage**:
```python
from foxclaw.plugins import SecurityGuard

guard = SecurityGuard()
report = guard.scan(plugin_file)
if report.is_safe():
    plugin.install()
```

**Documentation**: [plugin-security-guard/SKILL.md](plugin-security-guard/SKILL.md)

---

### 11. plugin-optimizer
**Purpose**: Performance tuning and lifecycle management

**Capabilities**:
- Performance optimization
- Dependency management
- Configuration tuning
- Update management

**Key Features**:
- Health scoring
- Auto-optimization
- Update scheduling
- Lifecycle management

**Usage**:
```python
from foxclaw.plugins import PluginOptimizer

optimizer = PluginOptimizer()
optimizer.run_optimization()
suggestions = optimizer.get_recommendations()
```

**Documentation**: [plugin-optimizer/SKILL.md](plugin-optimizer/SKILL.md)

---

## 🛠️ Execution Layer

### 12. cloud-sync
**Purpose**: Multi-cloud backup synchronization

**Capabilities**:
- Multi-cloud support (天翼云盘, Google Drive, OneDrive, Dropbox)
- Automatic sync
- Version management
- Disaster recovery

**Key Features**:
- Multi-platform support
- Scheduled sync
- Incremental backup
- Cross-platform access

**Usage**:
```python
from foxclaw.execution import CloudSync

sync = CloudSync()
sync.sync_to_cloud()
```

**Documentation**: [cloud-sync/SKILL.md](cloud-sync/SKILL.md)

---

### 13. watchdog-keepalive
**Purpose**: System keepalive and cloud PC prevention

**Capabilities**:
- Prevent system sleep
- Simulate user activity
- Monitor system status
- Automatic recovery

**Key Features**:
- Windows API integration
- Mouse/keyboard simulation
- Network keepalive
- 24/7 operation

**Usage**:
```python
from foxclaw.execution import Watchdog

watchdog = Watchdog()
watchdog.start_monitoring()
```

**Documentation**: [watchdog-keepalive/SKILL.md](watchdog-keepalive/SKILL.md)

---

## ❤️ Life Support Layer

### 14. life-support
**Purpose**: Health monitoring and self-healing system

**Capabilities**:
- Real-time health monitoring
- Self-diagnostics
- Performance metrics
- Automatic recovery

**Key Features**:
- Vital signs monitoring
- Anomaly detection
- Self-healing protocols
- Health reporting

**Usage**:
```python
from foxclaw.life import LifeSupport

life = LifeSupport()
life.check_health()
life.self_heal_if_needed()
```

**Documentation**: [life-support/SKILL.md](life-support/SKILL.md)

---

## 📖 Additional Documentation

### System-Level Documentation
- [Foxclaw OS Overview](SKILL.md)
- [Plugin Ecosystem](PLUGIN_ECOSYSTEM.md)
- [Memory Retrieval Guide](MEMORY_RETRIEVAL.md)
- [Memory Classification](MEMORY_CLASSIFICATION.md)

### Integration Guides
- [OpenClaw Integration](integrations/openclaw.md)
- [Claude Code Integration](integrations/claude.md)
- [Standalone Deployment](integrations/standalone.md)

### Development
- [Plugin Development Kit](development/pdk.md)
- [API Reference](development/api.md)
- [Contributing Guide](development/contributing.md)

---

## 🔗 Quick Links

- **GitHub**: github.com/foxclaw/foxclaw-os
- **Registry**: registry.openclaw.ai
- **Community**: discord.gg/foxclaw
- **Documentation**: docs.foxclaw.ai

---

*Complete documentation for the intelligent agent operating system*
