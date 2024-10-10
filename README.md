# 🪐 **Yametti**  🕵️‍♂️🔍

![GitHub Repo Stars](https://img.shields.io/github/stars/LunarLumos/yametti?style=for-the-badge&logo=github&logoColor=ffffff&label=Stars) ![GitHub License](https://img.shields.io/github/license/LunarLumos/yametti?style=for-the-badge&logo=github&logoColor=ffffff) ![Security Badge](https://img.shields.io/badge/Security-%23FF4F4F?style=for-the-badge&logo=security&logoColor=ffffff) ![Terminal Badge](https://img.shields.io/badge/Terminal-%231d1f21?style=for-the-badge&logo=gnome-terminal&logoColor=00bfae)

## 🎯 **Overview**

```
Yametti (not yamete kudasai) is a versatile subdomain enumeration tool designed for security researchers, penetration testers, and domain analysts.
It combines passive and active subdomain discovery techniques to uncover hidden subdomains of a target domain.
The tool aggregates data from multiple sources, including public APIs, search engines, and popular tools, and applies brute-force subdomain resolution.
```

## 🛡️ **Features**

- **Passive Subdomain Enumeration**: Collect subdomains without directly querying the target domain through multiple APIs and public resources.
  
- **Active Subdomain Brute-Forcing**: Use wordlists and DNS resolution to actively discover subdomains, even those that aren't publicly available.

- **Wildcard Subdomain Detection**: Automatically detect wildcard subdomains (e.g., `*.example.com`) and attempt to resolve additional subdomains.

- **Multiple Data Sources**: Integrates with several public sources including `Certspotter`, `crt.sh`, `HackerTarget`, `JLDC (Anubis)`, `Subdomain Center`, `AlienVault`, `RapidDNS`, and more.

- **Permutation-based Discovery**: Generates permutations of subdomains to catch names that follow non-standard naming conventions.

- **DNS Resolution**: Resolves discovered subdomains using custom DNS resolvers.

- **Customizable Wordlists and Resolvers**: Easily use your own wordlists and resolvers to control the enumeration process.

- **Wildcards Detection**: Identifies wildcard subdomains and tries to resolve additional subdomains under the wildcard domain.

- **Efficient Results**: Deduplicates subdomains and resolves them as efficiently as possible.

---

## 🔧 **Installation**

1. **Clone the Yametti repository**:
   ```bash
   git clone https://github.com/LunarLumos/yametti.git
   cd yametti
   chmod +x yametti.sh
   sudo ./install.sh
   ```
---

## 🧑‍💻 **Usage**

Run Yametti with the following command:

```bash
./yametti.sh -d <domain> -w <wordlist> -r <resolvers>
```

### 📝 **Options**:

- `-d` : **(Required)** Target domain (e.g., `example.com`).
- `-w` : **(Required)** Path to the wordlist for subdomain guessing.
- `-r` : **(Required)** Path to the resolvers file (list of DNS resolvers).
- `-h` : **(Optional)** Displays the help message with usage instructions.

---

## 🧪 **Example**

### Passive & Active Collection:

```bash
./yametti.sh -d example.com -w subdomains.txt -r resolvers.txt
```

### Expected Output:

```
╦ ╦╔═╗╔╦╗╔═╗╔╦╗╔╦╗┬
╚╦╝╠═╣║║║║╣  ║  ║ │
 ╩ ╩ ╩╩ ╩╚═╝ ╩  ╩ o

       
       Created by Lunar Lumos

[+] Collecting subdomains passively...

[*] Scanning Subdomains with Nmap...
[*] Querying Certspotter...
[*] Fetching from JLDC...
[*] Querying crt.sh...
[*] Fetching from Anubis...
[*] Querying HackerTarget...
[*] Fetching from AlienVault...
[*] Fetching from Subdomain Center...
[*] Querying RapidDNS...
[*] Querying crt.sh for additional results...
[*] Querying HackerTarget again...
[*] Querying URLScan...
[*] Querying CertificateDetails...
[*] Running Fierce...
[*] Running Subfinder...
[*] Running Sublist3r...
[*] Running Assetfinder...
[*] Running Findomain...
[*] Running Amass...

[+] Passive collection complete!

[+] Starting active subdomain enumeration...
[*] Brute-forcing subdomains with wordlist...
[*] Resolving subdomains...
[*] Wildcard detection in progress...

[+] Active collection complete!

[+] Total subdomains collected: 350
[+] Subdomains collected and saved to example.com.subdomains.txt.
[+] Thank you for using Yametti!
```

### 🔄 **Wildcard Detection**

Yametti will also detect wildcard subdomains, such as:

```
[*] Wildcard detection: *.example.com detected.
[*] Resolving subdomains with wildcards...
[*] Wildcard subdomains found: 50 additional domains.
```

These are automatically resolved and added to the output.

---

## 💡 **How It Works**

### Passive Enumeration:
Yametti collects subdomains without querying the target domain directly by leveraging multiple public sources such as:

- **Certspotter**
- **crt.sh**
- **HackerTarget**
- **JLDC (Anubis)**
- **AlienVault**
- **Subdomain Center**
- **RapidDNS**
- **URLScan**
- **CertificateDetails**
- **Amass**
- **Subfinder**
- **Sublist3r**
- **Fierce**

### Active Enumeration:
Yametti also uses a wordlist for brute-forcing subdomains and resolving them with DNS. This method helps discover subdomains not found via passive enumeration.

### Wildcard Detection:
Yametti can detect wildcard subdomains like `*.example.com` and attempt to resolve additional subdomains that fall under the wildcard.

### Permutation Support:
Yametti can generate permutations of subdomains (e.g., `sub1.sub2.example.com`, `sub2.sub1.example.com`) to enhance the chances of discovering subdomains that may not follow standard naming conventions.

---

## 📄 **Output**

All found subdomains will be saved in the `example.com.subdomains.txt` file, containing both active and passive results, with duplicates removed.

---

## 🛠️ **Contributing**

Yametti is open-source, and contributions are always welcome! You can help by:

- Forking this repository
- Making improvements or fixing bugs
- Opening issues or feature requests
- Submitting pull requests

---

## 🗒️ **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💬 **Acknowledgements**

- **Nmap**: For host discovery and subdomain enumeration.
- **Certspotter**: For passive subdomain discovery through certificate transparency logs.
- **crt.sh**: Another certificate transparency service that helps in finding subdomains by querying their database.
- **HackerTarget**: Provides API access for subdomain enumeration and host search services.
- **JLDC (Anubis)**: Fetches subdomains from JLDC's Anubis service.
- **AlienVault**: For its threat intelligence platform and domain-based data collection via its OTX API.
- **Subdomain Center**: A platform for gathering subdomains via its API.
- **RapidDNS**: For its subdomain discovery and resolution features.
- **URLScan**: Provides a powerful web scanning and domain analysis API that can help in subdomain discovery.
- **CertificateDetails**: For finding subdomains using its certificate data API.
- **Fierce**: A domain scanner that passively collects subdomains using DNS.
- **Subfinder**: A powerful subdomain enumeration tool that discovers subdomains through various sources.
- **Sublist3r**: A fast subdomain enumeration tool that uses multiple search engines to discover subdomains.
- **Assetfinder**: A subdomain discovery tool for finding assets tied to a domain.
- **Findomain**: A subdomain enumeration tool that relies on DNS records and a wide range of sources.
- **Amass**: A tool designed for advanced subdomain enumeration and mapping of domain assets using passive and active techniques.

### 🔍 **Why Subdomain Enumeration is Important in Recon**

Subdomain enumeration is a fundamental part of the **recon** phase in security testing and ethical hacking. Here's why it's crucial:

1. **Uncover Hidden Attack Surfaces**:
   Subdomain enumeration helps uncover all the parts of a domain, including those that may not be publicly advertised or directly linked to the main domain. Often, organizations host different services (e.g., `api.example.com`, `mail.example.com`, `dev.example.com`) on subdomains that can be overlooked. These subdomains might have vulnerabilities or misconfigurations that are exploitable.

2. **Identify Vulnerable Systems**:
   Many times, subdomains might be hosting services or applications with outdated software or known vulnerabilities. For instance, a subdomain running an old version of a CMS (e.g., `wordpress.example.com`) might be vulnerable to known exploits. By discovering all subdomains, a penetration tester can check for vulnerable services that could be a point of entry.

3. **Expand Attack Surface**:
   Subdomain enumeration expands the scope of an attacker's visibility, revealing more potential entry points that might not have been considered during initial reconnaissance. Subdomains can contain their own sub-subdomains (e.g., `test.api.example.com`), further expanding the attack surface.

4. **Bypass Security Filters**:
   Organizations often use **web application firewalls (WAFs)** or **IP whitelisting** to limit exposure to specific services. A vulnerable subdomain that isn't protected by these defenses may provide a way to bypass these filters and gain unauthorized access.

5. **Map Internal Networks**:
   Subdomain enumeration can also reveal internal services exposed to the internet, potentially leading to sensitive information like internal systems, databases, or internal documentation. For example, subdomains like `internal.example.com` or `intranet.example.com` might point to systems used for internal communication or collaboration.

6. **Leverage DNS and Certificate Transparency Logs**:
   DNS records and Certificate Transparency logs contain detailed information about a domain’s subdomains and associated services. Subdomain enumeration uses these sources to map out the organization’s digital footprint in great detail, which is crucial for understanding how an organization operates and which resources are in use.

7. **Gather Intelligence for Further Exploitation**:
   Subdomains often reveal the internal structure of a network or organization. By knowing what subdomains are in place, an attacker can better strategize their attack, tailor their payloads for specific services, and increase the chances of successful exploitation.

8. **Comprehensive Reconnaissance**:
   Complete reconnaissance involves identifying all parts of a target network, not just the main domain. By enumerating subdomains, you can discover new attack vectors, data sources, and services that might not be visible in a simple domain scan. This allows security professionals to conduct a **full-scope analysis** and ensures no overlooked subdomain poses a threat.


These tools and services significantly contribute to the core functionality of Yametti, providing passive and active methods for discovering subdomains.

