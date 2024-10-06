Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0796AA920
	for <dtrace@lists.linux.dev>; Sun,  6 Oct 2024 01:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728177125; cv=fail; b=Bz4Vt5jJ9OGFJkVRJ9eIR64ntN64wYBnB1ZXWzaWaW7eLYZSThd/SP1Y/rfoSfGPAUgobG/Ch4pzimI6NgOjLyme/1hxi2MO4Nks8JS+LaUHT2fwJ8454HcCJcje5O6TXx3FKzrxqH/CBf8JJDWR9+9OrTyC/KSrGMuo5jXMZKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728177125; c=relaxed/simple;
	bh=THTSKNMuE7qAPfFQEANK1neEUCCVyYWv+hZ/dJt60L8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fw2RoEhFoS8STK8Cr3ltYf/y+C9LnkPNvvKlhzJOorlWHTlt90KSopM1amDjVmDE3r41D8QdeclM5uaFdfoWR1OzZrrDDe/g907mlYFHlfvz7fnWAP3kRgzVSMQXGyEdiXkGmhVtj3r4iJ35OcPwD88aPLLn8+5IaY7VdMSTT8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ASjURJWO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fDCX13Py; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ASjURJWO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fDCX13Py"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495FZJ4p029737
	for <dtrace@lists.linux.dev>; Sun, 6 Oct 2024 01:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=P5idtszDpjFpHW9S4cTT1lL1AsHFUODbKEXcWYeDw+Y=; b=
	ASjURJWOjVBychqyTStruZYi0gFr2yb63NgMFGaTRi2saFYjRFDOCsgj+c1fnPsL
	9yVxVk1mGxMGi2iIh2o7jfj8ruxDso6MXF3TU4ITE0z6nKcZsrujddcNN7T6NEOu
	8G6iXEfvvFt5gaaWNvaffb6UOotx9CW0ETWchQW8s/L8FA9X4I3R1XkZClU0prxr
	O3Ie/qWJW9GCio0BLBRRZtvOu++pj1q63Dja5SBGbi7RfwykOvKBAMEBx/17ptCc
	f7lIu3A1innyCiAfFT8OdquW/KcwrUaAsoHw0dRAttbgLdYni8TTTfIc+3x+0g07
	5W/6EXuk3jBLXUgKAauYUg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303y8na9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 06 Oct 2024 01:11:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 495NZHbO024049
	for <dtrace@lists.linux.dev>; Sun, 6 Oct 2024 01:11:56 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwatv6t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 06 Oct 2024 01:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/8n8tx2jyBW5qEl2PmnkfWqrak/VQKTzwBbBEqeVYt8SUZrhGLRvix+5JJ2YHiZsui5bzin08rwBofbE0j2WlDtloD4Phvi8ho4uhoGM66PNmg4Gyxk96xmj3j3P5YTYPMtB6I3W68DKYqcYhMAO7PX6j6WEK7vhwafE7HwcH77WXXFjHuZaTJMWzydTKsL4xFRCi4PNRLzj0lCPi2GGlK6KGnQJLx6XQqHVcsw3FdOO4zXTxYcOks2tupBKArtB7mELgCU9cLpLMexMR/NEAXgJSTRMoqQ7Setqev8GssPC3Q4r5VXoKA7dbkvDN9YSiHi5vnocT3lZy2tuwniDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5idtszDpjFpHW9S4cTT1lL1AsHFUODbKEXcWYeDw+Y=;
 b=mn/s1SML8sc+u8aLq0jmylQlTi5sOoUpVQIX1hz86+8nRurbEpuGxirGQnDjXZ8ppbCLx5wM9hyZ4/NLxwHLWQDNj0X2n7pzpbfzucDhJWKu95VBSjHHfJ5P7x/DGr4cRPUQ+xGec7l4cvROVlcdnpiD8S8G3NPEWW6x4z5ff+bv1w1NjnBgw9kS24MdhVUiFSzGozBbPYiHsaeRYeFacDaCW6uP1HPJ4IQH4vrjGeAk8s+8uH4qSU1+jfhgQS+5tMBGS3Ngm/BbV2hukeeMTLHUBW0+YJELdzt8lbJJkt5xa1VPu/ErptHoBl0afwBtuOs6uKrYIivv7jq9EwphAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5idtszDpjFpHW9S4cTT1lL1AsHFUODbKEXcWYeDw+Y=;
 b=fDCX13Py6BGVBBpsTTAwJ3D0Klteg6xTdebmiDyD79Zo71ZHESZVU0fc9SOGEnVnAA6McE4G2zwVJjC/54fVMCC/UXuVHlgG6FRNucJplWPoEOj+O1Ww5Hvr0VJ2STFbA4wji9wbnCOyHaIc7EETNn/awq08/fvzRx1jzo0AtOM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB5658.namprd10.prod.outlook.com (2603:10b6:510:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 6 Oct
 2024 01:11:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.019; Sun, 6 Oct 2024
 01:11:53 +0000
Message-ID: <5cae817c-e793-c56a-209b-1b40d320c39e@oracle.com>
Date: Sat, 5 Oct 2024 21:11:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4 07/19] Create the BPF usdt_prids map
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240928021525.8987-1-eugene.loh@oracle.com>
 <20240928021525.8987-2-eugene.loh@oracle.com> <Zv4lwups32GXQsr2@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zv4lwups32GXQsr2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee3ee17-3c49-4b4e-d699-08dce5a3dcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFEbno2V01OdWszdEd0TWk1M21FTEwyQWttVkkzeDNVVG1STlV5VGcvSWgx?=
 =?utf-8?B?VXFYejB1bzJkZ095c1l5bFpGSlFOUDZNZWp1eTEzRGRYMVFTK3BrWkUyOHg1?=
 =?utf-8?B?K3NSRW1HcE4yVkJndW95d3dRblpTSlRyQ09RSzdEMkk3eDRQdWt5SEdrOE1R?=
 =?utf-8?B?N2ZZTHJxNzBCQWdwbDJibThaVTdRZmhJU3l1WkVuaVliVlk0UGV5VDEzMnlu?=
 =?utf-8?B?RHhUNlhXYmVyb2tBbVJsWElOZ2tCTlFia2NWWjVnejVLRHNGVVNhWXAxelJE?=
 =?utf-8?B?TlplMVhuZ0lrOW5VYURGdSs3MktTbHRqRVhXSHpqNzFRTmdyS3hLN2NYOE5O?=
 =?utf-8?B?bDVWSTV1dW5Sd0hJY0sxN0VaeVcyRVZoZ1ZUaWozRHc4enR6MHRqQUh4OW5z?=
 =?utf-8?B?MjRlSXVVMlhMaXVQcCt5bGNwUzlLY2tLNW5xL0lSWVJqUFNLMU8zc1VQaUpQ?=
 =?utf-8?B?dkNNSEZETkozeEN0ZTI0enBuSGtqVkNlU1diWk5MNHNJWjVHb29jQ21HQ2Fm?=
 =?utf-8?B?RjcrdHVSajJKd212QnpMb1NJb295SE96WDZwT2dHb1FnQm8wRVhFVlRlY1Ux?=
 =?utf-8?B?SUhiV2ZzdDFySzRZZGVUUW5OUUZvUTVVOTZ6TUpVbnlyQzdyUE9QWFIvdlVy?=
 =?utf-8?B?TkxKUjdSeC8xVG9YOFBRNHZtdWlqRlpDN0UxaVRtZHNic2RGMTRkVmpWaEQ0?=
 =?utf-8?B?bmQ5WGJMNWpVMmdNZWxKT0NnU2UxcTlGN0JlU3IrRjAvc1Z5TUl3NlJuVFBC?=
 =?utf-8?B?Y2pIeHpMeXZ6VjJucnBtTDhrQWtOZmg4RHQzS0lOMFRqUVdzVmhVemtYbC83?=
 =?utf-8?B?TmFXYkNvTUIxTW55d3FuWUtVWGM2U05ncXQrcU1yN0FhaHB5K2ZLZmEvRm9N?=
 =?utf-8?B?STdMWEgxUW1GSGhLOG91djBoakNxMDdrN213SVZ2d2lIZXRTRTd5eUlQZm9D?=
 =?utf-8?B?dTUvdW1PazkvYTBjMEhET01TNTVxVVhLVmlLMUdJdjZqZFd4UG9qM2JVdUgx?=
 =?utf-8?B?bmhpVlJTOHQveHBEblNRaGdnbDZBeUZSb0tnTmZxdkJyTkhFT2pyVmpmWTYz?=
 =?utf-8?B?ZW96dldIaHRnUGdrWVZ1V0JHWXRjQVhVVmV3a1BsbjFqMHNBS1pYNm9yQUJ3?=
 =?utf-8?B?aEdCRTkyazR4Q1l2WmxFMVl2MlVVcmIybWprK2g4ajV2MVo0UVNXemtFZGFE?=
 =?utf-8?B?alpIaXIxdVVxVHNRa2ZqcTVqbGpRVEpnNm1GZUZyNFhMelUzNmY5bWcxMDdl?=
 =?utf-8?B?NDhqQjhUSmFHaDMxSTFucWpuMjlnT2x1aHBUS0Fyc3ZTTndTRTB1L2VxUGJ0?=
 =?utf-8?B?TGJEZXNtU3hSZGZBTEdieFF6NEhnTFZUM2NyVmN5V0tOMGUzbSs2TFMrYk5p?=
 =?utf-8?B?YVJKNldCQ3k1WjRRMVV2aHplY2NJZUNabjVCZmRUTEZEUWF3OC9VQjRtaGJh?=
 =?utf-8?B?Y2pYaVpxV2lSbzJuT3h6Tjk3cTJNMU1FVndTMTEwNnNCV3hoOXdYWlllTjBl?=
 =?utf-8?B?ei9yd09KbUFBSmdCbThIa0wzQmM3bU4yL3IzOVNmalRZOEZyb0dDeW53dHUz?=
 =?utf-8?B?aGRxTzA4d0tqMFVTM3ZZSXZxREZGVEl3ZkIxNUMyYnc5V2h3b3k3b1hzYW4v?=
 =?utf-8?B?MDJUcEQvdU56dVFpRTdtSnJnZlYvYi9wOTdRS0NxaGxNdCszUERqMTZmdC9M?=
 =?utf-8?B?cWRYMktLWE9HRkFrZU1JakRrZHRoTUtnU3ZVYkphUTZXQVEvM0J6WG5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1dSVW1ubUgxWU93SnNKTGhNTDVFRlBxQjh3a2tMZHRLZWVkaUthT0tJdjIw?=
 =?utf-8?B?RGNhRGYzSk1nbUpwZkU4dDVielFQcnZubW5QV2tYSS9OQTVJMGRMYTYwSVhi?=
 =?utf-8?B?U0dSRHpiZkpwVEJ2ZEhNbWtvRzhrUUxSSXhQNFA1cTFNamV1d2N3ZE90RTR6?=
 =?utf-8?B?ZStiTlJpZW1ENUZRbE41Z1BmcEp4ekhoUjRIaGkrWTJSMGlZYXdNTWhsUlNq?=
 =?utf-8?B?RWo4ZWRwdms4bVBKYXIyNll5VzNBUGhZL3g5M2hpZVI4OC94cTdnSCtaR2Yr?=
 =?utf-8?B?d0F1cUtpSVd0SGh6bkhTMjh2UVJ1ZnpvTkk4emd0NURRMGRCSGVsZ3B3Ri9Y?=
 =?utf-8?B?blpUbzJoYTlTc1k4MmYvc2dMOFF0QkRrS2t2cXdRQ0w3ZnJJUy9zRDkyN3lm?=
 =?utf-8?B?N0JtNUpLRkIwQU1NR0tvV2dVVFF6ZFBNOHd4VEdLNEZtVU1EY1JqVTkyT2Qr?=
 =?utf-8?B?L21LM2RGV2tHaUdqb0NrNndzNlhaUkNtQkx5dEdMa0hNa204cDIyVWJIalJh?=
 =?utf-8?B?SFJpaTdKaW1PeUk0UStrWVBYTDdwamRKc3BxUVBycGVZVU9MVnl6ckRzOEJp?=
 =?utf-8?B?YW1PQWNWcjlKWUlpakRwbW5mc3QrMzdCVi9uMXI3TUQwMTd4OGUyTklBMmhH?=
 =?utf-8?B?L0ErV0h4ZmVkVEVjejdWcjhxczd3Qjh1S2N3UjlZK09YSUIxRWM4dmVUV0RP?=
 =?utf-8?B?OUZwS3BqVEh0bTRUcFB6bUN4NzloL3RsdnhiMG1XT041SVFhRnQ5aWc0ODZv?=
 =?utf-8?B?TUQ5eWo5Q1dLbXJ6K053SXE1VUdNN2Jtbnd6ak45ZFZTaDcrdXd1bHNYRzFs?=
 =?utf-8?B?YmJscmJLM0NqWmVZRlRDUE9zU1Zia2tBaS9uN1dqZFZBT1M0a1V2WFdOek00?=
 =?utf-8?B?ZEpsMWxGcUdBNW1KMDQ2OHFsSEZzeFR6WVBmd2hvT2pSSjBJU2c2Qm5tM3gy?=
 =?utf-8?B?UllvSGNSZGZBM3laaDBBMlA4b0kzeFR1N1pycVhkQXBSTkphSDB3aDkrcG13?=
 =?utf-8?B?N0ZsZjJBL1J2ZVFwUTBsTUM1QTNNVXAyTk83RzhtZnNpNDhJUlV6ekh6aEx6?=
 =?utf-8?B?cThDT29PNFdZeS9UVldxdldvSzdaMU9LTmNkRmpPM1YrZE5QM3F1b3BHQkMw?=
 =?utf-8?B?K21EWjFBeHJsN0Z1VFBkRjJ0NXc5MTdPKyt0VG11eXpyUUFMSko2Nkx2ckFB?=
 =?utf-8?B?clN5RHVqeCt6S3pmOFBJaEtjU0EzYVhLYVA1QjdFb3JxRHFucTl5YzBLcnpY?=
 =?utf-8?B?ZlR3QWlKZkd4TlJSZnIrRnphYU9yNmtaREFuT2RkNW00V2tVblJNZGgrWTli?=
 =?utf-8?B?d0EwWGQwZUJyYW5NTjJ6OEtiWGVQUElGL3hacDFiWlZheDIyTXUzSHBISW13?=
 =?utf-8?B?VVdoQUM2M2NaZndNeFpwQTE2TDdjbFhtVGZPY0lPMkxkNWluUHpTV2tBVjNV?=
 =?utf-8?B?YmNaSXFYam42TnZlU0NCeUw0YWI2bm90SlN1b1Zsc0lTaDVpZGJCaXJyUFRl?=
 =?utf-8?B?M2FQNWpXUmRxNjZjeVpJM1hMbzBrRDd0T3hSSnlVTFRDci94UDZQNmxPZEFB?=
 =?utf-8?B?WkJYTUljVjgwaEtwSlhoUHY0MGRtMkl6bmhCTHo3dmw2UXVnL0c4by80NHh3?=
 =?utf-8?B?b044Smx6Q21pMzlNb09rcTdRcFJEYXdvTjFiV0wxV0R5SmtwWm1ZZlczYmI3?=
 =?utf-8?B?cUF0a1FrdThMZHFaeGx1YzlTQnhFdlNDRGpKdlJ2c0hhNmZ6RzduM25qdGxO?=
 =?utf-8?B?Wk1SZkQvci94VnE0N3VwVmQzMDZxbnZkTmk1VlFhc09BeDlicVpnNTRraG5P?=
 =?utf-8?B?MEdvNi9aVXZmUmRyN1BkWlUvcTRheVA5dVlVbUJxTENMM1ZZeXN3VTJuMkZT?=
 =?utf-8?B?RFhuNEpZRkVIUUJwVkJaOWNQSldiT0VwaHBkR3RydjJvRjVJV2lvVHR5NFpv?=
 =?utf-8?B?UElkKzFoenNTd1pCR3p0M1Y5dWJub1R4b2VORTdZV3NmeCtvUGJDY05Bd2xJ?=
 =?utf-8?B?T21sZGRLL1RuMVE0Vlc5Y2NtdzI4WXZuVjEvYm8yWGU5WDhkcTRZak1YYktv?=
 =?utf-8?B?ZDhidjhyMmZMelhIeWhpeC9yaFlEZjQrODZnc3V6YjBZME5zY0R1TmJ0RWpR?=
 =?utf-8?Q?qYLpFA0bgi5ADXMWvq1alAMwS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HC2yD3d59ISdveTI5Wbce9YEMq/+C7AHyl7+tLGC+txIUyfxIpTXxjT0oDyo1s9++jy7xmGqiUchWUchfgLVNlf1Qq5phh9ZmYkyzan1Tw0PEA9w0mtZhHrpUcpvnS6HfWcSf+WA8Dhi7oXMxm0K3UhnK/dCe88zl9I6GKrNmy6AeoyJpvXYP6qWhfp5OxC+dOUDtGK0NMMLu5BSlq34B3TpcQ3oasIMqTq+CEkrbEpq7ii0HM8ONWSJ4jEaocakMWlJDnfba/Tw3oIdz/bnA2E/fnZWX4qI4ewnVHfoEvz45nyOUjYVtEJ1oFRGdJg+FmzUYIxJTRZi5+foky8wBbilbdZ92fxxdyCBsIuc1ZIeufdXTWDSzLnInj//bHvCOBMF9vejX/H2K5ZHuQvIQkDgh0R3m6ffyLWv32YsPEzzs9GZhoBIAdCujtp7jnTnWxnUqlFxNWLOd+kSooNDws3gSp2dYTCGBKXpEUUM1ui4OYKv6ZqM3uwaIB5ndNEmZXLwVACQT4oxeU9hjGiuuc4DXEVruf51gso2yuAoou8DqZsKevqm8Uj+oVM3qAVujzuMcItkA6+b5iw/E5y2iHEhNyEQQnwgT/JmJGjAM70=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee3ee17-3c49-4b4e-d699-08dce5a3dcf5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 01:11:53.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHfSD9Hq0rEFrzqnlayCVIQE67rCjwyMhGYFP4IEAFW+BOoKhyeI2p1jkvkwtVUTNu3WN2IAh4BkNG7UijFmOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5658
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_24,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410060007
X-Proofpoint-ORIG-GUID: ip0wVcYSJJm8DOp0ryN4Q1sHJR7KQlDx
X-Proofpoint-GUID: ip0wVcYSJJm8DOp0ryN4Q1sHJR7KQlDx

On 10/3/24 01:04, Kris Van Hees wrote:

> The main problem with the current implementation is the fact that the strtab
> BPF map is being updated while it is being used.  That is not a safe operation,
> and can have unpredictable behaviour depending on the actual implementation at
> the kernel level.  We cannot cuont on it being safe.
>
> I propose introducing a usdtsize option (or whatever we name it) that sets the
> number of USDT probes that we can support.  It should be used for the size of
> the usdt_prids map.
>
> In order to be able to provide the data for probeprov, probemod, probefunc, and
> probename, we need to have a way to store probe name elements dynamically.  That
> can be done using a usdt_probes hashmap that stores a string (128 bytes max) and
> is indexed by an int.  The bvara code will need to know to consult this new
> BPF map to get the data.  I can see two options:
>
> 1) increase the probes BPF map by usdtsize extra elements, and set the highest
>     order bit to indicate that the value for a probe name element should be
>     retrieved from the usdt_probes hashmap.
>
> 2) add probe name element key values to the usdt_prids map

We usually want to access this by prid, and usdt_prids has prid in its 
value rather than in its key.

> Approach 1 uses the existing the mechanism for storing this data, but adds some
> (very minor) performance hit to all probeprov, probemod, probefunc, probename
> bvar lookups because we need to check for the highest order bit.
>
> Approach 2 means we have an alternative place where we store the probe name
> element data, but it remains localized with the other USDT probe data *and*
> the performance impact is limited to USDT probes only (if the prid is not
> found in the probes map, we need to look in the usdt_prids map).

How about this.  There are some probes that are already known when we 
create the BPF maps.  We simply remember how many probe IDs exist at 
this time.  Thereafter, if we have a probe whose ID is greater, its name 
elements go into a new hash map.  In get_bvar(), the first thing we do 
is look whether the probe ID we're looking up is old (less than the 
number of initial probes) or new.  That tells us whether to look in the 
standard, static hash map or in the new, dynamic hash map.  Sound good?  
I have this version working.  If you agree with the approach, I'll clean 
up the patch and post it for review.

Put another way, when we create the BPF maps, we memorize the current 
value of dtp->dt_probe_id.  I call this dtp->dt_ninitprobes, the number 
of initial probes.  Thereafter, we use the traditional BPF map when prid 
<= dtp->dt_ninitprobes and the new dynamic hash map otherwise.

> On Fri, Sep 27, 2024 at 10:15:25PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> As USDT processes come and go, the overlying probes for an underlying
>> probe will change.  Hence, we will move to a scheme in which an
>> underlying probe will walk all possible clauses it could call,
>> deciding at run time (using a bit mask for the overlying USDT probe)
>> which of the clauses to call.
>>
>> In this patch, we create and update the BPF "usdt_prids" map.  This
>> is a hash map, where:
>>
>>    *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
>>          - the PID of the firing process
>>          - the PRID of the underlying probe
>>
>>    *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
>>          - the PRID over the overlying USDT probe
>>          - a bit mask indicating which clauses should be called
>>
>> As processes start up, we also add new overlying USDT probes,
>> requiring updates of the BPF "probes" and "strtab" maps and of
>> the list of enablings.
>>
>> The underlying-probes "update" function is called sporadically.
>> The focus of this patch is the function.  When it is called can
>> be tuned in future patches.
>>
>> This patch guesses certain sizes very crudely.  These sizes should
>> be handled more robustly in future patches:
>>
>>    *)  The allocated size of the string table.  For example,
>>        new provider names have to be added as new processes
>>        start.
>>
>>    *)  The number of entries in the BPF "usdt_prids" map.
>>        There is a little relief here in that, as processes
>>        terminate, they can be removed from the map.
>>
>>    *)  The size of the bit mask -- that is, the greatest
>>        number of clauses an underlying probe might call.
>>        This is relatively easy to extend;  nevertheless,
>>        that work is left for a future patch.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_bpf.c         |  43 +++++-
>>   libdtrace/dt_cc.c          |   2 +-
>>   libdtrace/dt_dlibs.c       |   1 +
>>   libdtrace/dt_impl.h        |   6 +
>>   libdtrace/dt_prov_uprobe.c | 278 +++++++++++++++++++++++++++++++++++++
>>   libdtrace/dt_work.c        |   3 +
>>   6 files changed, 331 insertions(+), 2 deletions(-)
>>
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index ad11d178e..4acf6e494 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>>   	int		fd, rc, err;
>>   
>>   	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
>> -	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
>> +	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
>> +	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
>>   	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
>>   	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
>>   	dtp->dt_zerosize = 0;
>> @@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>>   	if (rc == -1)
>>   		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
>>   				    strerror(err));
>> +	dtp->dt_strtabmap_fd = fd;
>>   
>>   	return 0;
>>   }
>> @@ -936,6 +938,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>>   				dtp, "cannot update BPF map 'probes': %s\n",
>>   				strerror(errno));
>>   	}
>> +	dtp->dt_probesmap_fd = fd;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Create the 'usdt_prids' BPF map.
>> + *
>> + * USDT-PRID information map.  This is a global hash map for use
>> + * with USDT probes.  It is indexed by (pid, underlying probe ID).
>> + * The value is a probe ID for the overlying USDT probe and a bit
>> + * mask indicating which clauses to execute for this pid.
>> + *
>> + * WIP.  Just make up some sizes for now.
>> + *
>> + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
>> + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
>> + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
>> + *     So either uint32_t or dtrace_id_t is fine.
>> + *
>> + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
>> + *
>> + *     How many entries should we allow?  Start with 1000.
>> + *
>> + * Note that for a given (pid, PRID) key, there can be at most one
>> + * overlying USDT probe.
>> + */
>> +static int
>> +gmap_create_usdt_prids(dtrace_hdl_t *dtp)
>> +{
>> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
>> +			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
>> +	if (dtp->dt_usdt_pridsmap_fd == -1)
>> +		return -1;
>> +
>> +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
>> +	if (dt_uprobe.update(dtp, NULL) < 0)
>> +		return -1;
>>   
>>   	return 0;
>>   }
>> @@ -1045,6 +1085,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>>   	CREATE_MAP(scratchmem)
>>   	CREATE_MAP(strtab)
>>   	CREATE_MAP(probes)
>> +	CREATE_MAP(usdt_prids)
>>   	CREATE_MAP(gvars)
>>   	CREATE_MAP(lvars)
>>   	CREATE_MAP(dvars)
>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>> index 4202771a9..12104fc21 100644
>> --- a/libdtrace/dt_cc.c
>> +++ b/libdtrace/dt_cc.c
>> @@ -1045,7 +1045,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>>   				nrp->dofr_data = 0;	/* FIXME */
>>   				continue;
>>   			case DT_CONST_STBSZ:
>> -				nrp->dofr_data = dtp->dt_strlen;
>> +				nrp->dofr_data = dtp->dt_strmax;
>>   				continue;
>>   			case DT_CONST_STRSZ:
>>   				nrp->dofr_data =
>> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
>> index ba4d4abef..924cf11e4 100644
>> --- a/libdtrace/dt_dlibs.c
>> +++ b/libdtrace/dt_dlibs.c
>> @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>>   	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
>> +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 340dc1960..1d1248766 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -282,6 +282,7 @@ struct dtrace_hdl {
>>   	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
>>   	dt_rodata_t *dt_rodata;	/* global read-only data */
>>   	uint_t dt_strlen;	/* global string table (runtime) size */
>> +	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
>>   	uint_t dt_rooffset;	/* read-only data offset */
>>   	uint_t dt_rosize;	/* read-only data size */
>>   	uint_t dt_zerooffset;	/* zero region, offset */
>> @@ -389,6 +390,11 @@ struct dtrace_hdl {
>>   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>>   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>>   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>> +	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
>> +	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
>> +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
>> +	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
>> +	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
>>   	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>>   	void *dt_errarg;	/* error handler argument */
>>   	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index bb172ace2..d99915fa2 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -37,8 +37,10 @@
>>   #include "dt_list.h"
>>   #include "dt_provider_tp.h"
>>   #include "dt_probe.h"
>> +#include "dt_program.h"
>>   #include "dt_pid.h"
>>   #include "dt_string.h"
>> +#include "port.h"
>>   
>>   /* Provider name for the underlying probes. */
>>   static const char	prvname[] = "uprobe";
>> @@ -63,6 +65,15 @@ typedef struct list_probe {
>>   	dt_probe_t	*probe;
>>   } list_probe_t;
>>   
>> +typedef struct usdt_prids_map_key {
>> +	pid_t		pid;
>> +	dtrace_id_t	uprid;
>> +} usdt_prids_map_key_t;
>> +typedef struct usdt_prids_map_val {
>> +	dtrace_id_t	prid;
>> +	long long	mask;
>> +} usdt_prids_map_val_t;
>> +
>>   static const dtrace_pattr_t	pattr = {
>>   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>> @@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
>>   
>>   static int populate(dtrace_hdl_t *dtp)
>>   {
>> +	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
>> +	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
>> +
>>   	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>>   			       NULL) == NULL ||
>>   	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
>> @@ -123,6 +137,269 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>>   	free_probe_list(dtp, datap);
>>   }
>>   
>> +/*
>> + * Clean up the BPF "usdt_prids" map.
>> + */
>> +static int
>> +purge_BPFmap(dtrace_hdl_t *dtp)
>> +{
>> +	int			fd = dtp->dt_usdt_pridsmap_fd;
>> +	usdt_prids_map_key_t	key, nxt;
>> +	usdt_prids_map_val_t	val;
>> +
>> +	/* Initialize key to a pid/uprid that cannot be found. */
>> +	key.pid = 0;
>> +	key.uprid = 0;
>> +
>> +	/* Loop over all entries. */
>> +	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
>> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
>> +
>> +		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
>> +			return dt_set_errno(dtp, EDT_BPF);
>> +
>> +		/* Check if the process is still running. */
>> +		if (!Pexists(key.pid)) {
>> +			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * FIXME.  There might be another case, where the process
>> +		 * is still running, but some of its USDT probes are gone?
>> +		 * So maybe we have to check for the existence of one of
>> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
>> +		 *     char *prv = ...pdp->prv minus the numerial part;
>> +		 *
>> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
>> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
>> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
>> +		 */
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Grow the string table map.  It includes the string table (which might
>> + * grow due to new USDT probes).  It also includes the read-only data and
>> + * the block of zeros, but these remain fixed.
>> + *
>> + * FIXME Is there a danger of the BPF map update colliding with map reads?
>> + */
>> +static int
>> +grow_strtab(dtrace_hdl_t *dtp)
>> +{
>> +	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
>> +	char		*strtab;
>> +	uint8_t		*buf, *end;
>> +	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
>> +	uint32_t	key = 0;
>> +	int		rc, err;
>> +
>> +	strtab = dt_zalloc(dtp, sz);
>> +#if 0
>> +	// FIXME do something
>> +	if (strtab == NULL)
>> +		return dt_set_errno(dtp, EDT_NOMEM);
>> +#endif
>> +
>> +	/* Copy the string table data. */
>> +	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
>> +
>> +	/* Loop over the string table and truncate strings that are too long. */
>> +	buf = (uint8_t *)strtab;
>> +	end = buf + dtp->dt_strlen;
>> +	while (buf < end) {
>> +		uint_t	len = strlen((char *)buf);
>> +
>> +		if (len > strsize)
>> +			buf[strsize] = '\0';
>> +
>> +		buf += len + 1;
>> +	}
>> +
>> +	/* Copy the read-only data. */
>> +	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
>> +
>> +	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
>> +	err = errno;
>> +	dt_free(dtp, strtab);
>> +
>> +	// FIXME do something
>> +	if (rc == -1) {
>> +		strerror(err);
>> +		return -1;
>> +		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Update the uprobe provider.
>> + */
>> +static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
>> +{
>> +	dt_probe_t	*prp;
>> +	dt_probe_t	*prp_next;
>> +	int		i, prid = dtp->dt_probe_id;
>> +	uint_t		old_strlen = dtp->dt_strlen;
>> +	dt_pcb_t	pcb;
>> +
>> +	/* Clear stale pids. */
>> +	purge_BPFmap(dtp);
>> +
>> +	/* Update dt_probes[] and dt_enablings. */
>> +	/*
>> +	 * pcb is only used inside of dt_pid_error() to get:
>> +	 *     pcb->pcb_region
>> +	 *     pcb->pcb_filetag
>> +	 *     pcb->pcb_fileptr
>> +	 * While pcb cannot be NULL, these other things apparently can be.
>> +	 */
>> +	memset(&pcb, 0, sizeof(dt_pcb_t));
>> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
>> +		dtrace_stmtdesc_t *stp;
>> +
>> +		stp = dtp->dt_stmts[i];
>> +		assert(stp != NULL);
>> +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
>> +	}
>> +
>> +	while (prid < dtp->dt_probe_id) {
>> +		dt_bpf_probe_t pinfo;
>> +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
>> +		int fd = dtp->dt_probesmap_fd;
>> +
>> +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
>> +
>> +		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
>> +		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
>> +		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
>> +		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
>> +
>> +		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
>> +			assert(0);   // FIXME do something here
>> +
>> +		prid++;
>> +	}
>> +
>> +	/* Grow the strtab if it has gotten bigger. */
>> +	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
>> +
>> +	if (dtp->dt_strlen > dtp->dt_strmax)
>> +		assert(0);               // FIXME handle this more gracefully
>> +	if (dtp->dt_strlen > old_strlen)
>> +		grow_strtab(dtp);
>> +
>> +	/* Review enablings. */
>> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
>> +		pid_t		pid;
>> +		list_probe_t	*pup;
>> +
>> +		prp_next = dt_list_next(prp);
>> +
>> +		/* Make sure it is an overlying USDT probe. */
>> +		if (prp->prov->impl != &dt_usdt)
>> +			continue;
>> +
>> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
>> +		/*
>> +		 * Nick writes:
>> +		 * This is a general problem with running compiler-adjacent things outside
>> +		 * compile time. I think we should adjust dt_pid_error() so that it works
>> +		 * with NULL pcb and dpr at once, probably by using the code path for
>> +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
>> +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
>> +		 * already handle this case.)
>> +		 */
>> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
>> +
>> +		if (!Pexists(pid)) {
>> +			/* Remove from enablings. */
>> +			dt_list_delete(&dtp->dt_enablings, prp);
>> +
>> +			/* Make it evident from the probe that it is not in enablings. */
>> +			((dt_list_t *)prp)->dl_prev = NULL;
>> +			((dt_list_t *)prp)->dl_next = NULL;
>> +
>> +			/* Free up its list of underlying probes. */
>> +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
>> +				dt_list_delete(prp->prv_data, pup);
>> +				dt_free(dtp, pup);
>> +			}
>> +			dt_free(dtp, prp->prv_data);
>> +			prp->prv_data = NULL;
>> +
>> +			/* Free up BPF "probes" map entry. */
>> +			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
>> +
>> +			continue;
>> +		}
>> +
>> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>> +			dt_probe_t		*uprp = pup->probe;
>> +			long long		mask = 0, bit = 1;
>> +			usdt_prids_map_key_t	key;
>> +			usdt_prids_map_val_t	val, oval;
>> +			dt_uprobe_t		*upp = uprp->prv_data;
>> +
>> +			/*
>> +			 * For is-enabled probes, the bit mask does not matter.
>> +			 * It is possible that we have this underlying probe due to
>> +			 * an overlying pid-offset probe and that we will not know
>> +			 * until later, when some new pid is created, that we also
>> +			 * have an overlying USDT is-enabled probe, but missing this
>> +			 * optimization opportunity is okay.
>> +			 */
>> +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
>> +				int n;
>> +
>> +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
>> +					dtrace_stmtdesc_t *stp;
>> +
>> +					stp = dtp->dt_stmts[n];
>> +					assert(stp != NULL);
>> +
>> +					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
>> +					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
>> +					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
>> +					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
>> +						mask |= bit;
>> +
>> +					bit <<= 1;
>> +				}
>> +			}
>> +
>> +			key.pid = pid;
>> +			key.uprid = uprp->desc->id;
>> +
>> +			val.prid = prp->desc->id;
>> +			val.mask = mask;
>> +
>> +			/* linux/bpf.h says error is -1, but it could be -2 */
>> +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
>> +				/*
>> +				 * Set the map entry.
>> +				 */
>> +				// FIXME Check return value, but how should errors be handled?
>> +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
>> +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
>> +				/*
>> +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
>> +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
>> +				 */
>> +			} else {
>> +				/*
>> +				 * Nothing to do, it already is in the map.
>> +				 */
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>>   
>>   /*
>>    * Look up or create an underlying (real) probe, corresponding directly to a
>> @@ -782,6 +1059,7 @@ dt_provimpl_t	dt_uprobe = {
>>   	.probe_info	= &probe_info,
>>   	.detach		= &detach,
>>   	.probe_destroy	= &probe_destroy_underlying,
>> +	.update		= &update_uprobe,
>>   };
>>   
>>   /*
>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>> index 40913a0f1..0efad3633 100644
>> --- a/libdtrace/dt_work.c
>> +++ b/libdtrace/dt_work.c
>> @@ -368,6 +368,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>>   	dtrace_workstatus_t	rval;
>>   	int			gen;
>>   
>> +	if (dt_uprobe.update(dtp, NULL) < 0)
>> +		return DTRACE_WORKSTATUS_ERROR;
>> +
>>   	switch (dtrace_status(dtp)) {
>>   	case DTRACE_STATUS_EXITED:
>>   	case DTRACE_STATUS_STOPPED:
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
