# 🔁 Auto IP Changer

**Auto IP Changer** is an advanced IP rotation tool designed for ethical hackers, privacy enthusiasts, and cybersecurity learners.  
It works by launching multiple Tor nodes in parallel and routing traffic through a centralized Privoxy proxy server — enabling users to automatically change their public IP address at customizable intervals.

Whether you're conducting anonymous security research or learning how anonymization networks like Tor work, Auto IP Changer provides a lightweight and powerful CLI-based solution — especially built for **Termux** and **Linux-based systems**.

---

## 🎯 Purpose of Auto IP Changer

When working in the cybersecurity field or doing web reconnaissance, constantly changing your IP address can help avoid detection, rate-limiting, and geo-restrictions.  
Most users rely on VPNs, but VPNs are centralized services and not always transparent. Tor, on the other hand, offers a decentralized and free solution for anonymity.

**Auto IP Changer** combines:
- Multiple Tor instances (multi-node parallelization)
- A central Privoxy proxy server
- IP rotation automation via control ports

All packaged in a simple tool with beginner-friendly configuration and advanced functionality under the hood.

---

## 🚀 Features

- 🔁 **Auto IP Rotation** using the Tor Network
- 🧠 **Multiple Tor Nodes**: Five nodes running simultaneously
- 🔒 **Privacy-focused**: All traffic routed through a secure proxy
- 🧱 **No Root Required**: Fully works on non-rooted Termux devices
- 📟 **Custom Rotation Timer**: Set your own rotation interval in seconds
- 🧰 **Self-contained Configuration**: Cleans and reinitializes on every run
- 💻 **Termux + Linux Compatible**
- 👨‍💻 **Developed by Ethical Hackers** for Educational Use

---

## 📺 Facebook Profile

This tool is developed and maintained by **Shahariar Zaman** :
[![FACEBOOK](https://img.shields.io/badge/Contact%20On-Facebook-blue?style=for-the-badge\&logo=facebook)]([https://www.facebook.com/share/14UX3r7kVz5/](https://www.facebook.com/i.am.shahariarzaman))

On this profile, you'll find beginner-friendly tutorials, practical tips & tricks, and deep explanations of tools like this one — all tailored for Indian learners and mobile users.

Make sure to **Follow** and **Support** the creator if this tool helps you! 🙌

---

## ⚙️ How Auto IP Changer Works

1. **Five separate Tor nodes** are launched with their own config files and data directories.
2. A **Privoxy proxy** is set up and configured to forward all traffic across the 5 Tor nodes.
3. A control loop sends **SIGNAL NEWNYM** to all control ports every X seconds (your interval).
4. Your current **public IP** is fetched and displayed from `https://api64.ipify.org`.
5. Your **IP changes automatically**, as if you're hopping across networks — hence the name *Auto IP Changer*.

---

## 💡 Use Cases

- 🔍 Safe and anonymous reconnaissance
- 🌐 Bypassing soft IP rate-limits during testing
- 🛡️ Practicing anonymity techniques
- 📚 Cybersecurity learning labs
- 🔬 Testing how websites respond to changing IPs

---

## 📄 Disclaimer

> ⚠️ **This tool is created strictly for educational and ethical purposes.**
>
> - You **must not** use this tool for illegal activity, unauthorized scanning, or attacking any network you do not own or have permission to test.
> - This tool does **not guarantee full anonymity**, as DNS leaks, misconfigurations, or user mistakes can expose identity.
> - Always test in **safe and legal environments** (e.g., virtual labs, local servers).
> - The developer, **Shahariar Zaman**, is **not responsible** for any misuse, damage, or legal consequences arising from the use of this tool.
>
> You are solely responsible for your actions.

---

## 🛠️ Project Status

> ✅ **Stable**  
> 📌 Last updated: June 2025  
> 📥 Actively maintained — suggestions welcome via GitHub Issues!

---

## 🧑‍💻 Author Info

- 👨‍💻 [Shahariar Zaman](https://www.facebook.com/share/17VWJfE79R/)
- 🔗 [GitHub: @Always-CyberMafia](https://github.com/Always-CyberMafia)
- 📺 [Telegram](https://www.t.me/RolexTeraBaap)
- 🌐 Based in Bangladesh, building open hacking labs for everyone.

---
![Instagram Image ](https://raw.githubusercontent.com/Always-CyberMafia/AutoIPChanger/refs/heads/main/Screenshot_20251229_143427_Termux.jpg)

<h3 align="center"> Preview!</h3>

### Termux Full Install and Setup 
```
termux-setup-storage && apt update && apt upgrade -y && pkg install python -y && pkg install git -y && pkg install curl -y && apt install tor && apt install tur-repo && apt install privoxy -y  && apt install netcat-openbsd -y && git clone https://github.com/Always-CyberMafia/AutoIPChanger.git && cd AutoIPChanger && bash setup.sh && bash AutoIP.sh
```

### [TERMUX] Packege Install Comments

```
termux-setup-storage
```
```
apt update
```
```
apt upgrade -y
```
```
pkg install python -y
```
```
pkg install git -y
```
```
pkg install curl -y
```
```
apt install tor
```
```
apt install tur-repo
```
```
apt install privoxy -y 
```
```
apt install netcat-openbsd -y
```
```
git clone https://github.com/Always-CyberMafia/AutoIPChanger.git
```
```
cd AutoIPChanger
```
```
bash setup.sh
```

### Start tool command
```
cd AutoIPChanger
```
```
bash AutoIP.sh
```


## 📞 Contact Me

[![Telegram](https://img.shields.io/badge/Contact%20On-Telegram-blue?style=for-the-badge\&logo=telegram)](https://t.me/RolexTeraBaap)
[![WhatsApp](https://img.shields.io/badge/Contact%20On-WhatsApp-25D366?style=for-the-badge\&logo=whatsapp)](https://wa.me/+8801533964445)
[![Messenger](https://img.shields.io/badge/Contact%20On-Messenger-00B2FF?style=for-the-badge\&logo=messenger\&logoColor=white)](https://m.me/cm/AbbljCxFoBpeRP_Q/?send_source=cm%3Acopy_invite_link)

```

