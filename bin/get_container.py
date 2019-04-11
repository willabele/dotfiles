#!/usr/bin/env python3

import yaml
import sys

def main():
    with open('.gitlab-ci.yml') as f:
        yml = yaml.safe_load(f)
    if len(sys.argv) == 2:
        print(yml[sys.argv[1]]['image'])
        return 0
    for k, v in yml.items():
        if 'image' in v:
            print(k, v['image'])
    return 0

if __name__ == '__main__':
    main()
