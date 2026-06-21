# AWS Resource Tracker

A simple Bash script to track and report key AWS resources in your account, including S3 buckets, EC2 instances, Lambda functions, and IAM users.

## Author

Ayush L M

## Version

v1

## Description

This script connects to your AWS account (via the AWS CLI) and prints out a usage report covering:

- **S3 Buckets** — lists all S3 buckets
- **EC2 Instances** — lists instance IDs of all EC2 instances
- **Lambda Functions** — lists all Lambda functions
- **IAM Users** — lists all IAM users

Each run is timestamped at the start and end for easy log tracking.

## Prerequisites

Before running this script, make sure you have:

1. **AWS CLI** installed and configured with valid credentials
   ```bash
   aws configure
   ```
2. **jq** installed (used to parse EC2 JSON output)
   ```bash
   sudo apt install jq -y      # Ubuntu/Debian
   sudo yum install jq -y      # Amazon Linux
   ```
3. IAM permissions for the user/role running this script to call:
   - `s3:ListAllMyBuckets`
   - `ec2:DescribeInstances`
   - `lambda:ListFunctions`
   - `iam:ListUsers`

## Usage

Make the script executable and run it:

```bash
chmod +x aws_resource_tracker.sh
./aws_resource_tracker.sh
```

## Sample Output

```
==================================================
Run started at: 2026-06-20 10:00:00
==================================================
Print the list of s3 buckets
...
Print the list ec2 instances
...
Print the list of lambda functions
...
Print the list of IAM users
...
==================================================
Run finished at: 2026-06-20 10:00:05
==================================================
```

## Script Behavior

The script uses strict error handling:

- `set -x` — prints each command before execution (useful for debugging)
- `set -u` — treats unset variables as errors
- `set -o pipefail` — catches failures within piped commands
- `set -e` — exits immediately if any command fails

## Notes

- This script only **reads/lists** AWS resources — it does not modify or delete anything.
- Output can get noisy due to `set -x`; remove this line if you want cleaner output for production use.
- Consider redirecting output to a log file for record-keeping:
  ```bash
  ./aws_resource_tracker.sh >> tracker_report.log 2>&1
  ```

## License

This project is provided as-is for personal/learning use.
