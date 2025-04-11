Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218928EA63
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 21:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406409; cv=fail; b=siBsAADkHrizHmO9rD2h/J2+WeNJt1bJZSfxFcUNBAelpti7R33borJml5h7Ij/Vkmaeb/1Fn11NhO02pxZo0ig5+/w28lSEhND7QB7U1kUgREI5PJtfR0poeuLUWApm4E2SDLjZKjfY2oBgvnzjthMLeH3sT1QVXYpzfN7Uy7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406409; c=relaxed/simple;
	bh=+QmYi45jtvJdz3wTlnQ8xTVWQPhiYtRMPXQUgy7/o60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qmd6szgdrpjCDnr6Ue+1S3qbYXWo2erODsYQeE9+A3fJAdEkQPn+7GUJo56MoO72oL8lrog+1calz07pRQC3/Uxi/lQ3SrbGhWY4pWhyOdU0KotMaNMdFAsJpZzDubHaZVIlJiUq36pZWi7fbMDx8sdG1gID4ZFxCvs7vA3tWXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gs7NJmC6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l0BVESjq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gs7NJmC6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l0BVESjq"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BLHkFR017616
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 21:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=x+e+knQ6a3tDipI4ULqtr28wtSaMAw5EwK1dqqdpwsY=; b=
	Gs7NJmC61PmpUGB5Ed1z/qK9We65i5IiXlrxzQ2qm+NBHWi1Co/M//5aRIFHBiIt
	niPGG6bQ5dx1nilsiKHY7t89yEFQO90IycPjLJ/YRby7jkPY0ie8wNo6snxWi1iM
	MFznDf9v7IhVFzOYxx7XWHdu+9vLqeR+I1xTEam2zGVb2RnwROOwupp9ft0eAd6L
	T3VEoeUb2uWDxrqUkYhgsDkIx7CibVzcT1/FOhxAB3wjpKANVpHf3vAngM3bu2wH
	yi/ffcVo9VrX5aBZfKsH5bD7AzCIc0G/3/lGBTyQa4tPb6QX6CQFuJeOjqpL7Oed
	lgiNFCCWj+hvETdZeKXAZA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45yaskr11u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 21:20:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BJAfSj016493
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 21:20:04 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttye634h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 21:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1SLVXwD5kS7fk9KY7YXiHKX8Y0RANnTqFYXMffwqeUDnbcYg4O7KEFKCy6vxtKLVUZp2fNWS0sapnFtMDbjcJvzLHhScmvAMsb+9DZ5w28jeLKGcXtFDDU6LxD8vZdLDiH7I3seqK7VeBUH+aRJNbToc+KrBBWGfknOPzYpGsyfyRQnG4RmJnnPiperMu1jeSsbiHJscPw76W4kxBlkTyQeBoMTweIADzNw6wr/bo3fxZmzgTGF6/JS0KjWuHPu75PmdzgAMU8EUEDdFf5Z9G6eluBdTMq2eVTsAWyBBHz0EQW/3BXYYeM0KkWczfFxE7LxZ02tSLx4oBiYhrM86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+e+knQ6a3tDipI4ULqtr28wtSaMAw5EwK1dqqdpwsY=;
 b=MYBR1uvkNR0T6hPPAy5hN8cDJ0O50ZSWzHv6coTAN7D7moif9QwTeHFcE671KMhCk7gn04C1hTcr76CVPGWTBCp6xd9BLKFFT6gr+SW9lOve0YVe0txUcBEMVvogzn+2NZodkV7SbNResQAxWS3AlQ1ph1AyhZVtoxn3y+riXYzmiruHU1M7FC3ekduNxaBAHsg94thpsX4VdSy9qFpaZtNhdhGepsTl+CAJ0cSRdVAsQ7LWFa+DjIAFbOG0PNgRFpBKPwQUSicvWPFdX/kKwDU9HQg4C779RsA9Nbj++fhpOtsWNjq5Zj8TiD1pwkSkUYj0bJG/SOYV2X2IiXJ4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+e+knQ6a3tDipI4ULqtr28wtSaMAw5EwK1dqqdpwsY=;
 b=l0BVESjq2fTRRheIwDM1PebDj2LK+cqPpmh/ZYbmaYyOPFC7VhyKLciMsg/BYdlepS06tCasHTkNdtG+U6A5yKY/07b3rkqVeovvZnSUqHrWkmFX8v1lY7Gqd2c5gfq5FIp02698gwZij+8yapzXMjqEeGRIvcOr5wCtOvARh4g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6753.namprd10.prod.outlook.com (2603:10b6:930:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 21:20:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 21:20:01 +0000
Message-ID: <f9f7221d-ee7c-b10c-b677-de3b38d86181@oracle.com>
Date: Fri, 11 Apr 2025 17:20:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250403050252.15239-1-eugene.loh@oracle.com>
 <Z/mAC5DG2gl0W8Sn@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z/mAC5DG2gl0W8Sn@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: d03708c4-f814-4e5b-5d7e-08dd793e9e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmVxWW1CNkhNN1pxQmU0M1cvZ2FSMytQRzQrRldiRGdTL1pQNlZqQ0x4STUz?=
 =?utf-8?B?VHUya0lwNmNrVWQ2TjZzRVh0M1VOSFR6NktrcXZ1d1dXZ1JsUDUzYUo5YWI5?=
 =?utf-8?B?UUtOc2dXSGQ4c3ZtRkVxbkszb0lDMjhETXo5T3V2L3F2UmFhVTk5cCtLcnRp?=
 =?utf-8?B?cDdNR0hKeVlvN3A5VXI5MFRqdDl4VlA1eGRXcGlIVDJlczJ1UXVkYkhsVmx3?=
 =?utf-8?B?ZExFeDVmcFFNR1pOTTEwZHk0TkdmOStVb0I2b0pJS1RyS3Y4STlvUzRqYWRR?=
 =?utf-8?B?QkRrZ2FVNWVaM3RTQ29TVFJuOGRpUkxMTUhCa2kyQisrV3B4d3pHUXdiTFNq?=
 =?utf-8?B?TFdOWHRTWmhxT010SFRzdDVJSWF0ZjUzY292dWs0WHZnZDJFZitiV2g0VjVS?=
 =?utf-8?B?NUxzKzRJcFlXdk1OcmNnOFB1a1UyZy9xVTVEcTlaN0FBMTFGZmdraGl6aElp?=
 =?utf-8?B?YXNXbFNwRWFCVnRHSDlzZ3RZaFpLektHTXlXcGtEOGp4dVh5eGpOVW1odWg1?=
 =?utf-8?B?dnBxOTQydCtMV214M0IreGdyeTArTlZHdktIUkVwREpRUktyVXpka1pNR2My?=
 =?utf-8?B?SDVjUUl0ckMvM2xwdHVPOFRHZG8xUWppNnhtMzJRZWpwL1dRY002bWIxbVJN?=
 =?utf-8?B?cGphZFU1QXpjcE0ybEtuTXRocnRHajRaZ0J0M2sydXdjeGJlVlZEdmpiR3h2?=
 =?utf-8?B?TkpKTEM4QUN0cUR6cE11aHhDakhCWjN1YzZhYlhVQmhNYWNzd29qS2Vwb1Ey?=
 =?utf-8?B?QmVWZ2NpS1lYSEVxTi9TMVRuSkhrOXljbWlzbnRON2NvaFAybXlTTE5FdWF4?=
 =?utf-8?B?eUhmOTRsc2c0bGo0OXB5V29aOUFVUnFvNGIyVk5BZWtKYlAybGxwV2FUTU8y?=
 =?utf-8?B?TW9ydmgrSnBMaTRPdnRjU3VyNG9vVUU3Z2toZUUyYUJEL3pRVkZQRDlnV09N?=
 =?utf-8?B?RUNzLzY5YlAwaHIyUXlOTDU1eFplek5YZFVyem5NaXkzaUNKM09zL3VPN01n?=
 =?utf-8?B?QXpwNFhkRUZvWEdZcmVJVUVlOWIzZDlVVHlnKzNFZDlCWmIxRFNrVzVKTkF2?=
 =?utf-8?B?eTRuTTZCSWpFeUMyUjlEZStRc3lOY05hVVhHWGtrWW50UTkxMzdVeFhZY2dM?=
 =?utf-8?B?M2VERDd1M3VnNHZscXg2cmpNZ2MrOWdDdEtISlhSa21WQ2U0L25lR3NiYkZ4?=
 =?utf-8?B?N05VWUxDMURHUnh0cUJLM1N2WkROSGxFcUNEdFFBSjg3TGczZlpScXY3MEo0?=
 =?utf-8?B?M0JUVi9jcExHM29iSmVNWkcyVlFSU1pXYWk2bWkvOFVGMGpCa1ZrU08wTFVR?=
 =?utf-8?B?RUk0Sjd6YTNBczB5VU5GZTNSTWJPNUh1d3gwalM0WmliK2tRQU1DdWw5RmUx?=
 =?utf-8?B?dkNVSys1MlQvZUpHZzk1bG90REpkWklPTEZNWDNlcnMyODFQcThHL3NleG5s?=
 =?utf-8?B?OEJvZHJLWVpvOVNIQzNSVmdjOEVoQ2ZGb3UzQTV4OHdlWXpzb1hZL0QvU2tY?=
 =?utf-8?B?TmIyZ09xVnVUNkFZb0c3TFdDbnd5OTh4VHl0bG9Scm9QR0V0K0J1Z1N3N0Ez?=
 =?utf-8?B?TDViVlBaL0JmSlZrZGg5RGJNR2ZVeXdKSlk0YTZzanRYckU5VHZ4OHFxYWlE?=
 =?utf-8?B?U2svZDRnRWJZVEZaNGZzODB6cWxqQzRmQTBIQmkzUmN1WXVGM2trWkcwZ2Jo?=
 =?utf-8?B?dWNZa0ZKWHJLOWNJOFNvY2FWdng5c3h3anBIYWIvaURNNkZjeHhka1NzU3Vy?=
 =?utf-8?B?M3FhNTZ4Qi9Hekh5eXVRZ294SkdKaUNyRGRlRUMybCt2VmpwRk1Db1kzazMr?=
 =?utf-8?B?Nm15dk1rWHBtQ1NoanFrL2RmSkhyaXRkSUNvVHdzbUUzSzdhTTV4eUpSWmw2?=
 =?utf-8?B?cWNTM0hzeTlEdzM1Ymw0eXpsRDRDRUdrRlc5VUVCbnVnMmF3emgwZEtSaW04?=
 =?utf-8?Q?8sAe+pnCqjo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3VjY0ZJeENyY1Zjc1JHazYyQzljQk9DYnQyU204blhWUkZjaFFjeGRCMUEr?=
 =?utf-8?B?NnhJaHNTUEs1SUVJTDBEdlZEQkJYTmE5bllrUmpxbTRNVmNhVWtqRVV0SC9s?=
 =?utf-8?B?VHJQeWR4MEFHdVBRdlQ0MlRqUHFEUDEwdXhtMUlMaGIzc3Fjb3ZSaVkzZm5C?=
 =?utf-8?B?eHViSkNMT1RYSUxlbkoxMUpaRW5rU1lvNGwvWkVobEZZQmdEYVBBNklMWE1z?=
 =?utf-8?B?M2tCMWFBTjdWajNtallsQWRSS1JMc2l5VjJyOStzNElLR3Q3V2E2cXYrSGc4?=
 =?utf-8?B?NnZ6MUQyU2xOdWh2QkRMU2dmWXhmUVRCVWNDd05VdFJBazdPbElBYmhJazhN?=
 =?utf-8?B?dzlKUUlBU1E1WXBkVG9HZ0t6LzMvMnpRTzU1SVdrc21yVVlUWVFaZUI2a2hz?=
 =?utf-8?B?YXRPTWxkMXA2Y2ZIbVRBNXhXWjBPRHFmZ3o0ZnFCc1ZVZDBJSytVZXVsdXhN?=
 =?utf-8?B?cWxSdERBNXdVWVc5UDN2ck5INmdST1BuOTBycGxJMUxxZnYyTUNNZTYrWERM?=
 =?utf-8?B?MTVRcmUvWDlWNjhId0V2S1p6QkhBazhlbzY2Nm9Balg2Q1g4NUQwYmRFOGox?=
 =?utf-8?B?ZEJyUUZ5TmZ4QStEczhlVXFnbkx6cEtKcjJWNGVQL2ZLVjZiYW1zejQ5enRV?=
 =?utf-8?B?bitOOGhvK2d5WEZadmdOQ2dmL0t2UTd4WFdkbjh2Y25lREpLdTQ4QnVnbng3?=
 =?utf-8?B?amJlY3Awb0NQVE55Z3RDLzV2UUdMcVV4YnVzVWtKTWZjaXJXVTFqSWVpenNa?=
 =?utf-8?B?RGpPTHpLVGxVQmlYZC83anlHbllIVUYxaHdjS0E0cWpwcWFJSml1d1RWRTUy?=
 =?utf-8?B?MGJMV3lhajRrY0dPY1B2NHFnL3VWdzYyaWRHR0Z3TUJaOGZ6QUJmb0taZlYr?=
 =?utf-8?B?ZXA2RytmQkk1dnBxV2JIK0pxNUJCeXVvOXNLamVTWkFnK2RzVm5hRWF2a1JQ?=
 =?utf-8?B?aCs3NFVkTjdqZnpOTEJBb1ZUMG1YTDNXMFNuamcvRTdyeWd0UjZmSlBBWmFJ?=
 =?utf-8?B?Z1dlbkRpUEVKdzl2VTU5bkliWmlTY25OV2ZnanlRdjN0bE0xUEhBclg0V3c4?=
 =?utf-8?B?R2tta09KYlVwVW82M2p2V1ZoSWpSL1RIUzBkS0NHY29qZUV5eEZuTHVTY3Zj?=
 =?utf-8?B?K29MSk5sc3QyV2VqTXYrRW43SmVmM0k0NmFyYi9YQkthYXBya2c4TTVEaVpB?=
 =?utf-8?B?MXNJZHFhT09yWmhvVHk0eUN0bytTajkvckd0OTdNd0EzWG1POGJCMWF0S1Jn?=
 =?utf-8?B?L01pU1hHUUtaZEg5ZXc4dndLejNvSi9sNkxKc1ZUU1lJZHp4OUk0NEFiWnUz?=
 =?utf-8?B?RVFkbldaL1JObk1WWEsxUWtyTjBKMnl1WlFLWS9GYm1LdlpHWXVVSGxrd3FO?=
 =?utf-8?B?UUhiKzZuZ2EvL0ZyUWIrcnZVTjhHOUQ2OGxDMEdzQXZocWh4OFpab0U5WDh1?=
 =?utf-8?B?RkRSd3JxdGg0bEw5VU44QmJZNkJ5dVlMVTIvaWNkT2x6TUF6UEpHVW0vYmJi?=
 =?utf-8?B?R0RBQUdYV29FczMyRWhLWnpsZWM4dGgrcllaeldJdkl5em5VcFIySzBnL2ht?=
 =?utf-8?B?ODNWakpUNXUyblRUY2t5NmtzMVdJdjljUlFzVlFjdVhHakNveGNHUmhOeGNs?=
 =?utf-8?B?OVpJV3hGUzRhSVdIQzVsR3BhOGxFN0xkd2VKZTNrNHRJRlpBWHhTYjRtQ29i?=
 =?utf-8?B?V3BOc2JqK2hBb1NiK25Zc2tjN2xzdit6dTgwc3dtL0RXQU5ScHd5NGtKQXZD?=
 =?utf-8?B?S1hrNk1zWENnaExBV3gwKy9pWFE5akJIcWJTY2F0NHlpTVE2THVuSWxPZmhx?=
 =?utf-8?B?UldYSmJQcWU2b2N3S3NPR281VytRNUEwYjNJWlRPVFJQNDhteldDeGxwalRT?=
 =?utf-8?B?TFVoUEtJMzJmTk9xd0VRZ0lvdVhzMzFqajR0NGdxN3B0ZEhYTHpXUjFLOG1G?=
 =?utf-8?B?NzM1YjRyVjBLRjRDYUlRZkVBOWhqMm51TDFoUHNZUUkrVmZrR0RLNHVRVEJ3?=
 =?utf-8?B?dnNaSTFTQlNHMUd2UGdON2xpUzMrWldZelZRVnJ1UE50V1NBMnArMitPVlhF?=
 =?utf-8?B?TTV2RW4wbGFoaHR4cElxYmNTTElQcitZOU94VHJmNXpvYUlYOWw4NzZpeWJs?=
 =?utf-8?Q?CFD6Ay5uVGbeHO34h1pbmvBSf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l/572tNtQnsRL4ncIH9KW7uJaMMtv7sS8jAbgIY9euSBpTyaVOU2eyfrAOInhSPcj20yJLHUOcFZE8zg6Rmnb6nzHRqoJ9+elBv4jwwvKEiCwdETIjVo4jrAcLT3VK8zYsZjTDksxrLwKuxhfqQuc+Wd+VIFfbQlzdCx6wlMYtuUnRxNF2Yfth68ejQIG386fencJAzckS/HzTIROTQIZi4pA+teZIgT+SrLw0ztNlfnP89u5iuzEoi49kIB+RVF5S17z9EUKmzUVbYhcdNN+PtasKZVABRWZMGHbb8vgMJeS+Nu0RlL64ZBgJXUSxMx7k4Ubqa0cowF1rzKcfX94uiGXRPazAyDdXk5GiMuO60OS3srnSWM+Zvqa+3XtcsUakrxMBrtP80zY6lPN3+IogNEmyCfcrTpRqr9SeIkpiGBVUUd1mhkA2iGfSfuZLczEi0UgGekKrgexSC2NzrIGmbpt+7LRqrzO9S8z9WdtDiZ7cg2L9i8vCw1gQyqE1QpnPv/Jto1opXUiShGD8zbv2UEQOOqHA0X+QkFuZc8ij6VMnIKaHuhJIw7XaT59Z9hQ13tZCfxbE/RF2YE0aN7/JqlO3MZx48wu3i29KFjE70=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03708c4-f814-4e5b-5d7e-08dd793e9e8f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:20:01.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZXD4Seqn8ZptVQzxusJn6uy57ZkIo+aoYd0snib0bA1vBnHUFOY86Z1Qe0EfN/0hFKsu0pJo5dCXRkbu7/4+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504110137
X-Proofpoint-ORIG-GUID: LVymWWltOLaglo4jop_Y9UTrRC8SXodf
X-Proofpoint-GUID: LVymWWltOLaglo4jop_Y9UTrRC8SXodf

On 4/11/25 16:48, Kris Van Hees wrote:

> Partial comments below (still looking at the provider changes)...
>
> On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The sched provider trampoline for enqueue and dequeue probes had
>> pending FIXMEs for providing a cpuinfo_t* for the cpu associated
>> with the run queue.  Implement the missing code.
>>
>> Since the cpu associated with the run queue might be different from
>> the cpu where we are running, it becomes necessary to access the
>> cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
>> helper function map_lookup_percpu_elem() that allows such lookups
>> on per-cpu arrays.  To support older kernels, however, we change
>> the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
>> table rather than an array in case cpus are not numbered consecutively.
> I agree with all the above.  Good solution.
>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   bpf/get_agg.c                     |  2 +-
>>   bpf/get_bvar.c                    |  2 +-
>>   libdtrace/dt_bpf.c                | 34 ++++++--------
>>   libdtrace/dt_cg.c                 |  5 ++-
>>   libdtrace/dt_prov_lockstat.c      |  4 +-
>>   libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
>>   libdtrace/dt_work.c               | 20 +++------
>>   test/unittest/sched/tst.enqueue.d |  1 -
>>   8 files changed, 89 insertions(+), 53 deletions(-)
>>
>> diff --git a/bpf/get_agg.c b/bpf/get_agg.c
>> index c0eb825f0..e70caa6ef 100644
>> --- a/bpf/get_agg.c
>> +++ b/bpf/get_agg.c
>> @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
>>    */
>>   noinline uint64_t *dt_no_agg(void)
>>   {
>> -	uint32_t		key = 0;
>> +	uint32_t		key = bpf_get_smp_processor_id();
>>   	dt_bpf_cpuinfo_t	*ci;
>>   
>>   	ci = bpf_map_lookup_elem(&cpuinfo, &key);
>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>> index d372b3445..d81c3605f 100644
>> --- a/bpf/get_bvar.c
>> +++ b/bpf/get_bvar.c
>> @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>>   
>>   noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
>>   {
>> -	uint32_t	key = 0;
>> +	uint32_t	key = bpf_get_smp_processor_id();
>>   	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
>>   
>>   	if (val == NULL) {
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 6d42a96c7..d6722cbd1 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>>   static int
>>   gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>>   {
>> -	int			i, rc;
>> +	int			i;
>>   	uint32_t		key = 0;
>>   	dtrace_conf_t		*conf = &dtp->dt_conf;
>>   	size_t			ncpus = conf->num_online_cpus;
>> -	dt_bpf_cpuinfo_t	*data;
>> +	dt_bpf_cpuinfo_t	data;
> Not sure about this, because (see below)...
>
>>   	cpuinfo_t		*ci;
>>   
>> -	/*
>> -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
>> -	 */
>> -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
>> -			 sizeof(dt_bpf_cpuinfo_t));
>> -	if (data == NULL)
>> -		return dt_set_errno(dtp, EDT_NOMEM);
>> -
>> -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
>> -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
>> -
>>   	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
>> -					BPF_MAP_TYPE_PERCPU_ARRAY,
>> +					BPF_MAP_TYPE_HASH,
>>   					sizeof(uint32_t),
>> -					sizeof(dt_bpf_cpuinfo_t), 1);
>> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
>>   	if (dtp->dt_cpumap_fd == -1)
>>   		return -1;
>>   
>> -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
>> -	dt_free(dtp, data);
>> -	if (rc == -1)
>> -		return dt_bpf_error(dtp,
>> -				    "cannot update BPF map 'cpuinfo': %s\n",
>> -				    strerror(errno));
>> +	memset(&data, 0, sizeof(data));
> Do we need this, because (see below)....
>
>> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
>> +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
> Do we need this, because (see below)....
>
>> +		key = ci->cpu_id;
>> +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
> Why can'you we simply do:
>
> 		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, ci) == -1)

I think the problem is that the BPF map has elements with size 
sizeof(dt_bpf_cpuinfo_t).  Meanwhile, ci has size sizeof(cpuinfo_t), 
which is smaller.  So if we do an update like that, the map will have 
stuff where we want it to be initialized to 0.

>> +			return dt_bpf_error(dtp,
>> +					    "cannot update BPF map 'cpuinfo': %s\n",
>> +					    strerror(errno));
>> +	}
>>   
>>   	return 0;
>>   }
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 6dcf4cd3d..d83b1c2ce 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>>   		} else {
>>   			idp = dt_dlib_get_map(dtp, "cpuinfo");
>>   			assert(idp != NULL);
>> +
>> +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
>> +
>>   			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>>   			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
>> -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
>> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>>   			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>   			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
>>   			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
>> diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
>> index c73edf9be..8b2cf4da2 100644
>> --- a/libdtrace/dt_prov_lockstat.c
>> +++ b/libdtrace/dt_prov_lockstat.c
>> @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>>   {
>>   	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>>   
>> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
>> +
>>   	assert(idp != NULL);
>>   	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>>   	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>>   	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
>> -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
>> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>>   	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>   	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>>   	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
>> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
>> index 3a218f3cb..a548e679f 100644
>> --- a/libdtrace/dt_prov_sched.c
>> +++ b/libdtrace/dt_prov_sched.c
>> @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
>>   			       probe_args, probes);
>>   }
>>   
>> +/*
>> + * Get a pointer to the cpuinfo_t structure for the CPU associated
>> + * with the runqueue that is in arg0.
>> + *
>> + * Clobbers %r1 through %r5
>> + * Stores pointer to cpuinfo_t struct in %r0
>> + */
>> +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>> +{
>> +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>> +
>> +	assert(idp != NULL);
>> +
>> +	/* Put the runqueue pointer from mst->arg0 into %r3. */
>> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
>> +
>> +	/* Turn it into a pointer to its cpu member. */
>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
>> +
>> +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
>> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
>> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
>> +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
>> +
>> +	/* Now look up the corresponding cpuinfo_t. */
>> +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
>> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>> +}
>> +
>>   /*
>>    * Generate a BPF trampoline for a SDT probe.
>>    *
>> @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
>>    */
>>   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   {
>> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>>   	dt_probe_t	*prp = pcb->pcb_probe;
>>   
>>   	if (strcmp(prp->desc->prb, "dequeue") == 0) {
>> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
>> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>>   		/*
>> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
>> -		 *	  associated with the runqueue.
>> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
>> +		 */
>> +		get_cpuinfo(dtp, dlp, exitlbl);
>> +
>> +		/*
>> +		 * Copy arg1 into arg0.
>>   		 */
>> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
>> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
>> +
>> +		/* Store the cpuinfo_t* in %r0 into arg1. */
>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>>   	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
>> +		/*
>> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
>> +		 */
>> +		get_cpuinfo(dtp, dlp, exitlbl);
>> +
>> +		/*
>> +		 * Copy arg1 into arg0.
>> +		 */
>> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
>> +
>> +		/* Store the cpuinfo_t* in %r0 into arg1. */
>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>> +
>>   /*
>>    * This is ugly but necessary...  enqueue_task() takes a flags argument and the
>>    * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
>> @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>    * outside the kernel source tree.
>>    */
>>   #define ENQUEUE_HEAD	0x10
>> -
>> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
>> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>> -		/*
>> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
>> -		 *	  associated with the runqueue.
>> -		 */
>> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
>> -
>>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
>>   		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
>>   		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>> index 498d5332a..2167ed299 100644
>> --- a/libdtrace/dt_work.c
>> +++ b/libdtrace/dt_work.c
>> @@ -37,35 +37,29 @@ END_probe(void)
>>   int
>>   dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
>>   {
>> -	dt_bpf_cpuinfo_t	*ci;
>> -	uint32_t		cikey = 0;
>> +	dt_bpf_cpuinfo_t	ci;
>> +	uint32_t		cikey = cpu;
>>   	uint64_t		cnt;
>>   	int			rval = 0;
>>   
>>   	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
>>   
>> -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
>> -		       sizeof(dt_bpf_cpuinfo_t));
>> -	if (ci == NULL)
>> -		return dt_set_errno(dtp, EDT_NOMEM);
>> -
>> -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
>> +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
>>   		rval = dt_set_errno(dtp, EDT_BPF);
>>   		goto fail;
>>   	}
>>   
>>   	if (what == DTRACEDROP_PRINCIPAL) {
>> -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
>> -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
>> +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
>> +		dtp->dt_drops[cpu].buf = ci.buf_drops;
>>   	} else {
>> -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
>> -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
>> +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
>> +		dtp->dt_drops[cpu].agg = ci.agg_drops;
>>   	}
>>   
>>   	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
>>   
>>   fail:
>> -	dt_free(dtp, ci);
>>   	return rval;
>>   }
>>   
>> diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
>> index f445ac843..28dcace8c 100644
>> --- a/test/unittest/sched/tst.enqueue.d
>> +++ b/test/unittest/sched/tst.enqueue.d
>> @@ -4,7 +4,6 @@
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> -/* @@xfail: dtv2 */
>>   
>>   #pragma D option switchrate=100hz
>>   #pragma D option destructive
>> -- 
>> 2.43.5
>>
