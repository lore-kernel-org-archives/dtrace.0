Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48E1E9B3F
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 22:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048938; cv=fail; b=hhXZeHYwbm+v/MrnXRBg1VibjD+1xw6UtMjguABDwEkvkyaAtOA7Wu6blOlzDXzpcG5cQkkO1Ph44p72Tu0yBqJDK19agUe3/TTSYzwCFgS0L1P102Jsoe07x90OWZKtxfjK++rj4S29b+DqB7oniJQ4yFdIb16Fy0GmhvTmhw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048938; c=relaxed/simple;
	bh=cM0Grq2wfyUNdvrxgOqenBnrZv060er24uO03tIDRSo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mVFP2BFWwqW+lnmvEaCMstafVmP1dhPIbpbnvmt7LxsZIQjJ1OOiQtyEKaob92gpMHyyfrAUSDSk+FKg07lTNr319VjI6S9T+wpN3bwfZCZfZYKXTm5TlQ0cY4scFeliH975nXa+4ppKtucLvMe3CRWsumqfSirUt3hzgtvNfUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LIbGXHDD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xGb4MG6M; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LIbGXHDD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xGb4MG6M"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599KgSL0001315
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 22:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Amv4j8XCkyeCvznnFv56/uCnESaRyxzAWZ3/q1BydUM=; b=
	LIbGXHDDc8h9BqZkP2UfUSaw/GzJlZRqUng/qKWvIjwA1h5VyPFRd9k+1152SaIt
	pDhDXtmpkxiv6rmz7r8kKXhrfOlto5somDnT5qrJ0QVM22J8gDNEcbEi7O62BZDV
	xWkBl5Gl+3jsFyFvp7yQm88hnxG27OTtJ32coftZH++zYv2NKK+UcdmRFsABK7j1
	PPm1WNcU4WfeQvgubUrJyoJFNnGNXfQloiPDi3yVSrw/We+aHIdbPGTo//xThRH5
	NQeK0+a1n6f+yt8c8h2RpsCww76CqcUTNbAQ+GH/5TkUB8MQEwiHPUoK3btUXOdu
	Om79I1ijSUXGMbSCDQvWxQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6bam5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 22:28:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599JqTqB036853
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 22:28:54 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv6892qr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 22:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeqRxcOerQYaEQA2V3SI7aCQND9Sq5RnA3WzE0bdTTyXpb3avaVViZK0r63TI59PWjGCb6/TT017C7WNA9g2OTp68/8Bhww/WaUJxjTnJ6wfnKqzKxltMhTQVNBAboZBn77uXtC7fgjEZaucxc6aOZwecESoqCCzeEplKbb+H4XDizhwmMeAmzSQvaL6ffCW3YNtj6KpaEVg/2dTB9gFfNoUAc1wbJoiD7o58MMCf+7vvu7te9hVzJxI9lGXo1xCLyH4j3xfSM0Gey5oOUh74aNLfgcYARwPwxCRSyXx6UNq+onMGA3jODTfjCb9aDZcM8t9eopClBfpaC3Z02jmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Amv4j8XCkyeCvznnFv56/uCnESaRyxzAWZ3/q1BydUM=;
 b=BSNzfYuqqGuij8742iQxzCh5pkj/7+hq51SlKQngQ2HECKR4xqdVzMSI5tURrGj9EPKC0cBWKtt1BU8aYN9PDLThQTXpteD5gMRfwU4z5mcPpi12Eaf0pUmlsxzD5fnMK4pO588MY3ogJNDVjArNB6UM1fj3/IOF7g6qH2eUzUZWtehyk+qAzAJY9jcoN/SbMCVZEHSUoTef+3XCqYjz6sfEsQJ5EHD8pyjdMDfNed6ST8WHqeMDNHK38ALHzq6o2w31EcYbfubQof/U53hRDZFaHkOXK8+DQIsuwwBbVdDx+M3uuYGRWUgRMcVttYW86KCkZqEFSkqiurhJqA94fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Amv4j8XCkyeCvznnFv56/uCnESaRyxzAWZ3/q1BydUM=;
 b=xGb4MG6MQkX8Jivt48qy31WaPD58Dc72tyIZYfF5pBAXfDyoZEVWYfOiDw3++Ty6Q4ttEFwxFqIEan/mDKInEWD5ne1G5wK2FyMWX1xDDfEU52nZrXlJ8/hcwOmG0HUYxVjgb2ydmVtnlqQ6BTkYEogiODxd9wguprCjSn+Eywo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 22:28:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:28:50 +0000
Message-ID: <de648cf1-e759-a8fa-1eff-9b5bacaab526@oracle.com>
Date: Thu, 9 Oct 2025 18:28:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 17/20] doc: Add IP provider documentation
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-17-eugene.loh@oracle.com> <aOfq59B41hE5uas/@oracle.com>
 <1c254ac3-ef20-b402-5e5b-debdf5128a8f@oracle.com>
 <aOgs8dd4BPKg0ymC@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOgs8dd4BPKg0ymC@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2e9ada-0689-4440-82a2-08de078338ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dURyemFJTFZFZ1AzU0hkYWc1RFhUNXloOUROV0FiTHR0aTNsekFaYzFWMm4w?=
 =?utf-8?B?alhMQ1d1Y3g1SUdSWWtYSlhiS1Nha1dRYTQxTXFUUEtGZHRzUFdOdGQzYlBn?=
 =?utf-8?B?M1ZBak5ab2wxcHY2RjJkR2NWOWlRODNoSWNMZ1R4STk3Rmx0b1pVbnNSL29P?=
 =?utf-8?B?dU0wYUZPbE5EVEtGdzd1K0M1TG9SdUc4azNVZ0tWZ09GSk41ZjZRZjcrcDRE?=
 =?utf-8?B?ZGlJSHZyUThWOWpBb2p5RDBmZWliRE9ZTlpaa1N0MGZNdGM0VFhwdlJsNmZp?=
 =?utf-8?B?a1lIbERkRmROWE1lbGN5cmhmcTROTktRMHNoTVd3bDdIampFZnpYMVgxUkp2?=
 =?utf-8?B?QnVCT1M0VVRoT2pxMFIvRG9HOS9ldHp0cERaay9lVWhUa3RQaWU5SjJITndR?=
 =?utf-8?B?ZGZ6YUdpRS9LekIyTDcxVGlOeVFCVTZUUlhqMkV3UFhJTHNEVlNvNVgrQ1hU?=
 =?utf-8?B?OUNIYmFkcm9JalAzYUlrRGg2ZDlGVFFqbFlqRW9UMnBJcTk2bTZncC9iOWdr?=
 =?utf-8?B?ZElYdjdrSThMZTFSZDRseEJ5ZWIweWMva3ZIYlJQMWoraVlVUzhLTDJmdVAw?=
 =?utf-8?B?elJHVlJiKzFmQ2owWjNyUktNMjFkZnZBNjhFWEVHRFluK1p3bm1hUGVTZzhC?=
 =?utf-8?B?UEViM2djNktrZ2h4ZFB2WVh5T1pHak1ldnJkRkRMVFJZWkJZN2NRVWVzY2V1?=
 =?utf-8?B?WGhxTEZXd0QvOU5WZkxkUCtuNUhQbWs0ZnFIUGMreWZpaUZ2ZnhBVjFwRFlK?=
 =?utf-8?B?cFhCMEdzNzR4Qm5MeXdNNnphWVpaSlBqZEJ0M0trM2lzSHlFZktIV2tha0R6?=
 =?utf-8?B?aVRMb0J5QkJVeTJoblk5eTE3MDFjbXhxK2QwWWxtSWd5NWppQTNwdks4VUhK?=
 =?utf-8?B?Ym1tNFc0SkQ1SHprcjRqeGMxYzU5Q2FNbXQwcVY0bEszVGVqRHBaemUyUFNU?=
 =?utf-8?B?aHVBSnNsNnZsYzg4QUhlSGJhRWNCZW9xMDBsY1daSll2dUdUYnZYUkZhRjVa?=
 =?utf-8?B?YWxPTTliSU11d1cxRUJHczNxV0d4eHZDYnFQenlYRjF4ZklKWlhONmtxdzhI?=
 =?utf-8?B?R1BVUmhxdmlyMEswZHBuTUQxb1Q0cXpyYzJEd05BNEVqckxsK083RTU3ajJ5?=
 =?utf-8?B?KzdUbUdwZnZLdDNCMVZwampLWk9yOU5CWVp6TFEzVUVOMURvVmpTNndhcks2?=
 =?utf-8?B?TWZCL3dsbldzUW83VlViVk12RUVDajZOL3ErSnNIdkRDQ1o3cVdBajBESC9Y?=
 =?utf-8?B?M2RBUktYRFAvNHZNWlNDOENFZ2cvS0pWTUpUREJIZDJmNWFReWM5OWtYWEtU?=
 =?utf-8?B?cnRnMW0yUEZtK0lNcVEzWnFyMnRSTkFOUC9nUk01SW9sZHpNM1p1SU11dFpI?=
 =?utf-8?B?VGQzM2lpelhzanpqMHpxeEFOS01YcncvL1dhcEtsenQ0SC84KzkyeWRmS25n?=
 =?utf-8?B?NHN5alJFaEdMSEJNcHhBbWorN1F4cEVJSStMQ2ZCcVV3K0dYQ1d6Y2lYRDJ5?=
 =?utf-8?B?dnc1cW9zekljcGZVSGRSdUZWbmNoVHpLbjZPK0FiY1dlUlhITEdPZThqM1cz?=
 =?utf-8?B?S3Y2VEk0TE8xNmxMTW8yTUpyandHU2dIT3FFMWF1eHVlNHJtQW1JbnlKNFIz?=
 =?utf-8?B?bEUyV0F2VkExWE92dzVHSExXT1VXWGtHQ1pvQVRWWEZaWlExZk9IWTlOejhQ?=
 =?utf-8?B?M0hSY2xlNTUyU21ObUNvY2xvK09lRmF1c01hZWpPcWJ6M0hUVzZmbDArZTV4?=
 =?utf-8?B?Wm1rR3dIUGp4QU0wczJxYzVPOUp0WExsVGFLZU85Rmdic05Sa2FOTS9FT0wz?=
 =?utf-8?B?YUw4L2pwNytHR2sySjNxNEJQeVdqalkrQ1llN1o3R1lFYlhNdENuSlA0WTRk?=
 =?utf-8?B?UjBhNk9OYlRBdmFja3I4cnJpTWVjSkw2T01jenRqY2dkWEJkU0VJN3lzWk1Q?=
 =?utf-8?Q?Dx3aN91Sv3x0bm835fw7qgDfoCaX+oVZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNGMGllM2pSTSs5NGc1R2RhQmpwQlloQWNOVVhGWXdYbkcxQXpPS2FkUy9J?=
 =?utf-8?B?M1ZlbnJFYjlRb1FBUkpXWnJsN2ZGaEZXNFV3Z2ZoemVrSnM1Q1lKN3dZVlhj?=
 =?utf-8?B?ejNia3RyQzNVaHpDYWVmYllkWk9KTFZOTlBUaWZWTEthZkJ6UkppMWxvWEJ1?=
 =?utf-8?B?b0lhTEI4V3AxZlk1aTJoOUFGdjZ0TUxTL2p1NThLWkhVZG5rbnNwdm42ZHdW?=
 =?utf-8?B?WE41eDN6MFl1VExqUmFoTWd1ekV6a0hnOEdVM1BRQUtHR2xEUWlpN2Fzd0NV?=
 =?utf-8?B?MUJqWnVRYmx4NVBJVlNxNlVkWlNXZFVuYmwwZ05KMlhiUzRueUQ4cEdWdmJT?=
 =?utf-8?B?bmZRSTdRbXBqYXc5L1loNzhJc3JXbFpCOGpCdmpINzJ5ZXdlT3Z3TWNkY1BX?=
 =?utf-8?B?ZVBmTkpJMldzZFluNk83ZFh6QU9PbDZuRHF4em9OdFNSNjY4YzBnWkxkdzRS?=
 =?utf-8?B?bFF4NHF1d2NpTjhvNmdoNTlMRE5BYUFNUi85eGVNL1pnU0RxN2lpL3VpcWxQ?=
 =?utf-8?B?ZksyM2hueWlzWWFKczFjeTF0S2JvSDhrU1NFYisyQUdsWDgzZlpqcDlNVnNz?=
 =?utf-8?B?TE02R2MyQWNyYWtvNERDYldtK3B6TTNseDB0ZnpTVVMvVkVWQUhjYTZRTmUr?=
 =?utf-8?B?VHVhOENNL1V6Q1dkWDJlTG0zTVZNS0JDVDc4eHlGOC9EckpLQlRZaFlYd2hN?=
 =?utf-8?B?VW44QjRxWUxBYm5CRVg4bnJFR2JzMVVhc1MreUtvWE9qcnVvd05BcG41V1V0?=
 =?utf-8?B?UERtVVBRZDc3amFLTkhLSGJZZEszdlRrTzNzWklhd1lNOWt5NE5hdDIzYkdq?=
 =?utf-8?B?eVRFZWhPNGlxU0ZlcUVwZWFDK2ZCMm55UWszTDQvRk9YN0FxNGR3REl2SStu?=
 =?utf-8?B?VkoxQ3JzTXBSSDhPOW1vSXEyRm1LQ1N4a3RpS3pqVmZpZSt6dWt4c2ROK0Z4?=
 =?utf-8?B?RTczSWF6TjY5VzUrRU9kSjRudU9MTWNYRXgveElxUnRJa1NkUWIyTFdkMG9S?=
 =?utf-8?B?R2E2R2JCS3NkRk80bHYvMlM3STV0UkNRYWF3N0RkNENjOHVMcGJIdWY0RGs1?=
 =?utf-8?B?SUR3bWtIeWcwYWNqQ3NUdTlNQWJsMVZaUk9JOEJmdFV5RlNFS045a2dQdGxK?=
 =?utf-8?B?aUw3ZmJEZ05RbnNVM0c0d21sYmx5T3MxZmJ4UW4wYjhnamQwbE00Qit3T1BO?=
 =?utf-8?B?UU5EZ1pvOE5FTDRjU3BqQlQ5N212ZGNQQWtzQjJwL3AweTBucElGTmlGRXNH?=
 =?utf-8?B?bFhCM0RHMGx2RERuallucWlsS1NNQkFwUVJuRmtKN2hpa1VuTEF1MHVGbUh3?=
 =?utf-8?B?b3hyTDk0d2gyYlhUaTJRSDVvOWFqaGN5SXBmT3VUdHArL284ajBlK2RIQ1A5?=
 =?utf-8?B?ekZPaHN6NU1NbTUyU3R5SVBFTGZ5bzBjS3FjcGRzbC9JemdOcHkreHNHQjFI?=
 =?utf-8?B?ZDdLRXQ3eTFYNHdGU2o2R1NVMTJvRHp6SmR5eWJxLzhRa2tkeXVaaldrK2xN?=
 =?utf-8?B?eGdaM3lvMFNPTmhmYjR6OUFCU01lODlRbEhPNWZTeFJpMktOYlNaNDROSUFN?=
 =?utf-8?B?M0gzRzBkMkk1UHBxVTlYT3hhRDNDL0dGajk3MFMzdFR1V0RsbjJoRkc4aHZn?=
 =?utf-8?B?WDg1aVZCa3l1dXhzaVB1V3R1a1UyTlk2eTFTc1ZRRnYyQzFPSHQ5ZVQzVmov?=
 =?utf-8?B?anN5UW9GWE5OUGtDY3ZJSDRLQ2lQS0dERkVZV3dZL1Y5NWtvaVRFS0NlYm1M?=
 =?utf-8?B?OERid1NsMzRxVWFROWIwVHVFSTBDNzhJUEZzMjd6Vm9YamJLRVhyR1FEQTJM?=
 =?utf-8?B?bHU3Sm8raWEzWUNUOWtmQSsrWVA0U08wNGVZbVFDY05kYjJaVC9rQ0d1R0lD?=
 =?utf-8?B?cUwvS0hBcUJiQXBhQ1Y4WWtweFZibHdMQXphdmRaNkNuSUFDZnFjbVRjTXNN?=
 =?utf-8?B?VVBzY01oZmFsc3RQTDJJL2NHTlBMWVdFYWdZVmZHMGVuSEU5cDArR00zbmM3?=
 =?utf-8?B?em1VK0JOd3ovTFBPaGtWOWM2UnlnQzhiVktKclI2cmJhblU5ZkREaEFLTXhS?=
 =?utf-8?B?RW1VUGdWdTNLM1greWIrK3FyZUdYdG83a1hCZE5qOVFaeHJ4ZHJxaHR1V1Bh?=
 =?utf-8?Q?fxKPYoANWqnXfhFBcSdd0JOOQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7E71dOHJCTwGo7qZWe/Bnh/rccyjrqj7HfBEihiaUim4OU65lMkc84BcqJkQj2mwOPtEcmer651424LuRRZC9/Z69xsoXQhUuZNNQXCyAD+Qkbe85hyXvj+CR5m2wC2pTaKQPOcO1tyEKk9yE60AbSPvBEeHgyRsIowmbN07retoTwjTur8j7UFHabZc+c7FmKIcXr9sfwptdhkKhD05a+Z6+/gnfaesVzwjKqNK1ZxfF9o57qrh1t/+bMZW8PruArmwXFBhrNiLJkxikTXKBfUGf/1dWieptpv2k9Byl3B6AOZcuCyY23KVNPgLVr7zN0KvI43R+028CFt8TtchvB+KQs9ii3DN3v3DZq2rxpWs9xxExOQuSLvUBoRAT+MsUv0QJw1AGeufV15LIu5jgaPtOFgaS3u4jQxjA82gHrxzxR00MTdXis/taFFl5FCEATPkxGqpEP2fbA2I5a4/1gnSWEQvuQvKc2l2UPXz45aIpSwODhsQ6N8r2NfLOUHSt7zfcEg/SYHH/ocwi3OSgehvdNMpO7cJSbc09OL38dE4MaRCq/XE7Q4J7VgVMzpYd2Xn6SZH3kEglNr8hd0He6gjsFQhmpfH2UULpUct9tM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2e9ada-0689-4440-82a2-08de078338ab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:28:50.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcmvMT2BoDl468mCMjB+JZ7GDq1y79keQPXCe8JsECLsJ7He1MzjFaZCBXThXQ/+0aS1Q5dOaXZF1OuojDQh6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090137
X-Proofpoint-GUID: nVLcyDDtFclSoiXg3DX6QcaK1I95noip
X-Authority-Analysis: v=2.4 cv=Nb7rFmD4 c=1 sm=1 tr=0 ts=68e83727 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PqxJ-LaAlSCuc-BhajUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nVLcyDDtFclSoiXg3DX6QcaK1I95noip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX88kZVpON8qT/
 kS8smpykpxhggwzcPXphcz59YytNZte/PQElM8Xzq3zpViJIceY4YNOJc5yPctZMKQMhA6X5NAx
 1zG0QF7zase7/WNyV6a+Uc3023WWS8ts/g2mIT7bNnWeWyMQE78WHTSwe408Nm5SVd6TBR5c4zh
 Kw7qE+7LLDtdZUc/9uAhYnhRiUUMjs8Dn/C+/AzxKAa3S4Neg7+yU6xk7vxk1nUmCZGqKCAZ2yl
 gGASIXpZYhCiPsNwBQ99JlA7LwgRESr47PSEuGNwiwyWf9I3ckT0OWFLGY1buKwaAzEySdyOHw6
 0NxDv91aRcwwfIkZiIb4oVbbxZi6wRZMAZ9VWbHKT/en5G2oxi+Hy+jtO+BWEocaVqg5Gtb8OWR
 CAKfhIwrjc7AveC+zsm+W6saapMABg==

On 10/9/25 17:45, Kris Van Hees wrote:

> On Thu, Oct 09, 2025 at 05:00:06PM -0400, Eugene Loh wrote:
>> Hmm, just to clarify... you mean pull this patch out of the patch series so
>> that it can be applied independently of the other fixes?
> Ah yes, I didn't realize it was part of the 20-patch series.  I think it was
> an independent patch in its v1 form?

Right.

> If so, I prpbably was thinking about that.
>
> OK - let's keep it as part of the series and it will go in with it.

Sounds great.

>> On 10/9/25 13:03, Kris Van Hees wrote:
>>> This patch does not apply cleanly to dev-queue.  Can you look into that and
>>> post a v3 (keeping the R-b)?
>>>
>>> On Fri, Sep 26, 2025 at 03:05:54PM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
>>>> ---
>>>>    doc/userguide/index.md                        |  10 +
>>>>    doc/userguide/reference/dtrace_providers.md   |   2 +
>>>>    .../reference/dtrace_providers_ip.md          | 174 ++++++++++++++++++
>>>>    3 files changed, 186 insertions(+)
>>>>    create mode 100644 doc/userguide/reference/dtrace_providers_ip.md
>>>>
>>>> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
>>>> index f3d96a4d6..18b9bcd68 100644
>>>> --- a/doc/userguide/index.md
>>>> +++ b/doc/userguide/index.md
>>>> @@ -208,6 +208,16 @@
>>>>                -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
>>>>            -   [io Examples](reference/dtrace_providers_io.md#io-examples)
>>>>            -   [io Stability](reference/dtrace_providers_io.md#io-stability)
>>>> +    -   [IP Provider](reference/dtrace_providers_ip.md)
>>>> +        -   [ip Probes](reference/dtrace_providers_ip.md#ip-probes)
>>>> +        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#ip-probe-arguments)
>>>> +            -   [pktinfo\_t](reference/dtrace_providers_ip.md#pktinfo_t)
>>>> +            -   [csinfo\_t](reference/dtrace_providers_ip.md#csinfo_t)
>>>> +            -   [ipinfo\_t](reference/dtrace_providers_ip.md#ipinfo_t)
>>>> +            -   [ifinfo\_t](reference/dtrace_providers_ip.md#ifinfo_t)
>>>> +            -   [ipv4info\_t](reference/dtrace_providers_ip.md#ipv4info_t)
>>>> +            -   [ipv6info\_t](reference/dtrace_providers_ip.md#ipv6info_t)
>>>> +        -   [ip Stability](reference/dtrace_providers_ip.md#ip-stability)
>>>>        -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
>>>>            -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
>>>>            -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
>>>> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
>>>> index 9f64935c6..54a018d5c 100644
>>>> --- a/doc/userguide/reference/dtrace_providers.md
>>>> +++ b/doc/userguide/reference/dtrace_providers.md
>>>> @@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
>>>>    The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>>>>    -   **[IO Provider](../reference/dtrace_providers_io.md)**
>>>>    The `io` provider makes available probes that relate to data input and output.
>>>> +-   **[IP Provider](../reference/dtrace_providers_ip.md)**
>>>> +The `ip` provider provides probes that can be used to study IP traffic.
>>>>    -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
>>>>    The `lockstat` provider provides probes that can be used to study lock usage and contention.
>>>>    -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
>>>> diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
>>>> new file mode 100644
>>>> index 000000000..4e6c47fb2
>>>> --- /dev/null
>>>> +++ b/doc/userguide/reference/dtrace_providers_ip.md
>>>> @@ -0,0 +1,174 @@
>>>> +
>>>> +# IP Provider
>>>> +
>>>> +The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
>>>> +
>>>> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>>>> +
>>>> +## ip Probes
>>>> +
>>>> +The `ip` provider provides one probe for IP sends and another for IP receives.
>>>> +The module name is always `vmlinux` and the function name is empty.
>>>> +
>>>> +## ip Probe Arguments
>>>> +
>>>> +The following table lists the argument types for both the `send` and `receive` probes.
>>>> +
>>>> +| arg       | type            |
>>>> +| :---      | :---            |
>>>> +| `args[0]` | `pktinfo_t *`   |
>>>> +| `args[1]` | `csinfo_t *`    |
>>>> +| `args[2]` | `ipinfo_t *`    |
>>>> +| `args[3]` | `ifinfo_t *`    |
>>>> +| `args[4]` | `ipv4info_t *`  |
>>>> +| `args[5]` | `ipv6sinfo_t *` |
>>>> +
>>>> +### pktinfo\_t
>>>> +
>>>> +The `pktinfo_t` structure is an abstraction that describes a packet.
>>>> +Detailed information about this data structure can be found in
>>>> +`/usr/lib64/dtrace/*version*/ip.d` or
>>>> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
>>>> +The definition of `pktinfo_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct pktinfo {
>>>> +        uintptr_t pkt_addr;
>>>> +} pktinfo_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
>>>> +
>>>> +### csinfo\_t
>>>> +
>>>> +The `csinfo_t` structure is an abstraction that describes connection state.
>>>> +Detailed information about this data structure can be found in
>>>> +`/usr/lib64/dtrace/*version*/ip.d` or
>>>> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
>>>> +The definition of `csinfo_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct csinfo {
>>>> +	uintptr_t	cs_addr;
>>>> +	uint64_t	cs_cid;
>>>> +} csinfo_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `csinfo_t` from the `struct sock *`.
>>>> +
>>>> +### ipinfo\_t
>>>> +
>>>> +The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
>>>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>>>> +The definition of `ipinfo_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct ipinfo {
>>>> +        uint8_t ip_ver;         /* IP version (4, 6) */
>>>> +        uint32_t ip_plength;    /* payload length */
>>>> +        string ip_saddr;        /* source address */
>>>> +        string ip_daddr;        /* destination address */
>>>> +} ipinfo_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `ipinfo_t` from, variously,
>>>> +`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
>>>> +
>>>> +### ifinfo\_t
>>>> +
>>>> +The `ifinfo_t` structure contains network interface info.
>>>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>>>> +The definition of `ifinfo_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct ifinfo {
>>>> +        string if_name;            /* interface name */
>>>> +        int8_t if_local;           /* is delivered locally */
>>>> +        netstackid_t if_ipstack;   /* netns pointer on Linux */
>>>> +        uintptr_t if_addr;         /* pointer to raw struct net_device */
>>>> +} ifinfo_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
>>>> +
>>>> +### ipv4info\_t
>>>> +
>>>> +The `ipv4info_t` structure is translated version of the IPv4 header
>>>> +(with raw pointer).
>>>> +These values are NULL if the packet is not IPv4.
>>>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>>>> +The definition of `ipv4info_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct ipv4info {
>>>> +        uint8_t ipv4_ver;               /* IP version (4) */
>>>> +        uint8_t ipv4_ihl;               /* header length, bytes */
>>>> +        uint8_t ipv4_tos;               /* type of service field */
>>>> +        uint16_t ipv4_length;           /* length (header + payload) */
>>>> +        uint16_t ipv4_ident;            /* identification */
>>>> +        uint8_t ipv4_flags;             /* IP flags */
>>>> +        uint16_t ipv4_offset;           /* fragment offset */
>>>> +        uint8_t ipv4_ttl;               /* time to live */
>>>> +        uint8_t ipv4_protocol;          /* next level protocol */
>>>> +        string ipv4_protostr;           /* next level protocol, as string */
>>>> +        uint16_t ipv4_checksum;         /* header checksum */
>>>> +        ipaddr_t ipv4_src;              /* source address */
>>>> +        ipaddr_t ipv4_dst;              /* destination address */
>>>> +        string ipv4_saddr;              /* source address, string */
>>>> +        string ipv4_daddr;              /* destination address, string */
>>>> +        struct iphdr *ipv4_hdr;         /* pointer to raw header */
>>>> +} ipv4info_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
>>>> +
>>>> +### ipv6info\_t
>>>> +
>>>> +The `ipv6info_t` structure is translated version of the IPv6 header
>>>> +(with raw pointer).
>>>> +These values are NULL if the packet is not IPv6.
>>>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>>>> +The definition of `ipv6info_t` is as follows:
>>>> +
>>>> +```nocopybutton
>>>> +typedef struct ipv6info {
>>>> +        uint8_t ipv6_ver;               /* IP version (6) */
>>>> +        uint8_t ipv6_tclass;            /* traffic class */
>>>> +        uint32_t ipv6_flow;             /* flow label */
>>>> +        uint16_t ipv6_plen;             /* payload length */
>>>> +        uint8_t ipv6_nexthdr;           /* next header protocol */
>>>> +        string ipv6_nextstr;            /* next header protocol, as string */
>>>> +        uint8_t ipv6_hlim;              /* hop limit */
>>>> +        in6_addr_t *ipv6_src;           /* source address */
>>>> +        in6_addr_t *ipv6_dst;           /* destination address */
>>>> +        string ipv6_saddr;              /* source address, string */
>>>> +        string ipv6_daddr;              /* destination address, string */
>>>> +        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
>>>> +} ipv6info_t;
>>>> +```
>>>> +
>>>> +**Note:**
>>>> +
>>>> +DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
>>>> +
>>>> +## ip Stability
>>>> +
>>>> +The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>>>> +
>>>> +| Element   | Name Stability | Data Stability | Dependency Class |
>>>> +| :---      | :---           | :---           | :---             |
>>>> +| Provider  | Evolving       | Evolving       | ISA              |
>>>> +| Module    | Private        | Private        | Unknown          |
>>>> +| Function  | Private        | Private        | Unknown          |
>>>> +| Name      | Evolving       | Evolving       | ISA              |
>>>> +| Arguments | Evolving       | Evolving       | ISA              |
>>>> -- 
>>>> 2.47.3
>>>>
