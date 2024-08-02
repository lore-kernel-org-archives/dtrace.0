Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3FE13CA81
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 21:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635178; cv=fail; b=bId+gjRoXYdA0Dpzb3j0h7YwB498qznqvOtKNepFdZVtQ68IB6x70DpTdfQh1TSd3PV9Ms4GOO0LPGN3ZI2YBk5/01ZcxZyaxo+yj86FneAlYxaAXWDUANvU+mezUiyr/p7CZG8S1D7hcCwo6vV9RCPfITX7tlLx0O2id1LYBws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635178; c=relaxed/simple;
	bh=sKXk0zbKGwIaaSdVJpdJq2qwaEjyyGgrXMILge6/bns=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GxUKAIPh2UvAHM3RyuZqxX/TdKQ8hdJ4TOZFbQR9Ro42cAiGNDM5NlQp3aRGjUv161Aw6oivXNeEbcdonjpLb6X6uc5C+g3rHe6hFg8wpLsMij7z3E6lwM1yeUxGUPVgC3fvnoSdpku7AbHoSB0O7zNhWMXVdPkRRywBbD3yxDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dly0yQJu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kVW2GP+r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dly0yQJu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kVW2GP+r"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtYqJ022346
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=cJ2OiXYSTikeerA0pnz7LKb525tAgjdIaYosva5dUmc=; b=
	dly0yQJuViVJmV2my+eFLOWZBQX+RGf6+7NR/vB1B5Q1tR8CDQP4xbwl3nYBjvHf
	gSZVCnRVGtFq+ZVjSdYD/r/sISd2OckgQ2hjGCxq5A+1GgQcDE9TnPXiK+Gw7OwE
	mdnOUuNJ0WcwqmgTmminXF8FIoWDOisQleHzEWM+LAvQurqgHKMftDqxyfBeRrol
	wvV2rieMaDObt5dRVt7x97nxGq+zPdMiPmW05wcgGJ0gZR8PpOpwf6dUsP+e6hZk
	c9EXm4ET1u/rAnfYqx/MgkhhCC9678hJ23Isael0QVf+wRPiEnRjkS3xbA0HfGfy
	2EQw+He4fhxpZXPHdvwOfA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwj8tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:46:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472LBwgc037794
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:46:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpux3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeOAVH2M+qNqD3CEr2uSY2pWzX2//i5FA0qhDG4bemwwLdh1Xsp5idZKs5Xea4AnVMhxjlushrwGUcHrxv+HlBMe0i+VsDBDyRYU+RauFRLKgZKhI4Ln4NIBYM0dNgon3pw4ILLlJo8FxYb2YiDpRpDswsohKJmojqkwCQhlqycwOcacCrcPXhP+BOWSC7vdRjzh86dIKDcuork3qcGfhTycz+mSQ5LddJ3okqDFhR4aDMmcVUeoWs153KULWAAageAjkuQ0TBBBY0ePzIR3uF8IbORl3R4wD/2wsADsE5ooKcxh9pECJV7svVPCTf4hWCralzqTs7t+wJ9fK6EZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ2OiXYSTikeerA0pnz7LKb525tAgjdIaYosva5dUmc=;
 b=WpWHhJodFxieDXR7zVSnaVdTOk4p3ZtJbhHosxZpDK9npCo02H5Hrg/4mfVDjwC7I/jkfGJgibDGw57R/qmdf4WM/PylJ0I+wszQbUNLo38YPp8ivAfznLELO1vlXmH+94iY86ciYSxdFNu5tgIfxEGDlgU5EaJAkjCzNzmI+QVJVz4Uy51qRCvAaJsO5vre0uSMijoVQTxSBioPoqqrHZ/dXcWH7difmfG9JWCY48eigaFvFM3HHlGO9wkRis0NArIb5oG1iU+DqFfnlpPR25GvTpDfOvHhLsBl/AxqqqLnY7DlIwVFcrwE88SoDtjGY7MKb7tKjTMYofnL5ekNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ2OiXYSTikeerA0pnz7LKb525tAgjdIaYosva5dUmc=;
 b=kVW2GP+rMMxQ2h2gQUdOS/sWWzfOEZlSPutGqWMV09xBPWDUGbB3Id9S8GSJc450MR/cuQIF48O5EbHllpPXqLCj4E62QHV9FmXS8cssvhJpNZUfzJPdXKN5X5orAt6raWCZmAiJwvFX2bUtdIYoqifd7hoJtEFV3Vy8Q/uSNx8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6109.namprd10.prod.outlook.com (2603:10b6:8:b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34; Fri, 2 Aug
 2024 21:46:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 21:46:10 +0000
Message-ID: <e6e325dd-d515-715f-13c2-a6d698174ba3@oracle.com>
Date: Fri, 2 Aug 2024 17:46:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] test: fix another use of a kernel variable
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB6292435D6EEF211506E49899C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB6292435D6EEF211506E49899C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: b7db1f66-c484-4746-1b80-08dcb33c85c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnpTeVZkL0F3Wk9SYnVENE12NGZmeHdscDU5NzVyb3BxVG15Y2E5VHlkaFF5?=
 =?utf-8?B?ODhZZzNzc0hjcVhuZ0ovU2R0QXFKcEFTMWNCL3VFbUxPU1N3R0M4dFgrZS9W?=
 =?utf-8?B?WnRxUnhlZXBONmlmYURUcGJra3lzaitNN1ZCemgwTzB0RE1oci93NmRVWXBI?=
 =?utf-8?B?L1h3b2ZIMUNhYkk5WmM4TVE1VjhKektHUkd5aDZZL1V4UlVlUjBwVlB1UlF1?=
 =?utf-8?B?cU92cW9lOTJWcEgwRmV0WkNvSTdXZEVGa01ucjNTdkpJeWFsSlF0aFFEZzNE?=
 =?utf-8?B?T29HMzNzc1J6ZStVcEo3a0lMWjRrNjhXWG9Qa25UNnI5cnFkbTRMZXArTVdN?=
 =?utf-8?B?cmxnWTRSTG9VUUt4bzVNdFVESmcyblRrZThQcFlEQWhyVFZVNzZ0RHRFSmND?=
 =?utf-8?B?THJiUVdpVnIyMlJXcFphOXBYUlQzRUg1MXk0SjdpNFd0RlZHbHJmUk9OK1Rw?=
 =?utf-8?B?aTZzRWdhZEgxeVE3eHZJVXZ0RzJxSlZVblFLMEkyc3BjVGNwc2RuSnhuV2dP?=
 =?utf-8?B?NGJDMG5Ybm9GWDJPdk9HNXgwTjVxQlpRalVFalc2QzJSWlhBMWpuTkYzRm9t?=
 =?utf-8?B?OEZFd1ZyWjJCS0lKbnBoRlNzT1VaeU5vanNCVWVuSzA2MnVWTUR1dzVmVmxq?=
 =?utf-8?B?c1NjSiszMDBua01oMTRTdDZITXBrSG5aUXkyU3RCWHZOdEpPZFR5MnJYaU8r?=
 =?utf-8?B?cG8vT3hrbi93cFBaZ2dRRkJNWllTVWJQMmovKzNPc2U1clJWZStxNnJnYW1R?=
 =?utf-8?B?eiszM1d2UnUzeE9GbkRsMlRJVjlZT3VzeTJjd0NFejVaZUh5dnUvYzVtUEZn?=
 =?utf-8?B?ay8zOWM4by8rTGZCaGdFVU9VS3A1dm1FT0pUTmlJMkVVMnRQM3YwV25YSHJk?=
 =?utf-8?B?ckJMQ1UreWNORTNJVDBlazdpTkpBNmpPOSsxV3VxTitPeDZ2cWNpTGVlZkRr?=
 =?utf-8?B?U053T0kwV2hLemdCV0w5ZVhlZmtDY1RqRXlEM1JONTRkSlpyK1JabXFGYVAw?=
 =?utf-8?B?TGphU1J4aWE3T0VsRFVtbUtnL2dORnV5b21pd1l4T3BzU2k5SExQb1hGU1Vv?=
 =?utf-8?B?dzlNcThqR3VZaEU0ald3S1VleTZGcXFwYWF6bjA5ZEFkTnI4RnZmdFVzWUNp?=
 =?utf-8?B?a0h1MXdNN1ZZM2hpeHZWb1oxUGtjYUM0eUNFNjM3SDNNSzRCOTRsQ3hsUmFX?=
 =?utf-8?B?UUZEMFZOWCtYd0s5dTlKZjFFb05VdWJPR2JoNjUrOTFDUVF5ZHJEZEd2RFp3?=
 =?utf-8?B?SDI5RHdYS3l4dGRVcjdkeGV6TnV5bWc0SytxZFhBVDljbUt2Q2gwVDltUlNr?=
 =?utf-8?B?K3pmMWxsamh6UG1GZ0dnYUVBZ2tMUGZ4U284Z0lPWnhtSzZFTk41M2tEMHkw?=
 =?utf-8?B?RWUwNzdNY2xlMHVJWFBYV2RTVWx2NmNDUWxuWmszbVI3eVV6UkNiOVVOZ0kx?=
 =?utf-8?B?a1pSMzVsUTBKRWU5em5TYm5qQnd5MzRkWUhrVG5iaE9ZeVRsWGJHVWFqWVIr?=
 =?utf-8?B?M2FhQm9ITFBwaklQeE9aT1JONEpDTWtVV24rUFdNTjhVSDVrQ2tIb0Q0djFC?=
 =?utf-8?B?eGRnLzRQbWllTVRUSkNxbVU1Q0RCb3kxVTdQZ2o0bW1KQ2UrNS9VZHcwNUNE?=
 =?utf-8?B?QXdlSUpTa0NVY0NMdk4yTk9POEhoVitSL1lBQStBbGR1L2tGS1ZENTdKbmdt?=
 =?utf-8?B?V3FDNnMreTA4YjNBY1J6cnEvOFY4NkE3RUNIU3dWN2VHNkFlc2cwYmpMVG5i?=
 =?utf-8?B?OURHRDNLUjBhZHFUdjhpQVpZaTgwYXhKeXBSL0MwUWUzZTlMTUg5cjUvSUJB?=
 =?utf-8?Q?2LQKmxY/hxPK6EIaX1yE8qzeGNeAVTiTgBGxs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QndicnRHZXhFbkM2VnVnd2xoeG13Q0lzdlh5d0xwdHZIOUZtQ0FzdUw0Zyta?=
 =?utf-8?B?OEFWYnpZczNMcFkyOGNpczJsYkpUR0VrNWhYZ3V0TWdDOVNQdVFiekw0MTZG?=
 =?utf-8?B?VzVRWW9GemhXZk1jb3MxR1VPOFpMUGd1WmNPd21CSWtJd05DUEhwcW5KakJF?=
 =?utf-8?B?ZUZkY0RpNW1Ibkh0cGxjcVRtVEZhOEMySHNKTUN2WFBlNUMxbnZNUVprVFFT?=
 =?utf-8?B?L0FaejQraVdVTFN3Q2VZaUk2ZmRSYVNqaFljeWFnY2ZsMnhzdm1OaTlJY1ly?=
 =?utf-8?B?Wm85eEpBSCtWNlJHMEoydnZLY0tvSWFjRlZyOERINGtQMEI4aHNVSHQvMjNR?=
 =?utf-8?B?aW4ya3pvQ2NQNm5nMnZIOVhMTk5YK28rRE1MK1prYUJ4U2h3ak5nQWN6a0Ft?=
 =?utf-8?B?VnV4L0ZEMlJlWFd2TkFUc2xXUHN2U1EyTUtIMDZaOUF5dTFGRWJFc1BUWllS?=
 =?utf-8?B?clR2ZUR5RzB0WmFpT1I3OWJKS2l0dmdsK0s5OFkyM0ovajh3SWMySGlZUVNV?=
 =?utf-8?B?THo4SFlxcW5YMHNQMFdDLzNqTlV0THoxbFhkTExPa2wvOVBDOWY2SUNrOHJ5?=
 =?utf-8?B?WlhadzlGL3lveGdKTnY4aWMzVEh3MXRrVDF3WnR0RVozSzdiYmZOUUg4bEhl?=
 =?utf-8?B?VTlSVTJBSW9UcDFBYkdDZFkyMmhuc0Y2VUhtcXBkenJIR0lDQVg1M0Z1QWhu?=
 =?utf-8?B?Nm5SeUw4QUdEcGJucEhVWmk1QnNZVHIraGw0eWFxQmRibjhTcDlkaU85VTVS?=
 =?utf-8?B?cU1KblFCVmhnMGZVR2VDUmJOSjlmQXlmdUhzNTd1WWt4ZjdESE5OTkp5MG0z?=
 =?utf-8?B?UmNSRTNiU2lxQ21tQzRQcFpTZ01MbGRnRTVsRGgyWVFSVFVJSnNldk11VWw1?=
 =?utf-8?B?MFlTbEF2TWswd1dSMVN4TFZnQjV1WW9FSlZTVFVkUHFZdkRJR3psalEzdDVv?=
 =?utf-8?B?QlFRamVlWk5ZWDhXWmhmVzVNRlY2MjlaRHNWUWVxTS8xc2dTOTI1OE04Zzh3?=
 =?utf-8?B?MnpVMVJJSXg2cUVNNWNoU2VVR2U4VFkwUy85TEpJamp4aHFXek13cktRMUF0?=
 =?utf-8?B?K0xvVGFOZ3pFWlhiY0tFcVlaUjErYXM2Wk1ZTXpIMGY4WEZKVThjalA3SFpx?=
 =?utf-8?B?YUZlS3BTOGZKTHpvSVptMzZtRVlqR1EyTytoME1EUDFsRE1JVFdZNG0yS2RP?=
 =?utf-8?B?V0ZzVjVOY29MK0szY1FPZHA5Uy9ndlZDbEVoZzZkdkJqNzdHMXE4ZEYvR05q?=
 =?utf-8?B?YnYxY3pwdnEyQXNmMFdMNVZUNWc1endtbHl4VkwvMm9RanMrQS84ZWRCQ3FU?=
 =?utf-8?B?NVRkQnZDTlRvRzF6YlRNenRlWTJLNmNJUmoxZGszRWo1YXBmai9qeGV2VVV5?=
 =?utf-8?B?YVEwM2RmV3RwSm5XNmo5eXQ5TmNvVExPRTVIdjZaOTFyT0FwemFoWWlBalZl?=
 =?utf-8?B?Q1MvTEZzSWNrWWRQcERQcnZWYWRwbkZCdXhTUjE2OVVZUHpYNDBCdjZmdzlz?=
 =?utf-8?B?SW9pTnlzb2pJbGlTZ0JBWkhmSzNYd0ZkWFI2WEs1RHp4azJoNkJQUlF1MCtI?=
 =?utf-8?B?RTJJSGlZUDdUU2ZRRzJNNjE3T2k4U1o1Tjd3R0FOa0VIekQrWFhjUldqMmxL?=
 =?utf-8?B?dFRmcUZXbGdTVmV2M3A3TVBxREJVaXFZdmd3NnlOR1BOc3hQQkdsY3lkUTIx?=
 =?utf-8?B?dm9EQnZ1a2FhRUVFQ29xb3IyVUhrSDNhSUFyZThTRTVScy9KeXZ0SzNHc05z?=
 =?utf-8?B?RzBITCtBQmxta0xsVEgyN2U4Y3pjN0dQL0hNd0M1eFhsZHN0WGJ0ZTFkaEpp?=
 =?utf-8?B?LytwS0x2TGl4UTgwZVhUd2JEWmFzb24xOS9IR0pkdzZha0FsaVFJdTMxODhF?=
 =?utf-8?B?dnk3Rm1IaVZYQzd1VnV2SUZINUxjdnl2RjZwdk5vYVlyTjAzRTJUSDV5Y2lY?=
 =?utf-8?B?b1VMNUQwRkVKa2dXWGNaY2VTdG5POEE4RFJGKzRwWUJQeUFaK1E2cks1L25a?=
 =?utf-8?B?dG9IeTdhYXorUjd0SXRNMklhdXZBRk1MUmUwSWlNdGxGUmRLcVBDanF2NjND?=
 =?utf-8?B?dG1XR25MbDdnYi9YZ1VwaVlXRG1PQjBPOWZxSlNBWThZNTBleUdsWW9oWjE4?=
 =?utf-8?Q?zF+slxcg95jy7KWsej1wA5CD0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CWhE/AOJeNwrytaFKLPt2U0BowZJeyTRHYW0K04E0c3fGmmlaSIup+SzOP5M9JsuVstd8Y9EDPGxUNL8ssUrMr2og+2QdUMwflBHpw+tHkfo+01JZJjDbHFO0hZdjcMTQq6dqs12MubEqSxN2hVKej8FXXFKSW18pNpqr9kd5QiSGDR54zrbhzZamnpjSoYcDUR0kcFUzFx5NkKBYtbZD33CgyxWBX0Nai/FXyT3D3dGnK0WXzma/rBCakUk3x6Mg6dNWe9z5EeGUUV/Rrdb+CqEsiJrET3ilqo1qy8N+6ko73ju4YWh9WxEILCeTfG7XtUttgRTZ5IfGwMmsMbq3dlkz8KuDyJT1ROBkONJyf83n+NwkVRTkcTRzt40a1lXpNz/AmuO3Y1IrlU1fWsGWB9Npm+vuAob2nnpPQX37A7XnKZlB7UNDuwc0GIClBFva7/ZIcvoV9ccbTZNoa1m646InUqxWLZ/ajaucGel9wVQzYvx3tYadpwW4unXsfm+mUCS4U6NTSyp8RZknZ6a06IfmmVcZFNGTXjMyXJro4qjQVRYNzrOdCORFF/wGWjlidchFj022Yz4cguRiIJE8Pczgl96DgwXbffXs1tJ9Fs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7db1f66-c484-4746-1b80-08dcb33c85c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 21:46:10.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Zox0uS/BdVNCLfCDYirv6jsL4LHOfh5urNoCBGTeF65yqst9x93ReFq0OfaCfOCEsUd7NBxxbABFvWehjX1ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_17,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020151
X-Proofpoint-ORIG-GUID: TkBMZ0Bs18V-giZauN3ShvljcQmG9Vwv
X-Proofpoint-GUID: TkBMZ0Bs18V-giZauN3ShvljcQmG9Vwv

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Not sure if you want to change the subject line to something more 
grammatically correct or more specific.  E.g.,

         test: fix other uses of kernel variable "linux_banner"

On 8/2/24 16:38, Kris Van Hees wrote:
> Yet another case where lack datatype information for kernel variable

s/another case/other cases/
s/lack/lack of/

And though I know you don't intend to be exhaustive with this patch and 
though I don't understand the underlying issue well, what about

     test/unittest/io/check_io_probe_args.sh
         printf("BEGIN { printf(\"%%d %%s\\n\", %s, 
stringof(`major_names[%s % 255]->name)); }\n",

     test/unittest/printf/tst.str.d
         printf("command line = %s", stringof(vmlinux`saved_command_line));

> (i.e. lack of CTF, and BTF does not provide it) requires an explicit
> use of the &-operator.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/options/err.D_ASRELO.kdefs.d | 2 +-
>   test/unittest/options/tst.knodefs.sh       | 2 +-
>   test/unittest/options/tst.linkmode.r       | 2 +-
>   test/unittest/options/tst.linkmode.sh      | 4 ++--
>   test/unittest/tracemem/tst.tracemem.d      | 2 +-
>   5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/test/unittest/options/err.D_ASRELO.kdefs.d b/test/unittest/options/err.D_ASRELO.kdefs.d
> index 0a42fc6e..06bfe24e 100644
> --- a/test/unittest/options/err.D_ASRELO.kdefs.d
> +++ b/test/unittest/options/err.D_ASRELO.kdefs.d
> @@ -14,6 +14,6 @@
>   /* @@runtest-opts: -xerrtags -xlinkmode=dynamic -xknodefs -xkdefs */
>   
>   BEGIN {
> -	trace((string)`linux_banner);
> +	trace((string)&`linux_banner);
>   	exit(0);
>   }
> diff --git a/test/unittest/options/tst.knodefs.sh b/test/unittest/options/tst.knodefs.sh
> index 532d7eca..da65c49f 100755
> --- a/test/unittest/options/tst.knodefs.sh
> +++ b/test/unittest/options/tst.knodefs.sh
> @@ -9,7 +9,7 @@
>   dtrace=$1
>   
>   $dtrace $dt_flags -xlinkmode=dynamic -xknodefs \
> -	-Sn 'BEGIN { trace((string)`linux_banner); exit(0); }' 2>&1 | \
> +	-Sn 'BEGIN { trace((string)&`linux_banner); exit(0); }' 2>&1 | \
>   	awk '/^KREL/ {
>   		print;
>   		while (getline == 1) {
> diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
> index 4b453f56..acbf8025 100644
> --- a/test/unittest/options/tst.linkmode.r
> +++ b/test/unittest/options/tst.linkmode.r
> @@ -14,4 +14,4 @@ Linux version
>   
>   -- @@stderr --
>   dtrace: failed to set -x linkmode: Invalid value for specified option
> -dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> +dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
> index 4e28f8bd..07045fd5 100755
> --- a/test/unittest/options/tst.linkmode.sh
> +++ b/test/unittest/options/tst.linkmode.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> @@ -12,7 +12,7 @@ dtrace=$1
>   
>   function mytest() {
>   	echo try $1
> -	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
> +	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
>   }
>   
>   # Test different link modes.
> diff --git a/test/unittest/tracemem/tst.tracemem.d b/test/unittest/tracemem/tst.tracemem.d
> index 716b119f..fa838454 100644
> --- a/test/unittest/tracemem/tst.tracemem.d
> +++ b/test/unittest/tracemem/tst.tracemem.d
> @@ -14,7 +14,7 @@
>   #pragma D option quiet
>   
>   BEGIN {
> -	p = (char *)`linux_banner;	/* first 14 chars are "Linux version " */
> +	p = (char *)&`linux_banner;	/* first 14 chars are "Linux version " */
>   
>   	/* try tracemem() with various sizes */
>   
