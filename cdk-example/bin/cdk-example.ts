#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { CdkExampleStack } from '../lib/cdk-example-stack';

const app = new cdk.App();
new CdkExampleStack(app, 'CdkExampleStack');
