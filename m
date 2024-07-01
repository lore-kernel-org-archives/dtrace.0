Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88561674
	for <dtrace@lists.linux.dev>; Mon,  1 Jul 2024 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821208; cv=fail; b=OpZbIZmeGi3SScSPJV6lcYXicqLn8/geZqISFLjenMax/pi5riDQ5RKqohhtJNmrfP/IfjDaLM8ARoooXjc4m+31+hp1b6om2bkZ9qb4kyBJ3P7LMrFRhUdD9NhGiA9JfjJ2s0hYiZD5oUXEQJWcHwLhtwvuU9kNgPacFEPh/yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821208; c=relaxed/simple;
	bh=qyVGpZYt9vYv0twpLJlbRJGby+vIzxvbqVBC5DbgT3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XvKg7kkHIsYCkCsgiQ+CA+GZCppOxKmWdjG0k9wKY5YFHI/cHFIngeWkQ7Agd7XHm0fH365GUCF4c8wcVnkzVi0cOqOUPRGPuZt4IApgOo91zfCRDaPPn0mraBWy5HwgdTUZj6o1j3PtW36u1EAlyhYQwS+/CbBXsnJIR7fngZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZJYmg06P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lNZh82dE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZJYmg06P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lNZh82dE"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4617tU2s028891
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 08:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=R0gMrClRdDSqAzNO1n7D7fSHTW/9NRFBVPzj9dQIh2Q=; b=
	ZJYmg06PxpozFqca6ZTI6p0vT7I/R6aEbJIUC6cTbbLGczMWDTor4bV2pNSiNfTH
	m2fJZxT/FR9mqjxBjuHtZklzuakqciblKC92Whp27TcO3Ndz5iYqIdY1z4in7iuK
	DXj31aEZ7jiGsIT7JkDeLO3l4fw98piMwX0MtHdFzMi+vQ19uxGLsvmdD7KhuIR2
	gRA5AvEuFwHBNnq+7vGfqeAvBFzLA4fMg2hTqdtUIqRQjf7x3Jgc0QTa4qqzD1Dz
	LuhzduzIl2mTH0gIsgOfQ7YL9y/zqLA+JGV5+8qlcmQX4avUw3KS1OtqJCL9dt1T
	nC02DM+NAOUMriwiSYWkrg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4029vsj2qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 08:06:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4617Voas026370
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 08:06:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qc5qu2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 08:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaXFGYaL9UDqA4N16v3IlHCHDXqErxNBWj69ypcKzJGFU06Oe68hGoGonnDt31uVgxDTNK9lmHI2QkYP4mhtOgLrAdoia+W8ye8B7q9vvVWXfvIzHdMEjm6Gyfk7KnkqZMzYx6W3MR+i28yzpA2dqvbYoVC44fd7YpvtWNxAc3y09JkBmh4+IC6nxd/rePMtyDu9KE6DLAGz2FQm6fDlWqKEFRqse3ZK1kbUX6YcuUU8de9CxRRY7p7o+cj6CWnzY7wrfHkLS9kTSJa2ozDO1JBuEelbEJDq1SZmLF9m6n8aTHkBtV2oH9qDHCITHJwzWLt9ei3hW39bi6DdjcHlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0gMrClRdDSqAzNO1n7D7fSHTW/9NRFBVPzj9dQIh2Q=;
 b=bnKMPkdcHxom5kiYjj9myJc/HmG9WDEAzEjpe1TGhKe13tvgBcQQPZJA7rvFlSkBh659uZAdBn+7UcXt1csZ2TBmVgi3i5LOuKlQCBxHacOHNr/mdB1MQyKQxWxmdiSyJu5hMWbu+A3zMg6UDUf6twGutLH1ehozsiRVBJ/7UDvJhw9fpg0pcF2aIqi9WlQRbFy1NtMz2d6U6bkM+QB+GY1QbdTQ9pjiPNyuhnsXSx+LtVgQLO23R5AYhtKAAvD4ClLmH5Sq/3LMVJX8Y6Zm+l7URM0utmDrbyoqDrLZmfXU6hwL9SyGTw8AvviCefu9zxreJGGsn3io8EPwwkuhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0gMrClRdDSqAzNO1n7D7fSHTW/9NRFBVPzj9dQIh2Q=;
 b=lNZh82dE1zkEJHrMmdZqtE+oGH5251NNLeFhoOSl1UMjyAkHF3ncugV793O0Pu/6nmlHAvQIdDPookxSxnAOuGrmijDb+2fuxj5zwKkqb9zcWz3paX36eLuSivjl1svPfCyAYuef1e78MgrTVu2rY99rt4WLmGat4mM6CunTXGE=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 08:06:38 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 08:06:38 +0000
Message-ID: <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
Date: Mon, 1 Jul 2024 09:06:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zn8xVd+r8SzmLGH9@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0439.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::12) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|DS7PR10MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: db364301-00da-4b4e-6f1f-08dc99a4bb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clpOMVBndFgwVENzSm5vd09MS25sREZHZng1RmZoN2NKVFJNMy96OU9PbDc3?=
 =?utf-8?B?NDNsczBnako3Vkx1aHduNzNyeDVjL2Y5Q0FZUFE1VWhkMTJtbzFscWRjeTBH?=
 =?utf-8?B?YUM1dVRZNy9YN1RYVWlxazZwVWtwekZ3RXBiZklKUnBTSEUxUHg3UVJ1ODNs?=
 =?utf-8?B?MGM0RWQ3aHN0cWhvVDRSMzJSRG9rbGpCdHduOThYRlYyUW9MbGFnR3IzUEJr?=
 =?utf-8?B?ZTJNUFB0TG1YZGN4K0E2MytucG0xVjlMcTAwNHZ3WDNMWkVhQ2lqK2NubkZ4?=
 =?utf-8?B?bVcwSXk2TGx3UnBIeGFkcG5UWjM1YnM5R3F5YS9EbXI2WlRNaDV3eGt3N1JI?=
 =?utf-8?B?N3I5K000MWNjWnhqZHMwS1FCenMrb0J2bHlhbG0zMFVvVzRBRjQ5eHZUblZ5?=
 =?utf-8?B?R3A2K2ZDaW50ZksxdmRZeTBtODZtYUVKY0RmM2pObVU2NHhXT1dCUnJjVEFN?=
 =?utf-8?B?cDdwQmcxckpDVkNpWFhyTkp4WkpyWGhseE1SdkxFNlF3aTIxVnNEWXFrVWdY?=
 =?utf-8?B?NWNPWGV2bFRqa1lMYkMxcW9EYStlSGNXRnNBcnQrTlBVL3FmcXBNNUY5dGZI?=
 =?utf-8?B?MUlYTTBzRGpoOXZvMkliUzlDeG5UWVl0M29RNDQ4R2dhckdpVFU2YVRWaWtW?=
 =?utf-8?B?b0thbTNObGs1MExSVUNRUWtwcGcrM2ZoM0tEOWM4bDRFSTVWVXJJdXdGdzM0?=
 =?utf-8?B?cjNtZTlVMFdZdnVKc1BJK29PbDV5NWpuZDlEY1BJUTM0WG8xZk45RlloYWl4?=
 =?utf-8?B?VU4vT0hTUkdabk5Xc0t0U3hxS1ZnTmc3LzBMaWhDODdlM2ZpYTZzbjFhdXdU?=
 =?utf-8?B?aG53TEMrZDZ5c04yZG9VL1E3ejlXaHlZc3RkK0x6QTdEZUFqb21RZlZRMlV0?=
 =?utf-8?B?M21iRG51ak9Ra0o4K3I5Wi9FeW00TVlPaVBsM3hmRWZkTUU2cERYMXd4c1dV?=
 =?utf-8?B?MkM3bHNKUUVWR0hlS2VualNWSkxTMnNXdFNmbGErTkwxbUs4eEpIMFhpQTZE?=
 =?utf-8?B?WUdYQWJnVldUaTVSeFZQM1FQTkJzbmZ5dThZdGN2WGlEeE9Fd0tYeXU4ZHFB?=
 =?utf-8?B?ZXM4aXhGclJoM3MrbHZ4RWtEZkxHYXBxWk5mRUROelZYS0FOT0Q1d0J2MDFs?=
 =?utf-8?B?OTlQMGg4M3VpamtJUkRXcGtzbXFXR1A0Q0thbzZ6Z1cvaFVSOWVvRWM4ekVN?=
 =?utf-8?B?L21mS0lSOTY5Rllpdko3ZEUwQ2dCSzNvcENaQ3ZzUmFTcmNXWkVraUJiMXNL?=
 =?utf-8?B?WDhKc1JERTJtOFl4blN3dWNCK2VZdEpyWDhoSmV0WmMrMWtGVzNNWDlvNW14?=
 =?utf-8?B?eHY3cERQdTFxZ2tlaFdKNzdGOVhmcDRnNVFyRzc3Rk1Vc24wNHNmS2xUY1NZ?=
 =?utf-8?B?S0UrN3J3cWwzZnhwQ3dqVGhhdEd2RCs3eUdqTCtueThqdWN3NHdMZGpla095?=
 =?utf-8?B?S05jZUpTSXZPdEpPWVJlRmdRUlNUVklnVXJQSit4ZmFLRm95OFRkeFhYYkRk?=
 =?utf-8?B?Z0xBRmU4TVovQU5MRWl6Wjk2RmN5OTNJNFlIVjNRcnd2VXVEYnBhaEx4SUkv?=
 =?utf-8?B?U3l3RVhMSmVVV0tTa1kxaEhucTJZOU5ubVYrVmV2MEpaWnBscVdyNW9mSm5p?=
 =?utf-8?B?cWQrUTZzQkgzTitPUnhwdy96TFhTay9RdEZWUi9RMGduZnhEWFFHb1E3eTNR?=
 =?utf-8?B?OFhIdGFTUWVUaCtzVkpJbzVNdTVjbFlSRFVKODU3QzJkSThqOTBPTDhrVXBC?=
 =?utf-8?B?clZRL29wTXhHdkVjK3ovdEgwM21LZUJBTjNWSkhrcnExQTJ5RkNwaWdlWXJH?=
 =?utf-8?B?UWV4MWdNNmE5NWhTc0t3UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3JPZEUzcm0vUHo5RndtcVhZdmhjek1zMjlvYWhzZFFUbHFoYlJtbDMydEw3?=
 =?utf-8?B?aSs4SW9NUlVQRGVYeDR3dlIvNXJaM21HZlB3ZDlUTVZscTJOTnpTRGErTlRj?=
 =?utf-8?B?MmJObzR2dzRkMGtVcjVsWHAxNXp1VTBHSEZaV0FLdTF1aVU1MXBhbmJsOWhU?=
 =?utf-8?B?L0RHYUlOU1NWKzBvZ1lHdSszUmFjVXp2UG91S21PRkpENmswendxbEFjbjFr?=
 =?utf-8?B?Yy9vWGlSNzlvNW5hUWttMVdyalRCV1RxNk01WSszZC9HSlVqREE4cTdjRW9u?=
 =?utf-8?B?VXNtOXpZelREOUpkNWM0WUJ1bXBQTitGcUV6Wkg3dFpoaWlCcnByQzFGU1RV?=
 =?utf-8?B?a1l4Nis4VkpLdG5VV2kwM1dkM2ZGOGdYZzd6d2NGMG9WcXdhYk92dWNheFU1?=
 =?utf-8?B?SGpxTE90S0tjYjBaMElnWVJkSzh6YkhOWG1NbnltaitiN0hVcnVybGQxZ0gw?=
 =?utf-8?B?RC8zRjh5RG9kTlRGVWpTYWpQcTBXQWs2eVhvL3p1ak12ZlYrNmgwN3VnT1No?=
 =?utf-8?B?QmVmVVRXU256SFhDZ3JNR21Kck5qSlNtTVBzVkxhK0NSUFVoNVFIL1kxUzdG?=
 =?utf-8?B?ZXNmSDRjcEY2MnVKU1lwUE82MVRPRHpjdHMzVk11WHZhc25uVFdVTjBlMCto?=
 =?utf-8?B?UWw5WnZQUGt3VysxRDMyRUErd3lyRGh0eWFvaU4xdE9xWWhyQ2pUOTIyc0Y1?=
 =?utf-8?B?LytyUkxyeksrVk5uV0xZK0hGZ1BSYytaNHV6YnR5KzYxUXJwRzJHMTNLTWd2?=
 =?utf-8?B?cjlZaFF6YjJXeWNJTUpEbmV6UGpSSk1NRDlQR21TZ3BXcWlnd2N4TzRkQnRV?=
 =?utf-8?B?OXNxM1QvcWRiNzVlOGNidE1iTi9OOUJCYVlLSnNkTjJjaDBIRzBPZ29QdytJ?=
 =?utf-8?B?Z0t4bDNtYTJ0aTFEY3Q2MGNkMnVWb0FEVWpDU2ViWjM3UTRCejBSUEdiWTRr?=
 =?utf-8?B?UWp6TWZmMnJ2WlhSWis3cWFkTnd4MkpZUjVkdEY5TUszWFloTHFwNzduYTVV?=
 =?utf-8?B?b2dDa0RvNEdaSlNycHBMY0lvdElXOVZuUjhHbE9MOVBVYjF2cnNYbzJGbm1K?=
 =?utf-8?B?WTloVE1FVUNOa0FNc2xzN3ZqVGVYTkw4Y2poK1FpR1pmYzgzZ1V5L1IrV0VL?=
 =?utf-8?B?d0pVL0xvY0t1ZTZEM1RNQ2l2b0Z3WksxRk5wYjBTb1BkTVZRdnpsT1RWZW1F?=
 =?utf-8?B?dGI5UGZEWU43NmZzY3c1QWVnYjNLZjlJUVVWZitobUJaZ29lOGZoK3Q2c003?=
 =?utf-8?B?akxtR1k2akRQYXF1Y2Uxb3B4eUVjZERzb3liSzZWa3pPbXZNOUNNVU43cWV0?=
 =?utf-8?B?SWFpZUJxZUMwTGE0YllBbWZYNzBwK1dhKzFVdUUrNWV3dkZZK1dNcWxTVXJn?=
 =?utf-8?B?ZGJqUE1nRlY3OTRXQ2ZvNUJ6bGdVbEVua04vN0Q2WTBKRGpOSThETGFOS1k1?=
 =?utf-8?B?V3JmQnEzTk83WnYvR3hDNDFBTTdkT1RuZkxQL1JiVkZLTzVMS3NRQWJNZWNl?=
 =?utf-8?B?ZklGR2tuWEJDWUd4YVA3NHltelBmWFBoQWoremxvN0VIeS82bUJ1SzA1WnVv?=
 =?utf-8?B?L2NuK0NMbHo1a3lQK2R0OE1XNFI3NTlHaDZDS3NrRWxIQ05lUnFCTVRuNkR2?=
 =?utf-8?B?ZDJSTVVhSkN2Y2Naa3NEdUUwcUVFVEhrQk04eTdUN2hIbzVGOCtGckdrQkt0?=
 =?utf-8?B?eDFTY2FaaThObFFEc1dCT0J6amcyM2VmRzd5NWxFOXN4S0ltL1k1ekdzRE41?=
 =?utf-8?B?Mk01cEh5OElSN1BLR2J0aUkwWGVKRzg1Z2IyanBRSi9CU3Vxc0NLd1BIKy9E?=
 =?utf-8?B?cHJzZVNuS1RVOWpWRWhWMFp3K2ZoWWtDcGljb3pVa3doODdvSXh6N25CbUd6?=
 =?utf-8?B?NFY0aHFuUnVDeWVxMkxaMVpyQVRSUjRESTlsam52NkpqKzFEd3ZGb0dNTngr?=
 =?utf-8?B?L0dlWXIyMW03WHJJRk9wU2JRVDcwbkJHQkxVMUt5aUV6ZE1ORnlUQmVtUEdQ?=
 =?utf-8?B?UHllZUkrNERXSlI2VnVZMzNkb1RrRnJxTE9kU21TdTNKVTlTempEdHhhTm45?=
 =?utf-8?B?ckcyeUdQNTZRTnVqdWhyNmdubTNxdWxRNHk4ZFdDSFBzUW9zSEFGOVE3OGhn?=
 =?utf-8?B?eCtRYmdyR3d2Z3Q2Mkk5TWdMaW92VzhJZ3RRcGpwd1VzODN2TWpIdDloY2tY?=
 =?utf-8?Q?4uWnNM0SaSHF8pwSXIpYJa0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SkylYQu2zcL3KDq+gfqE0i2xIoumDMD7Otgv4/wyge1aeCQbpBHFdVhEV/Jx3unUbUukB8JJwDJ3rKrCPYBPAkkvdaoa1eBybzvmRWRvOutpybreeAd3PRvKMTSimJ89ay0VIDrFepx3KKCcGPuvGiTw8Km3bWS2osBb+Pcs/CujedNRUtcTo+aAdZu6/GdHDC/S1Ew2lWmG5UAXSbvMsA7bWwlFrbDAOWNKB8//yfFGH8Pat7jFAgjX3K4tQVKrlVE+ORQ6NWqIscqEUQ3dF0zLHek568m7Rqp28GcMZvREsF9CvI0QAUObxNvPg3WrwBRMw1SH//Z5hM+iJvxg0Enxk9F84oloxl8H35+lDT2iIPD3klYtL7jwxdkebNCS+0oks7WBtBUQ24mpa8nwBbgLvzhC+ZmFjW9AhYGNeGUN91dr9hBtr1OaRXoagKkA5iG6FKEA5s0osJtcyx19V+4wmL1mdVXg74g84FH3c9OWX2gG8pJzB1MyHBYKTi70ZtFG+BJuvx2Q3TPsl8Ivt1CgMBm4KJdc8QP2yUPNPfqErvmarZ4pvCMG6l5ik8ZQl92GX87fdJa7LBZX7N4cn140KevxAM0C3MwOJcn+s/s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db364301-00da-4b4e-6f1f-08dc99a4bb98
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 08:06:38.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Gve3oJ1MUOP9Kc0DE+cOfdcxUw+reoWO2XiAjSY5UAAuE/xdnjxKMh0fjaEyFc+mKtbUvaH0JLsfRm8nTCBhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010061
X-Proofpoint-GUID: 8A_uTjh6s7WG2kqlyGEUgnHW1dsSXqRR
X-Proofpoint-ORIG-GUID: 8A_uTjh6s7WG2kqlyGEUgnHW1dsSXqRR

On 28/06/2024 22:55, Kris Van Hees wrote:
> Looking at this again, I am wondering why we don't just add type info to the
> data record?  Since we know the type of the data items being added to trace
> records (and type is expressed as ctfp and type id), we might as well store
> that in the record.  And that would make this entire situation pretty much a
> non-issue because the record would already comtain all that we need to know
> to consume it and print it.  No need to pass a module id.
>  in 
> If the issue is that modules could get unloaded and thereby some pointers
> might become invalid, then perhaps the solution would be to always copy the

Yeah, I think (as well as modules going away) the other worry is record
corruption, so dealing in direct pointers is too risky I think.

> type to the D dict (I think that is the right one - I always mix C and D).
> And since that one is always around, there would be no need to associate an
> id with the module and pass that.
> 
> Perhaps doing such a copy is the best action here?  And we may need to look
> at other cases where typed data from modules might be stored, and if there are
> any others, they may also be subject to possible issues when modules are
> unloaded and in that case would require a similar type copying action?
> 

I looked to see if there any CTF APIs to simplify recursive type
copying, and  I couldn't find any and that's my worry - this sort of
copying could get complicated fast. The other issue is size - a lot of
the kernel types will pull in a massive number of dependenent types
(print()ing a skb will pull in sockets, task_structs etc). Duplicating
all of that in the D dict would be expensive I suspect. The other danger
is introducing multiple types of the same name into the D dict might
complicate things for other consumers of it.

The worst case scenario in the current patch series - that the module
goes away - means we can't print the type info, but that's not the end
of the world really. Certainly in the kernel case most modules tend to
stay loaded.

> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
>> when generating code for print() action we need to identify source
>> of CTF; is it shared CTF, cdefs or ddefs or another module?
>> Introduce a module id scheme where the module id can be stored
>> at cg time for later retrieval at print time; this allows us
>> to later look up the module and its associated CTF without relying
>> on possibly freed pointers.
>>
>> Under the hood, the id scheme uses a monotonic counter coupled
>> with the hash of the modules name; the latter allows us to quickly
>> look up the right bucket via dt_htab_find_hval().
>>
>> This fixes an issue encountered when using a shared kernel type
>> with alloca()ed memory; DTrace assumed the type was in ddefs
>> and it wasn't so it wasn't displayed.  This change fixes that and
>> all tests continue to pass.  Also tested that it works with
>> kernel module-defined types now:
>>
>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
>> CPU     ID                    FUNCTION:NAME
>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>>                                             (struct ieee80211_hw) {
>>                                              .conf = (struct ieee80211_conf) {
>>                                               .listen_interval = (u16)10,
>>                                               .long_frame_max_tx_count = (u8)4,
>>                                               .short_frame_max_tx_count = (u8)7,
>>                                              },
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_cg.c      |  7 ++++++-
>>  libdtrace/dt_consume.c |  7 +++++--
>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>>  libdtrace/dt_htab.h    |  2 ++
>>  libdtrace/dt_impl.h    |  1 +
>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>>  libdtrace/dt_module.h  |  1 +
>>  libdtrace/dt_printf.c  | 12 +++++++++---
>>  libdtrace/dt_printf.h  |  2 +-
>>  9 files changed, 72 insertions(+), 7 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 27246a40..30cccdaf 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -20,6 +20,7 @@
>>  #include <dt_dctx.h>
>>  #include <dt_cg.h>
>>  #include <dt_grammar.h>
>> +#include <dt_module.h>
>>  #include <dt_parser.h>
>>  #include <dt_printf.h>
>>  #include <dt_provider.h>
>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>  	ctf_id_t	type = addr->dn_type;
>>  	char		n[DT_TYPE_NAMELEN];
>>  	size_t		size;
>> +	dt_module_t	*dmp;
>>  
>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>>  	type = ctf_type_reference(fp, type);
>>  	if (type == CTF_ERR)
>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>>  			ctf_type_name(fp, type, n, sizeof(n)));
>>  
>> -	/* reserve space for addr/type, data/size */
>> +	/* reserve space for addr/type, module identification, data/size */
>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>  			      sizeof(uint64_t), 8, NULL, type);
>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>  			      size, 8, NULL, size);
>>  
>> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
>> index dec2314b..432b4e12 100644
>> --- a/libdtrace/dt_consume.c
>> +++ b/libdtrace/dt_consume.c
>> @@ -1987,9 +1987,11 @@ static int
>>  dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>>  	       const caddr_t buf)
>>  {
>> -	dtrace_recdesc_t *data_rec = rec + 1;
>> +	dtrace_recdesc_t *ctf_rec = rec + 1;
>> +	dtrace_recdesc_t *data_rec = rec + 2;
>>  	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
>>  	size_t size = (size_t)data_rec->dtrd_arg;
>> +	unsigned long dm_id = (unsigned long)ctf_rec->dtrd_arg;
>>  	uint64_t printaddr;
>>  
>>  	if (size > max_size)
>> @@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>>  	if (dt_read_scalar(buf, rec, &printaddr) < 0)
>>  		return dt_set_errno(dtp, EDT_PRINT);
>>  
>> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
>> +	return dt_print_type(dtp, fp, printaddr, dm_id,
>> +			     (ctf_id_t)rec->dtrd_arg,
>>  			     (caddr_t)buf + data_rec->dtrd_offset, size);
>>  }
>>  
>> diff --git a/libdtrace/dt_htab.c b/libdtrace/dt_htab.c
>> index 478c728a..3c167cb5 100644
>> --- a/libdtrace/dt_htab.c
>> +++ b/libdtrace/dt_htab.c
>> @@ -229,6 +229,23 @@ void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>>  	return ent;
>>  }
>>  
>> +/* Find an entry in the hashtable, using the provided callback function as a
>> + * secondary comparison function to differentiate between entries in a bucket.
>> + * A pre-computed hash value is passed in.
>> + */
>> +void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
>> +			dt_htab_ecmp_fn *cmpf, void *arg)
>> +{
>> +	int		idx = hval & htab->mask;
>> +	dt_hbucket_t	*bucket;
>> +
>> +	for (bucket = htab->tab[idx]; bucket; bucket = bucket->next) {
>> +		if (cmpf(bucket->head, arg))
>> +			return bucket->head;
>> +	}
>> +	return NULL;
>> +}
>> +
>>  /*
>>   * Remove an entry from the hashtable.  If we are deleting the last entry in a
>>   * bucket, get rid of the bucket.
>> diff --git a/libdtrace/dt_htab.h b/libdtrace/dt_htab.h
>> index d39ae65e..1ce5a80d 100644
>> --- a/libdtrace/dt_htab.h
>> +++ b/libdtrace/dt_htab.h
>> @@ -100,6 +100,8 @@ extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
>>  typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
>>  extern void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>>  			  dt_htab_ecmp_fn *cmpf, void *arg);
>> +extern void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
>> +			       dt_htab_ecmp_fn *cmpf, void *arg);
>>  extern size_t dt_htab_entries(const dt_htab_t *htab);
>>  extern int dt_htab_delete(dt_htab_t *htab, void *entry);
>>  extern void *dt_htab_next(const dt_htab_t *htab, dt_htab_next_t **it);
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 2dfb64d6..2bd1dafe 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -136,6 +136,7 @@ typedef struct dt_module {
>>  	dt_list_t dm_list;	/* list forward/back pointers */
>>  	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
>>  	char dm_file[PATH_MAX]; /* file path of module */
>> +	unsigned long dm_id;	/* id of module */
>>  	uint_t dm_flags;	/* module flags (see below) */
>>  	struct dt_hentry dm_he;	/* htab links */
>>  	dtrace_hdl_t *dm_dtp;	/* backpointer to the dtrace instance */
>> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
>> index 1e730426..7697f73b 100644
>> --- a/libdtrace/dt_module.c
>> +++ b/libdtrace/dt_module.c
>> @@ -35,6 +35,8 @@
>>  #define KSYM_NAME_MAX 128		    /* from kernel/scripts/kallsyms.c */
>>  #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
>>  
>> +unsigned int module_idx = 0;
>> +
>>  static void
>>  dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
>>  
>> @@ -50,6 +52,12 @@ dt_module_hval(const dt_module_t *mod)
>>  	return str2hval(mod->dm_name, 0);
>>  }
>>  
>> +/* id is combination of hash and index */
>> +static void dt_module_init_id(dt_module_t *dmp)
>> +{
>> +	dmp->dm_id = ((unsigned long)dt_module_hval(dmp)) << 32 | module_idx++;
>> +}
>> +
>>  static int
>>  dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
>>  {
>> @@ -150,6 +158,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
>>  
>>  	memset(dmp, 0, sizeof(dt_module_t));
>>  	strlcpy(dmp->dm_name, name, sizeof(dmp->dm_name));
>> +	dt_module_init_id(dmp);
>>  	if (dt_htab_insert(dtp->dt_mods, dmp) < 0) {
>>  		free(dmp);
>>  		return NULL;
>> @@ -193,6 +202,27 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
>>  	return ctfp ? ctf_getspecific(ctfp) : NULL;
>>  }
>>  
>> +static int
>> +dt_module_idmatch(const dt_module_t *m1, dt_module_t *m2)
>> +{
>> +	return m1->dm_id == m2->dm_id;
>> +}
>> +
>> +/* High-order 32 bits of id are hash value, low order the module index.
>> + * This allows us to limit cost of search based on bucket size.
>> + */
>> +dt_module_t *
>> +dt_module_lookup_by_id(dtrace_hdl_t *dtp, unsigned long id)
>> +{
>> +	uint32_t hval = id >> 32;
>> +	dt_module_t tmpl;
>> +
>> +	tmpl.dm_id = id;
>> +
>> +	return dt_htab_find_hval(dtp->dt_mods, hval, (dt_htab_ecmp_fn *)dt_module_idmatch,
>> +				 &tmpl);
>> +}
>> +
>>  static int
>>  dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>>  {
>> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
>> index 56df17a6..68dadfc6 100644
>> --- a/libdtrace/dt_module.h
>> +++ b/libdtrace/dt_module.h
>> @@ -18,6 +18,7 @@ extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
>>  
>>  extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
>>  extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
>> +extern dt_module_t *dt_module_lookup_by_id(dtrace_hdl_t *, unsigned long);
>>  
>>  extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
>>  extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
>> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
>> index 50842216..108adc23 100644
>> --- a/libdtrace/dt_printf.c
>> +++ b/libdtrace/dt_printf.c
>> @@ -14,6 +14,7 @@
>>  #include <limits.h>
>>  #include <port.h>
>>  
>> +#include <dt_module.h>
>>  #include <dt_printf.h>
>>  #include <dt_string.h>
>>  #include <dt_impl.h>
>> @@ -2236,13 +2237,18 @@ err:
>>  
>>  int
>>  dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
>> -	      ctf_id_t type, caddr_t data, size_t size)
>> +	      unsigned long dm_id, ctf_id_t type, caddr_t data, size_t size)
>>  {
>>  	struct dt_visit_arg dva;
>> +	dt_module_t *dmp = dt_module_lookup_by_id(dtp, dm_id);
>>  
>> +	if (!dmp) {
>> +		dt_dprintf("error retrieving CTF for print() action\n");
>> +		return dt_set_errno(dtp, EDT_CTF);
>> +	}
>> +	dva.dv_ctfp = dt_module_getctf(dtp, dmp);
>>  	dva.dv_dtp = dtp;
>>  	dva.dv_fp = fp;
>> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
>>  	dva.dv_data = data;
>>  	dva.dv_size = size;
>>  	dva.dv_last_depth = 0;
>> @@ -2260,5 +2266,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
>>  	if (dt_print_close_parens(&dva, 0) < 0)
>>  		return -1;
>>  
>> -	return 2;
>> +	return 3;
>>  }
>> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
>> index 9771c4a8..8d55d82b 100644
>> --- a/libdtrace/dt_printf.h
>> +++ b/libdtrace/dt_printf.h
>> @@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>>      const char *, caddr_t, uint64_t);
>>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
>> +extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, unsigned long, ctf_id_t,
>>  			 caddr_t, size_t);
>>  
>>  #ifdef	__cplusplus
>> -- 
>> 2.39.3
>>
