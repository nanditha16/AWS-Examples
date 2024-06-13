import { Stack, StackProps } from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import { Construct } from 'constructs';

/**
 * Represents a CDK stack that creates an S3 bucket.
 *  cdk bootstrap  : Deploys the CDK toolkit stack into an AWS - you need to ensure that your environment is properly bootstrapped. 
 *   - CDKToolkit stack will be created along with a default S3 bucket containing the AWS CloudFormation template information synthesysed in a file in the bucket
 *  cdk deploy: deploys your app into an AWS account in this case example CdkStack
 *  cdk synth: synthesizes an AWS CloudFormation template for your app
 *  cdk diff: compares your app with the deployed stack
 */
export class CdkStack extends Stack {
  /**
   * Constructs a new instance of CdkStack.
   * @param scope The scope in which to define the stack.
   * @param id The ID of the stack.
   * @param props Stack properties.
   */
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    // Create an S3 bucket
    new s3.Bucket(this, 'CDK_Bucket', {
      bucketName: 'aws-practice-cdk-nan1'  //Specify a custom bucket name
    });
  }
}