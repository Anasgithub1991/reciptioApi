const router = require('express').Router()
const express = require('express');
const axios = require('axios');
const https = require('https');
const zlib = require('zlib')
// import { Buffer } from 'node:buffer';
const fs = require('fs')
const fileUrl = 'https://file-examples.com/storage/fe92070d83663e82d92ecf7/2017/10/file-sample_150kB.pdf';

const app = express();

const ReceptionRecord = require('../models/ReceptionRecord')
const Distination_transform = require('../models/ReceptionRecord')

const { notifyMessage } = require('../utils/notification')


router.get('/', async (req, res) => {
    try {
        let receptionRecord = await ReceptionRecord.all(req.params.id)
        res.status(200).json(receptionRecord)

    } catch (error) { res.status(400).json(notifyMessage(false, 'receptionRecord was not fetch', '', error)) }
})


router.get('/gettransform/:id', async (req, res) => {
    try {
        let receptionRecord = await ReceptionRecord.gettransform(req.params.id)
        res.status(200).json(receptionRecord)

    } catch (error) { res.status(400).json(notifyMessage(false, 'receptionRecord was not fetch', '', error)) }
})



router.get('/tttt', async (req, res) => {




    const axios = require('axios');

    let config = {
        method: 'get',
        maxBodyLength: Infinity,
        url: 'https://uruk-demo.docuware.cloud//DocuWare/Platform/FileCabinets/126ab2e7-c0b0-4b28-ad57-dbc3e915200f/Documents/8/FileDownload?TargetFileType=Auto&KeepAnnotations=false',
        headers: {
            'Authorization': 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkVBODgzNTEyODE4OTFEQzU5RUVGQ0ZBQjcxMEQ5REY4NDgxNDdFMjQiLCJ4NXQiOiI2b2cxRW9HSkhjV2U3OC1yY1EyZC1FZ1VmaVEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwczovL2xvZ2luLWVtZWEuZG9jdXdhcmUuY2xvdWQvY2Q1MmJmOWMtYjc4NS00ZDFiLWE2MTgtODlkOGEyNDlhNjBjIiwibmJmIjoxNzE1MjY2MDMxLCJpYXQiOjE3MTUyNjYwMzEsImV4cCI6MTcxNTI2OTYzMSwiYXVkIjoiZG9jdXdhcmUucGxhdGZvcm0iLCJzY29wZSI6WyJkb2N1d2FyZS5wbGF0Zm9ybSJdLCJhbXIiOlsicGFzc3dvcmQiXSwiY2xpZW50X2lkIjoiZG9jdXdhcmUucGxhdGZvcm0ubmV0LmNsaWVudCIsInN1YiI6ImVkNDI1MjJjLTlhYzctNDdjMC1hMzI4LTJkZDQxN2U2NjExMSIsImF1dGhfdGltZSI6MTcxNTI2NjAzMSwiaWRwIjoibG9jYWwiLCJ1c2VybmFtZSI6ImFwaS51c2VyIiwidXNlcl9lbWFpbCI6ImRtc0B1cnVrY28uY29tIiwib3JnYW5pemF0aW9uIjoiVXJ1ayBFbmdpbmVlcmluZyBTZXJ2aWNlcyBDbywgTHRkIiwib3JnX2d1aWQiOiJjZDUyYmY5Yy1iNzg1LTRkMWItYTYxOC04OWQ4YTI0OWE2MGMiLCJob3N0X2lkIjoiVW5kZWZpbmVkIiwicHJvZHVjdF90eXBlIjoiUGxhdGZvcm1TZXJ2aWNlIn0.ZpmoHe_Vwm80oxDdnno3sdKHj_LjMEsaUbdiIFLkOxYOzaI91BTxM7jA3hFCUmMyWM-UK6l-BO9r9MEggvS3o_dFbZeHmtZa0F3nRjlglUmU1JHg8201CEde9vWbnOy4jbByaxCtyQ3YcMlhPw5vbx_MDir3qDdRniIe519Um8Tn_lr1q_M-jpxn7sPn30bUvwi8i1czJQKaEFtB_WKQeHzFE6PIDF-hJ4t4Jdt3rECa1rgbcGrswKk1eScQPp5_K5qIDUobcS7qM3oVsU4HtfHKdhbsq0K87QSYwnCp0QH0tuEQT2ImjDnqNDiyhoOSgBUpN9sIJGTfEL4VyXGmhg',
            'Cookie': 'DWPLATFORMBROWSERID=63A50166E8AF2DAE497C4D569805B1D16193D8DE77FBDA7500A247D0ED1F88439597C24DE0C1C2A523BCC812AD7A0A20279F9F09BF477D3B92E0AC34DC808B7A9F17801D496CFD15E0590C7D1107D5FB2B6230D4D1AB0C54C82764E68A301B435C44A78F18D0087A6DC3313C54EB223552FF2FB22A4C684F4EA6855735D78C884F47D6258912EFFB29037089F01158A95531125C356F16D442505B28A9C29A62A8D3E8EC97E75A19097AC4345B1B8E600FF776535B18A6306D783486101C2419AC4155C8FBF1EC3198502D9E8DDC49F5; dwingressplatform=1715262522.501.27.418380|f34785a7ba4c8f7fca4b092336c6db71',
            'Content-Security-Policy': `script-src https://*.docuware.cloud https://saas.docuware.com https://go.docuware.com https://widget.surveymonkey.com https://secure.surveymonkey.com 'self' blob: dwcloudstatic.azureedge.net dwcloudstatic202310.azureedge.net cdnjs.cloudflare.com ajax.aspnetcdn.com ajax.googleapis.com *.msecnd.net https://*.userlane.com use.fontawesome.com 'unsafe-inline' 'unsafe-eval'`
        }
    };

    axios.request(config)
        .then((response) => {


            const base64Snippet = Buffer.from(response.data).toString('base64');



            // console.log(base64Snippet);
            res.send('data:application/pdf;base64,' + base64Snippet);


        })
        .catch((error) => {
            console.log(error);
        });

});






router.get('/test', async (req, res) => {
    try {
        // Step 1: Authenticate and obtain access token
        // const authResponse = await axios.post('https://login-emea.docuware.cloud/cd52bf9c-b785-4d1b-a618-89d8a249a60c/connect/token',
        //     {
        //         grant_type: 'password',
        //         scope: 'docuware.platform',
        //         client_id: 'docuware.platform.net.client',
        //         username: 'api.user',
        //         password: 'Fgrt#798723'
        //     }, {
        //         headers: {
        //             'Content-Type': 'application/x-www-form-urlencoded'
        //         }
        // });

        const accessToken = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkVBODgzNTEyODE4OTFEQzU5RUVGQ0ZBQjcxMEQ5REY4NDgxNDdFMjQiLCJ4NXQiOiI2b2cxRW9HSkhjV2U3OC1yY1EyZC1FZ1VmaVEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwczovL2xvZ2luLWVtZWEuZG9jdXdhcmUuY2xvdWQvY2Q1MmJmOWMtYjc4NS00ZDFiLWE2MTgtODlkOGEyNDlhNjBjIiwibmJmIjoxNzE1Mjk2MDQxLCJpYXQiOjE3MTUyOTYwNDEsImV4cCI6MTcxNTI5OTY0MSwiYXVkIjoiZG9jdXdhcmUucGxhdGZvcm0iLCJzY29wZSI6WyJkb2N1d2FyZS5wbGF0Zm9ybSJdLCJhbXIiOlsicGFzc3dvcmQiXSwiY2xpZW50X2lkIjoiZG9jdXdhcmUucGxhdGZvcm0ubmV0LmNsaWVudCIsInN1YiI6ImVkNDI1MjJjLTlhYzctNDdjMC1hMzI4LTJkZDQxN2U2NjExMSIsImF1dGhfdGltZSI6MTcxNTI5NjA0MSwiaWRwIjoibG9jYWwiLCJ1c2VybmFtZSI6ImFwaS51c2VyIiwidXNlcl9lbWFpbCI6ImRtc0B1cnVrY28uY29tIiwib3JnYW5pemF0aW9uIjoiVXJ1ayBFbmdpbmVlcmluZyBTZXJ2aWNlcyBDbywgTHRkIiwib3JnX2d1aWQiOiJjZDUyYmY5Yy1iNzg1LTRkMWItYTYxOC04OWQ4YTI0OWE2MGMiLCJob3N0X2lkIjoiVW5kZWZpbmVkIiwicHJvZHVjdF90eXBlIjoiUGxhdGZvcm1TZXJ2aWNlIn0.XYd2alC7-IjTCKjSplJX9AMbNsUT4XAOoXK8O_b8Z28aa8DhXbOJVe_05KFvSJs0YnjbNMMmj25XyqoZCUOYIh2icb5z44WMCEZbWkH5UL-h-hECmiZIFdqatWpWwztKru7vXVveLTm6Aw6wULnx4HWnnfWy-6hdUqUow229gbB5LVZ9mJco04wte8cfUBYMdTYVaflTFkdgJwIcsGOVcgB73tZ-2iGHZg9gtqjNdFV1Xjtb4PV5X_DswR9wwSAB4pDIUa7t0pg7ch0ls1mbCVs0lvhASpj_-LA7W5FfGEJQYEeCpbu-Wd8iCrX-anwQoiU1i7Plsi4_YWm2Pm10bA';
        console.log('accessToken', accessToken);
        // Step 2: Use access token to reset API key
        const resetResponse = await axios.get('http://uruk-demo.docuware.cloud//DocuWare/Platform/FileCabinets/126ab2e7-c0b0-4b28-ad57-dbc3e915200f/Documents/8/FileDownload?TargetFileType=Auto&KeepAnnotations=false', {
            // Add request body parameters as needed
        }, {
            headers: {
                "Authorization": `Bearer ${accessToken}`
            }
        });

        console.log('API key reset successful:', resetResponse);
        res.status(200).json({ message: 'API key reset successful' });
    } catch (error) {
        console.error('Error resetting API key:', error.message);
        res.status(500).json({ error: 'Error resetting API key' });
    }
});
router.get('/doc', async (req, res) => {
    try {
        // const outputPath = './invoice.pdf';

        const app = express();
        app.use(express.urlencoded({ extended: true }));
        console.log('aa');
        const key = {
            grant_type: 'password',
            scope: 'docuware.platform',
            client_id: 'docuware.platform.net.client',
            username: 'api.user',
            password: 'Fgrt#798723'
        }
        console.log('sss');
        const token = await axios.post('https://login-emea.docuware.cloud/cd52bf9c-b785-4d1b-a618-89d8a249a60c/connect/token', key, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })

        const tokens = token.data.access_token
        console.log('responseall', tokens);

        const response = await fetch('https://uruk-demo.docuware.cloud//DocuWare/Platform/FileCabinets/126ab2e7-c0b0-4b28-ad57-dbc3e915200f/Documents/8/FileDownload?TargetFileType=Auto&KeepAnnotations=false', {
            method: 'GET',
            // responseType: 'stream',

            headers: {
                'Authorization': `Bearer ${tokens}`
            },
            body: new URLSearchParams(key).toString()
        });
        if (response.ok) {
            const responseData = await response.blob(); // or .text() if it's not binary data
            res.status(200).send(responseData);
        } else {
            console.error('Error fetching file:', response.statusText);
            res.status(500).send({ error: 'Error fetching file' });
        }
        console.log('response', response);

        // Pipe the result stream into a file on disk
        // response.data.pipe(fs.createWriteStream(outputPath));
        // res.status(200).send(response.data)




        //  res.setHeader('Content-Type', 'application/pdf');
        // res.status(200).json(response);

        //          const link = document.createElement('a');
        //   link.setAttribute('href', 'data:"application/pdf;base64,' + res.data.base64PDF);
        //   link.setAttribute('download', res.data.name);

        //   document.body.appendChild(link);
        //   link.click();
        //   document.body.removeChild(link);

        // console.log('999999999999999999999999999999999999999999999999999999999999999999999999',JSON.stringify(data.data));
        // res.status(200).send('data:"application/pdf;' + data.data);
    } catch (error) {
        //console.error('Error:', error.message);
        res.status(500).json({ error: 'An error occurred' });
    }
});

router.get('/id/:id/exit/:exit/page/:page', async (req, res) => {
    try {


        let receptionRecord = await ReceptionRecord.id(req.params.id, req.params.exit, req.params.page)
        res.status(200).json(receptionRecord)

    } catch (error) { res.status(400).json(notifyMessage(false, 'receptionRecord by id  was not fetch', '', error)) }
})

router.get('/doc2', async (req, res) => {
    try {

        const key = {
            grant_type: 'password',
            scope: 'docuware.platform',
            client_id: 'docuware.platform.net.client',
            username: 'api.user',
            password: 'Fgrt#798723'
        }
        const token = await axios.post('https://login-emea.docuware.cloud/cd52bf9c-b785-4d1b-a618-89d8a249a60c/connect/token', key, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })

        const tokens = token.data.access_token


        const response = await axios({
            method: 'get',
            url: 'https://uruk-demo.docuware.cloud//DocuWare/Platform/FileCabinets/126ab2e7-c0b0-4b28-ad57-dbc3e915200f/Documents/8/FileDownload?TargetFileType=Auto&KeepAnnotations=false',
            // responseType: 'stream',
            responseType: 'arraybuffer', // Receive data as a Buffer

            headers: {
                Authorization: `Bearer ${tokens}`,
                'Content-Type': 'application/pdf',

            }
        });

        // Pipe the result stream into a file on disk
        //response.data.pipe(fs.createWriteStream(outputPath));
        var bufs = [];

        // Log completion on successful download
        //         response.data.on('data', (d) => {
        //             bufs.push(d);
        //         });
        // console.log('data',bufs);
        //         // Log completion on successful download
        //         let   pdf_base64
        //         response.data.on('end', () => {
        //               pdf_base64 = 'data:application/pdf;base64,' + Buffer.concat(bufs).toString('base64');
        //              console.log('File downloaded successfully', pdf_base64);
        //         });
        fs.writeFileSync('downloaded-file.pdf', response.data);
        res.setHeader('Content-Type', 'application/pdf');
        const pdfBase64 = Buffer.from(response.data, 'binary').toString('base64');
        console.log('pdfBase64', pdfBase64);
        res.status(200).send(response.data);

        // Log any errors during the stream
        // response.data.on('error', (err) => {
        //     console.error('Error downloading the file:', err);
        // });
    } catch (error) {
        console.error('Error fetching file:', error);
    }
})
router.post('/doc2moi/FileCabinets/:FileCabinets/DBName/:value/date/:date', async (req, res) => {
    try {
        console.log('req.params', req.params);
        const key = {
            grant_type: 'password',
            scope: 'docuware.platform',
            client_id: 'docuware.platform.net.client',
            username: 'moi',
            password: 'moi'
        }
        const agent = new https.Agent({
            rejectUnauthorized: false
        });

        const token = await axios.post('https://moi2/DocuWare/Identity/connect/token', key, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }, httpsAgent: agent
        })

        const tokens = token.data.access_token
        console.log('tokens', tokens);
 
        //for search and get the documents id
        const response = await axios({
            method: 'post',
            //for search for the document id
            // url: 'https://moi2//DocuWare/Platform/FileCabinets/66017757-9b5b-4f41-9a9a-31374ccb4984/Documents/38172/FileDownload?TargetFileType=Auto&KeepAnnotations=false',
            //for search and get the documents id
            url: `https://moi2//DocuWare/Platform/FileCabinets/${req.params.FileCabinets}/Query/DialogExpression`,

            responseType: 'xml', // Receive data as a Buffer
            data: {
                "Condition": [
                    {
                        "DBName": "_____",
                        "Value": [
                        req.params.value
                        ]
                    },
                    {
                        "DBName": "_______",
                        "Value": [
                            // "2024-05-15",
                            // "2024-05-15"
                            req.params.date,
                            // "2024-05-15"
                            req.params.date
                        ]
                    }
                ]
            },
            headers: {
                Authorization: `Bearer ${tokens}`,
                // Accept: 'application/pdf', // Corrected header


            }, httpsAgent: agent
        });

        const xmlResponse = response.data
        const responseObject = JSON.parse(xmlResponse);
        console.log('response', responseObject.Items);
        const downloadPdf = await axios({
            method: 'get',
            //for search for the document id
            url: `https://moi2//DocuWare/Platform/FileCabinets/${req.params.FileCabinets}/Documents/${responseObject.Items[0]?.Id}/FileDownload?TargetFileType=Auto&KeepAnnotations=false`,
            //for search and get the documents id

            responseType: 'arraybuffer', // Receive data as a Buffer

            headers: {
                Authorization: `Bearer ${tokens}`,
                Accept: 'application/pdf', // Corrected header


            }, httpsAgent: agent
        });
        //fs.writeFileSync('downloaded-file.pdf', response.data);
 
        res.setHeader('Content-Type', 'application/pdf');
        const pdfBase64 = Buffer.from(downloadPdf.data, 'binary').toString('base64');
        //console.log('pdfBase64', pdfBase64);
        //res.status(200).send(pdfBase64)
        res.status(200).send({ data: `data:application/pdf;base64,${pdfBase64}`, title: 'Document' })
    }

    catch (error) {
        console.error('Error fetching file:', error);
        res.render('error', { message: 'An error occurred', error: error, title: 'Error' })
    }
})
router.post('/AnasDocuware/FileCabinets/:FileCabinets/DBName/:value/date/:date', async (req, res) => {
    try {
        console.log('req.params', req.params);
        const key = {
            grant_type: 'password',
            scope: 'docuware.platform',
            client_id: 'docuware.platform.net.client',
            username: 'admin',
            password: 'admin'
        }
        const agent = new https.Agent({
            rejectUnauthorized: false
        });

        const token = await axios.post('https://desktop-b47d5m0/DocuWare/Identity/connect/token', key, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }, httpsAgent: agent
        })

        const tokens = token.data.access_token
        console.log('tokens', tokens);
 
        //for search and get the documents id
        const response = await axios({
            method: 'post',
            //for search for the document id
            // url: 'https://desktop-0jjednb//DocuWare/Platform/FileCabinets/66017757-9b5b-4f41-9a9a-31374ccb4984/Documents/38172/FileDownload?TargetFileType=Auto&KeepAnnotations=false',
            //for search and get the documents id
            url: `https://desktop-b47d5m0//DocuWare/Platform/FileCabinets/${req.params.FileCabinets}/Query/DialogExpression`,

            responseType: 'xml', // Receive data as a Buffer
            data: {
                "Condition": [
                    {
                        "DBName": "__________",
                        "Value": [
                        req.params.value
                        ]
                    },
                    {
                        "DBName": "____________",
                        "Value": [
                            // "2024-05-15",
                            // "2024-05-15"
                            `${req.params.date}-1-31`,
                            // "2024-05-15"
                             
                              `${req.params.date}-12-31`
                        ]
                    }
                ]
            },
            headers: {
                Authorization: `Bearer ${tokens}`,
                // Accept: 'application/pdf', // Corrected header


            }, httpsAgent: agent
        });

        const xmlResponse = response.data
        const responseObject = JSON.parse(xmlResponse);
        console.log('response', responseObject.Items);
        const downloadJpg = await axios({
            method: 'get',
            url: `https://desktop-b47d5m0//DocuWare/Platform/FileCabinets/${req.params.FileCabinets}/Documents/${responseObject.Items[0]?.Id}/FileDownload?TargetFileType=Auto&KeepAnnotations=false`,
            responseType: 'arraybuffer',
            headers: {
                Authorization: `Bearer ${tokens}`,
                Accept: 'application/zip',
            },
            httpsAgent: agent
        });
        
        const AdmZip = require('adm-zip');
const zipData=downloadJpg.data
        // Create a new instance of AdmZip with the zipData buffer
        const zip = new AdmZip(zipData);
        
        // Extract all entries from the ZIP file
        const zipEntries = zip.getEntries();
        const imagep64=[]
        // Iterate through each entry and extract its data
        zipEntries.forEach(entry => {
            // Extract the entry's data (buffer)
            const entryData = entry.getData();
            
            // Convert the buffer to base64
            const base64Data = entryData.toString('base64');
        
            // Push the base64 data to the imageBase64 array
            imagep64.push(base64Data);
        });
        console.log('imagep64',imagep64);

        console.log('ZIP file decompressed successfully.');
//        const pdfBase64 = Buffer.from(downloadJpg.data, 'binary').toString('base64');
        // console.log(`data:image/jpeg;base64,${jpgBase64}`);
        res.status(200).send(
            { data:`data:image/jpeg;base64,${imagep64}`}
         );
        
        
    }


    catch (error) {
        console.error('Error fetching file:', error);
        res.render('error', { message: 'An error occurred', error: error, title: 'Error' })
    }
})

router.get('/doc2moitest', async (req, res) => {
    try {

        const key = {
            grant_type: 'password',
            scope: 'docuware.platform',
            client_id: 'docuware.platform.net.client',
            username: 'api.user',
            password: 'Fgrt#798723'
        }
        const agent = new https.Agent({
            rejectUnauthorized: false
        });

        const token = await axios.post('https://login-emea.docuware.cloud/cd52bf9c-b785-4d1b-a618-89d8a249a60c/connect/token', key, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }, httpsAgent: agent
        })

        const tokens = token.data.access_token
        console.log('tokens', tokens);

        const response = await axios({
            method: 'get',
            url: 'https://uruk-demo.docuware.cloud//DocuWare/Platform/FileCabinets/126ab2e7-c0b0-4b28-ad57-dbc3e915200f/Documents/8/FileDownload?TargetFileType=Auto&KeepAnnotations=false',
            // responseType: 'stream',
            responseType: 'arraybuffer', // Receive data as a Buffer

            headers: {
                Authorization: `Bearer ${tokens}`,
                Accept: 'application/pdf', // Corrected header


            }, httpsAgent: agent
        });



        res.setHeader('Content-Type', 'application/pdf');
        const pdfBase64 = Buffer.from(response.data, 'binary').toString('base64');
        console.log('pdfBase64', pdfBase64);
        res.status(200).send(`data:application/pdf;base64,${pdfBase64}`);
        // });
    } catch (error) {
        console.error('Error fetching file:', error);
    }
})
router.post('/', (async (req, res) => {
    try {
        let receptionRecord = await ReceptionRecord.insert(req.body)

        res.status(200).json(receptionRecord)
        // res.status(200).json(receptionRecord2)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'receptionRecord was not post', '', error))
    }
}))



router.put('/', (async (req, res) => {
    try {
        let receptionRecord = await ReceptionRecord.update(req.body)
        // let distination_transform = await Distination_transform.distination_transform_update(req.body) 

        res.status(200).json(receptionRecord)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'receptionRecord was not put ', '', error))
    }
}))



router.put('/outdate', (async (req, res) => {
    try {
        console.log('req.body', req.body);
        let receptionRecord = await ReceptionRecord.outdate(req.body)
        res.status(200).json(receptionRecord)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'receptionRecord was not update exit and dateout ', '', error))
    }
}))



router.put('/outdatetransform', (async (req, res) => {
    try {
        console.log('req.body', req.body);
        let receptionRecord = await ReceptionRecord.outdateTransform(req.body)
        res.status(200).json(receptionRecord)
    }
    catch (error) {
        res.status(400).json(notifyMessage(false, 'receptionRecord was not update exit and dateout ', '', error))
    }
}))
module.exports = router