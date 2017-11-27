'use strict';

console.log('Loading function');

let aws = require('aws-sdk');
let s3 = new aws.S3({ apiVersion: '2006-03-01' });
let elastictranscoder = new aws.ElasticTranscoder();

function getFileName(path) {
   return path.split('/').reverse()[0].split('.')[0];
}

exports.handler = (event, context, callback) => {

    const bucket = event.Records[0].s3.bucket.name;
    const key = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, ' '));

    var params = {
      Input: { 
        Key: key
      },
      PipelineId: '[USE YOUR PIPELINE ID]', 
      OutputKeyPrefix: '[OUT PUT KEY PREFIX ex. `iphone/`]',
      Outputs: [
        {
          SegmentDuration:'10.0',    
          Key: getFileName(key),
          PresetId: '[PRESETID ex `1351620000001-200060`]', // hls
        }
      ]
    };

    elastictranscoder.createJob(params, function(err, data) {
      if (err){
        console.log(err, err.stack); // an error occurred
        context.fail();
        return;
      }
      context.succeed();
    });
};
