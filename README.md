# Smart-EV-to-EV-wireless-charging-LI-Fi-Technology
Smart EV-to-EV wireless charging system using Li-Fi technology for efficient wireless power transfer between electric vehicles.

📌 Project Overview

Smart Charging with Li-Fi is an EV-to-EV wireless charging prototype that enables one electric vehicle to wirelessly transfer power to another electric vehicle using resonant inductive coupling.

The system combines **wireless power transfer, Li-Fi-based communication, embedded control, and IR-based proximity detection** to demonstrate cooperative charging between two electric vehicles without a physical charging cable.

The prototype consists of two vehicles:

- Front Vehicle – Receiving Unit: A low-battery EV that requests and receives wireless power.
- Rear Vehicle – Transmitting Unit: A higher-battery EV that detects the charging request and wirelessly transfers power.

🎯 Objectives

- Develop a prototype for EV-to-EV wireless power transfer.
- Enable communication between two vehicles using Li-Fi technology.
- Transfer electrical power through resonant inductive coupling without physical wires.
- Detect a low-battery condition and initiate a charging request.
- Maintain a safe operating distance between the two vehicles using IR-based detection.
- Demonstrate real-time coordination between communication, movement, safety, and charging subsystems.

⚙️ System Architecture

The system is divided into four major subsystems:

1. Power Transmission Module
2. Power Receiving Module
3. Li-Fi Communication Module
4. Distance Sensing and Safety Module

The AT89C52/89C52 microcontroller acts as the main control unit for the prototype.

Front Vehicle – Receiving Unit

The front vehicle contains:

- 89C52 microcontroller
- 8V, 1Ah rechargeable battery
- Receiving coil
- LC circuit
- Bridge rectifier
- Filter capacitor
- Flash light / LED-based Li-Fi transmitter
- DC motor
- Relay
- Digital voltmeter
- Control switches

When the battery level becomes low, the driver activates a control key. The LED/flashlight generates a blinking light signal that represents the charging request.


Rear Vehicle – Transmitting Unit

The rear vehicle contains:

- 89C52 microcontroller
- 12V, 7.5Ah rechargeable battery
- Solar panel for Li-Fi reception
- LM324 operational amplifier
- 16x2 LCD
- MOSFET-based push-pull oscillator
- Z44 power MOSFETs
- Transmitting coil
- Relay
- DC motor
- IR-based proximity detection system
- IC567 auto-stop circuit

The solar panel detects the light signal from the front vehicle. The signal is amplified and processed before being decoded by the microcontroller. Once a charging request is detected, the wireless power transmission circuit is activated.


🔄 Working Principle

The system operates through the following sequence:

1. Low-Battery Detection
The front vehicle operates using its rechargeable battery. When its battery level becomes low, the driver activates the request switch.

2. Li-Fi Communication
The LED/flashlight on the front vehicle transmits the request through rapidly switched light signals.

The communication path is:
LED / Flashlight
       ↓
   Light Signal
       ↓
   Solar Panel
       ↓
   LM324 Op-Amp
       ↓
  89C52 Microcontroller
       ↓
     LCD Display
      ↓
    12V Battery
     ↓
Push-Pull MOSFET Oscillator
     ↓
High-Frequency AC
     ↓
Transmitting Coil
     ↓
Alternating Magnetic Field
     ↓
Receiving Coil
     ↓
Bridge Rectifier
     ↓
Filter Capacitor
     ↓
DC Output
     ↓
8V Battery
