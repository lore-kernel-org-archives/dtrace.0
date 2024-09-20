Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD917BEAB
	for <dtrace@lists.linux.dev>; Fri, 20 Sep 2024 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726860034; cv=fail; b=nWlbWa5Rwb7RmLpRexiSLJwVW+Nv2MghEQ7jNhaYZdTkfrtA4TWziugE3c6oAAEDq0y0+md31pBrli5P0XLtMepkEX63j5UEHoAx0ySpt/eZ+/vnqegmY224/rvbq9nd8Tb5ip2TjtR5HSwYbnCuaR6gOxzESVP80O8FFeEQX3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726860034; c=relaxed/simple;
	bh=xDAm/1nU5zD4tW7pZ+f7nZTlVTFZCJGZ/RONVzWcLsw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZZlDl0L1BDdrBCOnaU5bxxJvOx917Z8nnTj+3zkhnwqqQoc/S3wEvZnLQ67mCgAxATeeouGl6qjSeqYNG/+SUl6cKaaC/B1VHxY+pKHCdPSLgrZ2eL6szuJjPwGypqkU5A6ry8ofDSwIjYp0Y37E36t/WROhp0+syyIL6zz7iRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z/xw2W2R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BKRxjtNR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z/xw2W2R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BKRxjtNR"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KItciI018574
	for <dtrace@lists.linux.dev>; Fri, 20 Sep 2024 19:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=6EFZlzzSZA2Mkn3Sl8q20cWlqpaLhMa6g2rpJ/hU6d4=; b=
	Z/xw2W2RNv9qrN8VQ8MwC8gg1HeAgBadQ9yefpgFycyfipO2vuImB8jA6veeVrJQ
	fCGV9EXdW2Yh6r1Y2bw7ZbhrDIvuDRYDL8UB5GZIQrzj0/wBjmCorvT+Ob6PiEAQ
	t1R/54VNON56b89oUH0kjq9uh2oNqGbPkYi+fv7b5XKbirzHKgM9njUzZTF8LfEN
	uMj4hIttxsDJknwFI0c+9Gplv+V0uLYbqNYSUIqUDNm9qfyO1EZ//G39yQTiyx+y
	B+u5ML12UNxARSQhMC2jbT1SJEuqOrHRphfd8AE2tTxbT/gHRmuUXBGRECsOG42x
	X4GE8HrJjVeSJHemR8j1ag==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfyjhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Sep 2024 19:20:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48KIXT0G011058
	for <dtrace@lists.linux.dev>; Fri, 20 Sep 2024 19:20:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nybbf8v9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Sep 2024 19:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7zv1vIlhHTcX2Ug4oV9mos0pyJEKcpXjI8IDEgAONvtErYuu6iBn5/LRKpQDI8xqqQ+kMMrLg6mYhksg2/CRJ0xgVhZjYb3eLgVcQcSAsk4eZ1cx2hSwBdf8mek1sEhsN/FGh9sEMw0eNAA8brkAZwNR2hP+mfSxgsziGfV+fbFd77A9Fd6NdbZ1axPBd+k8JMaaLQj72FjtcOdEnn4h7fLeg73/AZUPzRUpp749mPNKU69XZvU/rwtM6tTwsYXPmBrT5zJa/mrBVmKEj6kjlLIhJ9R+kak6ZPo8YtackHRR5d0K0Qoht1flHaDeZDMeg/ryIY7Jd2/2njPiQiG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EFZlzzSZA2Mkn3Sl8q20cWlqpaLhMa6g2rpJ/hU6d4=;
 b=eK2REuib8S6bk7xj/4S1faTBLTZfbP4rSU6kbTFy62846WSXBrJL8aeKZzIx8e1NpD2kDf25z2X4h+qEn3PZlIY4Cb4xpkdpex6zmcP3qITqFIA5Nuj1Phf4hiA9338j/xn2bAUJSWYNMn9QODDypTB0cCfkB20672PoENLObtqDr4xOicnM/y2FcW+NWg1qZbcVAwI5Zf6GE73ITbVz4GJJWAG+UokqwvHeNEoDP8P7GVXXKOJn9B70SBkxVxT0xlq6H9oCw//ZIflSpbQfzlJF0kbfLkqWMSaXSFt/AB/l8m4duOtFfuN7WKCCJGdlYcBLAKim4SIWLycLwaP0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EFZlzzSZA2Mkn3Sl8q20cWlqpaLhMa6g2rpJ/hU6d4=;
 b=BKRxjtNR5cITC6AuP+3fe4GLzAU1Md6p5W+CwumcqVxwn6NrUxMGxKbSrpiRtUTttQVsm4R2l2ecSnClxi8KHGfisSAIG0t7DttaFclu6PnPUhJBNYto9+2iBQ6cQoB1+KaGfTS1aibiGrs35HZxpaKJLcp7A9dBAMrwIq058q0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6345.namprd10.prod.outlook.com (2603:10b6:303:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 19:20:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 19:20:26 +0000
Message-ID: <0603807f-5d44-4464-815f-566d0ee8c9b2@oracle.com>
Date: Fri, 20 Sep 2024 12:20:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] options, test: correct bufsize calculations and tests
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <ZuwfFjKdHQvlxuSU@kvh-deb-bpf.us.oracle.com>
 <f40cc706-20bd-e0ae-9e08-ba3a450e4b54@oracle.com>
 <ZuyQM2y6REtQJQsK@kvh-deb-bpf.us.oracle.com>
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <ZuyQM2y6REtQJQsK@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cc3821-6d6c-4bec-33d3-08dcd9a94854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1lJVjVoNjMyb0lsak5iaVJEUVQ2bkVJVlNlMTl5bTV3ZVdsa2FvVUpKejNr?=
 =?utf-8?B?ZnVFUmZyMitEWkhyK3hZb0hRNTlnVGw5dUZDc2gwM0Y5QUxwWmFFZVdERTlD?=
 =?utf-8?B?YitOemYwM1FSbFFuN0t5QTBHYTBleVF4NXhpeVV2RisrYjQ5aEEzOUVqVmF2?=
 =?utf-8?B?ZFFSOXZYeFNwY0pmMGpNVjdOZFRqamRjeUtMU0ZvdXlZSDduNXZFbFEvQlVL?=
 =?utf-8?B?WjV0bUFxS1FXQzdnOGJZK3E0QiszUmVuamtiMXFndm9rK0JhM2gwajRRZlpr?=
 =?utf-8?B?YWNnNFpMUnJJeUpMb1BlbWFXZmlsWDc2TkpYYUs4ckorUFZIS0FhZVorRUtC?=
 =?utf-8?B?RmVsSWp5UW55ZEQwNmZFeDQ0NmdlL2VtUEEveFAwQ1liV1JXUDlRMEd5ZG93?=
 =?utf-8?B?SEJJZFprcjd2T2pXKzBpRTE5U3RqUXlSR2tOczU1MG1VYWVnUjlCcEdPcXZN?=
 =?utf-8?B?YWEvZnFqQ0tkay9iZTNOMTlleExNOEJCTWo4U3IzSGRhMVhQa2RrdWlqdHdI?=
 =?utf-8?B?QlhMcWk4WVUzWEVVVXlyVzgwd2xUUWVCTCtzSlg1MUdJODNPcmxobkpxQkFy?=
 =?utf-8?B?bUllWkdId2hpQ1NpYWhvclk1eHlaWngwR0toQk9PTUFsZytnSXJoUjRlbHdC?=
 =?utf-8?B?SWs4UWpjQlQ3ejQ5bHdqUzdJRElEWkhEc3V3WFRNUktaeVdZbE9hL0JzWHlm?=
 =?utf-8?B?RUVSbk1hYkJidkZaaUhxb1VTbE9Da0xTZHRTakxDakxWQXI3TmRpU2lYeURS?=
 =?utf-8?B?a1ZXamhTRXFOWFB0QWIzTEY1YXZlOFA2ZXhqYW9idTBZYmhRWE5lcnRkdDhF?=
 =?utf-8?B?ZWhaVlBkdXVSWC82aUdFdVlEZ3lFdGFRZ3JzdndGMHhneERLT1JsWlNjRk5x?=
 =?utf-8?B?eGJ3YktWQzNmakMzc2NqZUdUM2xvU2p6UUhPV2hHTnpXWW5NMEs2OFNFWHhR?=
 =?utf-8?B?UWhjOURlOVNPSnErYjQ1bnF6cFVpQ0MvWjlZOE9zK09DOGZZUzBsVERxUlBE?=
 =?utf-8?B?VDMxbTFuTGxaSk9SZkxnWjRZZUFCTGR3bU43WXZXUkxlSkR4ZUJBWnJURzhm?=
 =?utf-8?B?dWhxSlNjTGxseHNhNTg1L0N2OU9NcmVCa1g5bVNHd2pxaENaUms0T0RDWjlP?=
 =?utf-8?B?SUNxdERwWkMvZEFiUjY5L3pTRkliK054MUJvK29sdDh4SVE0MnJMbW16YXRZ?=
 =?utf-8?B?aUFSWlNYTnBQTThVRjl2TmVldVI5ck41aEdJZi9yaVlUUzhmME9GNUdaNUdE?=
 =?utf-8?B?RDNZUThRQzdwcjRSdDNCb3JHdDdJK0E4aEpORDh4NVdYK0F6bkhBZEU3aFAv?=
 =?utf-8?B?K0ZZR1daR3BHSFZDZ1FhZU5KeGliNVpNOHJjMWJyTW5BUkpPQTcxRzJWTXpW?=
 =?utf-8?B?d2o4V3ZGdm9iWktvVzM3Um5nZm0wbk0wY2tFWWRqMUZ1aHJLQWxxcXVSVHZR?=
 =?utf-8?B?Z0FSUW15YzlKUjJlQk9QbkRDaFFJYXhqU3Q4V3I5TEMrN3dYR2hZTXhjMmE5?=
 =?utf-8?B?MCsrTWZaUHZFbytpb2VZaUwvQ3dQTEMzcXNkaGxxOStnakg5NlQzSDk2aUxx?=
 =?utf-8?B?Tm5ySHNkN24yMU10VytTTCtIM3VSRG56NEt3QVJrK3k1ZGFJQllyOS83aFdD?=
 =?utf-8?B?N3hLUUZ2QmVJZ05uYVVwWVh2QU90ZDNaNTcvVTh2c3ovN2MwTkJ4eUlWcmNu?=
 =?utf-8?B?Y25kU0xFUWdwOHY4UXMrcWlMdmdhMDVoeTNiOVdDOURmTUE0UjFXdFBtUXRv?=
 =?utf-8?B?bi9od2lJZ3NPVkVqOU44aEV0R1NpSU5GTHZhWGozd3BKVU5iMjlqMlBoUXB4?=
 =?utf-8?B?OW9aRUtvMlR0aDdiU3dOQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnBNWnFJc3pNQkoyK0xueGF0SktMbDhEaERLemx4ZUZsV0tOS2p2SWt1R1Bq?=
 =?utf-8?B?QU9uK3Y3OXRibmxHdk5ySGxqSkNXVjhCMUxjemZ4TEljazBxOVNDbHQ3YTM2?=
 =?utf-8?B?Q01QcVFqZzhER2wvMDJBSG1UdDJmaHE5WGMwaUZmbUdwUFpKZTN5bDhnNVRw?=
 =?utf-8?B?K0FSOEpaTnIrbS9Jb09qVkVzQ3lqQ3dFZ3poWVRwb1hTNmg2N214TXMxRXZQ?=
 =?utf-8?B?ck1SdnJ6ZDVhbkd6aXFNT1pROEZTOUE4MEUzdkJyQ1l5UUczOGVocnhHakU0?=
 =?utf-8?B?RjZHTlNkTmh3QlN2Y0JZeHIweHVIdFROVW9YZ0Y0dTNGcTZNeWRIVHAxSHFH?=
 =?utf-8?B?dUhaUmhucGJnbm9nUXV4ZTdxc0V6bCtyUkpWOTY1UU5vc0EwcjdSbUk1aDJ3?=
 =?utf-8?B?eUpKdXVZSVZPbnJ4eHhTSENYdFNod3VWakc4T08rQ1Y4Z3NhWU1IcjFuWm80?=
 =?utf-8?B?Mk9ORXB6ZGU5SWFVNngydHJBY3lPUXliYUZSNTV1bzVOMllLbU1HS0FLRTho?=
 =?utf-8?B?WUpPUnIzVXBHbS9nSDl5WERlRHZiRFIzV0s2citCbVIxUzQ3T1o2S2NZdXBn?=
 =?utf-8?B?aU5udmx5NkExaVJ6cUFYYSsyV08raEE3allWMmpXcU5nNHh3OTRSRzFqN25r?=
 =?utf-8?B?S3dLRjZTcThFNlFGSlZTWFdTYkw2MEFNM2s4SzB1TElpZlpwSUI0SVBUTTkw?=
 =?utf-8?B?a29VdGVjZmpvQkttaE5rWDgzZlRIazhVWDlSRXpwVHNJL2Fqc1QzU3lzY21N?=
 =?utf-8?B?Q0tvNXlvd0h4QTFqejNIdlJWejJ0dExpZG5ZdGdDQzZRNUQ2c2NOUTZPM2xS?=
 =?utf-8?B?bjFkSFlyMDl6WVlDa21vMU5yZlhJKzdFYjZSYzBHU3BqZWR6a1Ryek9oZDdH?=
 =?utf-8?B?bHVDQWFqaGZld2JDSytFR21VS05OVjFKa0Y3K21ROW9FNUVNN001UUsweUJq?=
 =?utf-8?B?d3hkRzdteTVZWTRaWUEwaTIxT3FnQW51SmdXQ1M4eXB1RUI5aW1VbTN2RUxF?=
 =?utf-8?B?UjRRMkxpQXFLQVBSVEFVeGNudHhQRXRvNXdlcmhWT2FHWloxVFpQenRuYmhp?=
 =?utf-8?B?bThxM0Z5ZTBNa3g1eG1TOWNCMFpUQkx5ODMxczJaMnVJekhMWll1T2FlOHFt?=
 =?utf-8?B?a1BLOVM3bUl4ek03Yk5HendwRWFhRnl6enVPTkNVNzZCUlhBSmcvdkN4S01T?=
 =?utf-8?B?WGd4Uk01YXVyVUpCVFZJY1ljV3VTekpSaEErWDVETGRWRlUreDdpT3REa1VN?=
 =?utf-8?B?THhzckpjd3lReGNkRnB1TUs3RXNzYTJvbTRNcEdES1F4MHpwSFFZc0x2NEhu?=
 =?utf-8?B?Mm9RSS9EME9XajVBM1VBVUpUVGlkWmJLK29iSU5QMzRiMUxmekRwUEtKSGZC?=
 =?utf-8?B?S3FXQjFpVXMrTHFhY3pwajNMa29YVkE4OGxrMFRuOGs1bTRFQjFGbC9kNXhq?=
 =?utf-8?B?NXJ5NVFpMWtZRVFZajQzdms3SHo5b0UvNUhlM0w3NHNiTVpJQlJiL1N5NVJJ?=
 =?utf-8?B?RTFjZVc3ZE9zNmlIeGE3aEdlTDhvRjd3ZjhVc3YwWG5IemNLL2FVandvTUN2?=
 =?utf-8?B?RHlGSFZkVjBISVBkaG4wZ0lTajdISDNEQVJHd0FVa0d6UTJqZDd5aEVJK1Zv?=
 =?utf-8?B?SlFWa3VlSFJHbmQycUQzSTJ5dnFiclRYMVVCaGU4Wm1GQkxNN1JyVGFxY3dB?=
 =?utf-8?B?RGEzb2E2bk01TXRjYmV5TE1HdmhnMFdqZzZPSUZMWTFRMlpKVUJEQUUxSTJO?=
 =?utf-8?B?NlA0WURqUitXUUlSWi9YMmU3Q2FLb3kwUlVKR3pscjY0dEIrc083Um40bVdm?=
 =?utf-8?B?ZTNWeURnNDNUeERNTkhwRFFsT1pzT0pZOHl5Ukg3ZU5DUGo5Mm9KTkxCMEsy?=
 =?utf-8?B?eE16MTdwRWozTFJ1M0tPSkhrTWJWN25qODRxK2EweE5Zc1E5dFhvN05XbXJr?=
 =?utf-8?B?Q0czNTMveGowUlNpR0VZRm01VEJzNkR5QnBDZDZZdklhTk4ySW1tWUZPVWts?=
 =?utf-8?B?Y3FwbUJhZHVWWWFaMzh4MmtkSFpXUVU4M1FPZUorRDhpTHNidzF5RHY2VXJ4?=
 =?utf-8?B?bXVXdTNsTFlOQTBHVkk2aUFBVStvWlFiQ0lOOC80T3AwaktCZ3dNV1BROUpv?=
 =?utf-8?Q?2USXm11i2skpCd7ayJaldd7vq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ULltYF93OfXwA/EKFq8vJC5nMPEyQUki91w9bCh2J1oaRPISM4o+1QBrvZgSerZ++0zcYc2fqD0ZyFZJ6FNXEbEEiMj8XvvHxng4XgkcEmDgKCrj9xbQeTCTZCv9Ng86YLXp+V5847bzksNFLZlSe7u/0JJIN+hKKhLBiDSVdnA+WeTMEM3xVkc0j2mh6eon8lzoLrKeX1uF6l6CGMWKiRH20oR+jcrvLl/wsZIFVXvnrkIWpVg4bu9O4or0vpWrZ+SCjHrBlQEPlcU3IPqbidAQyItZlbyNtI7osLGVrGl4PKPKT2+dpqdcWbssczeQGnttA6YJSWBN7HeoSW5GcvhxhnyTjnfepbJ3BaRWpp3w7tSi6SzGXZPSv41vAI8yR9QrZaYDErUNN8iZ1wCoRjNXw8ECcEGAosmmPQHvwaKJWp2OGIgZY1L1NpeZTH4SHT2fThV0hyqblos0Hl5DkkDtxKfLjOixAoBXGNn//XthJfnA7sLt7zz/6BWNUv/QdzpWbgntYliv8dKFyN5bEMU1Mku5EPtK4TXmIlsS6TRLWWKD+UfLdkOMZwo66GvZW5DUL5sEKT4kBXfm/EoIL6xFNUQp9tEsT8ElyWI0ACM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cc3821-6d6c-4bec-33d3-08dcd9a94854
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 19:20:26.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZ/cFiINRDlzw0iJWhKUtdS2VsFq2dIwefOmH++WtDEOFtZAvrkLEn87QM8EhxTt/5FRGK/WPaIr9MktJwNkzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-20_08,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409200140
X-Proofpoint-GUID: IsozHdzDpE-Xcu_j6qQnfzP8H6N0Lkf5
X-Proofpoint-ORIG-GUID: IsozHdzDpE-Xcu_j6qQnfzP8H6N0Lkf5

R-b ("under protest" but in order to move forward).  But I still think 
updating the err*too-low tests makes sense.  These tests work in tandem, 
so if one test is going to be updated I think its partner should be as 
well, regardless of whether the partner was passing anyhow.  We 
routinely clean stuff up even when it was passing anyhow.

On 9/19/2024 1:57 PM, Kris Van Hees wrote:
> On Thu, Sep 19, 2024 at 04:39:26PM -0400, Eugene Loh wrote:
>> As we have discussed, I do not see the point of such a check.  We change the
>> user-supplied value anyhow;  so why should we check it?  How about we come
>> to a decision about what to do about this auto resizing stuff (which we've
>> changed since legacy DTrace) before fine-tuning what we're checking.  (FWIW,
>> I vote for no resizing.  The user typically has no need to specify a size.
>> If they do, we cannot guess if they want their size to be a min, max, or
>> what.)
> We have discussed this at great length, yes, and since there is no resolution
> yet (because it is a more involved problem that needs discussion) and yet we
> have failing tests, I think it is best to make sure the tests pass.
>
> We can work on a redesign , but in the meantime, the tests should really pass,
> and the current status quo maintained.
>
>> Also...
>>
>> On 9/19/24 08:54, Kris Van Hees wrote:
>>> Reported-by: Eugene Loh <eugene.loh@oracle.com>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_work.c                 |  9 +++------
>>>    test/unittest/options/tst.b.d       | 19 ++++++++++---------
>>>    test/unittest/options/tst.bufsize.d | 19 ++++++++++---------
>>>    3 files changed, 23 insertions(+), 24 deletions(-)
>> What about the "too low" tests?
> Those pass as expected so no change was needed.
>
>>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>>> @@ -268,15 +268,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>>>    	dtrace_getopt(dtp, "bufsize", &size);
>>>    	if (size == 0 ||
>>> -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
>>> -		   dtp->dt_maxreclen)
>>> +	    size < sizeof(struct perf_event_header) + dtp->dt_maxreclen)
>>>    		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>>>    	if (dt_pebs_init(dtp, size) == -1)
>>>    		return dt_set_errno(dtp, EDT_NOMEM);
>> Why does the code special-case "size == 0"?
> I honestly cannot remember why that was there.  I bet it was a mistake I made
> when I originally wrote that code.  I'll remove it since that is (of course)
> meaningless if t is followed by || size < ...
