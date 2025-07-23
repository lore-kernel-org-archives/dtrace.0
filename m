Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04563205AB6
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263971; cv=fail; b=DGmFuj+najK7DhjnZHwVGie/IFDGAH3MfPUg4czq1+1aKcwzfDcnuDAqjrq9vSWnWd/76fQ+HSQG/Vf/rt/Vd9BFdAMTArsU9hQfEy8HEyvK0ZG6gpMrm1i/+WqgmCLhirvYRlfIr1QsUBBN0f77K73lDGNuq2dFeCH3zLahb3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263971; c=relaxed/simple;
	bh=kc+AarOYUuMN5cSx2isdP0jKmEN6IvkqCxcKVCs9bUg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pkbkaa2ovGBWXGTi3eka+OcFwZv/x5VzIll95ECkweZpUzIowcchvYNudulPIbWM59OmB01y2/r19W4nqEi+bNAUh94N2gEd4gQfQGl9Ra5fv3/QPV45jNmHCCHhVOWlXfE1q5WGnrvh3WrUrqP5hqcvghFmYCzw1fxBvsto9/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UrB37k7L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BwkWW4Jy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UrB37k7L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BwkWW4Jy"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8MrfE002554
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 09:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=c4QR9OVGSv0MQyVEF7v4a+ZXldPn17aNo6y191EGhAQ=; b=
	UrB37k7L5pFpajB7Efl1HA23g9LGi9rAO2zOZ3z8NPikmWP3sVa+iB1pNYFG3SMP
	5GfimUJO5A+EaxDPja9bcV4erlytirtyiA30pscvlMWtmg15gohtPenahokhllUP
	jjQ9zLor/cTszzksYXLALZK+PwQsu2drHudTkDO1VbHWo81pbgUbTNZFIJosP22W
	H8HTx+sty/rYjKJv+vbHdDZP8CBhINyu/Md9HdD1H3wVcT3JW/KodDecGYsWzodT
	se7MsfNBu4EQl8EwUQrIVeg0bKIrVD1L+KvLlS2dUcQn7Et3XitxPC0/JbD6WrXe
	MnXID+bx4r/a+K4Mp78o5w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qyay8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 09:46:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56N81IlZ031685
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 09:46:07 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tgps18-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 09:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPHSARK6ofmL0E5DfsSm7YS4Y5Ud75N/RZEMGa8g9sqMzzPspqhB4vPy0T/g6hp1CmNAe1H5xBow5Pp2z8DtRj2+cxJaHGuYuUNqltca0W4TBept1AsdNv1xLtxtP20nV3NHdnt2cHitGtgv/jsFmLlA9UcBEAflI7vVfQhAdMNJnnBrPljo9T0kdzUzj7a1rS+/37Wqlg4hymzwyyaEP6vfouIBHMz+c4+gN6KpZrS4EqX5kgmsF4tNHHRzPP73GhW+6GE/YCT9cEsQ3bdQt/mXJ8AS+yt15v0YAPacCYKTSrd2YrsUBBvPLajTeyiz2zES8MNFsL6kGWWkuYXahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4QR9OVGSv0MQyVEF7v4a+ZXldPn17aNo6y191EGhAQ=;
 b=F636LkL7fV6uKJyNhUrBClFE+T22hfkRI8rDizGxmSZTknnjbNuZqRtBkNer9Od/ebApYA0cHl1REcUDVBZK/w6WuT07EEK7E4r3p8EKzFEaWxWF5xRuWXzCzDJa/cCF1+HPpuIyEdzF4dPSxZ7Dm3DEubz0v89bQiti1nlxC/6Ro3SkzNLHFdqXkuDMw4YKTlS0GNFadfIGV4CQpCebGSR9avvm5dly8StPmGstBxFnmii1fJMG8yzRk7INa6YYb4zA4d/xzTm3lIDUjyQVJN+4wQFPyHedU9J1b34ivTQjBVLXN62jDGQ03P6SgCW9Sa4Jx+ZHBQY/d6GRzTNDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4QR9OVGSv0MQyVEF7v4a+ZXldPn17aNo6y191EGhAQ=;
 b=BwkWW4JykV0JCiLvtJpeQ3bDsVXTMv/sTz0L5UCVQ2dPzxExNV/O3tjtkYrAfDZpByr9IFzO1hO+db5j2fYPB26cPU1PxywtnaMfC9VvVucuSUIpMjdn5Im1FtBmUZh6/SAaUIa5ZA/41EAxWDZLSRVmLC8ciK8bKWEp6dXwYlc=
Received: from CY5PR10MB6261.namprd10.prod.outlook.com (2603:10b6:930:43::22)
 by IA0PR10MB7206.namprd10.prod.outlook.com (2603:10b6:208:402::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 09:46:04 +0000
Received: from CY5PR10MB6261.namprd10.prod.outlook.com
 ([fe80::4a7d:7fe5:63c2:445]) by CY5PR10MB6261.namprd10.prod.outlook.com
 ([fe80::4a7d:7fe5:63c2:445%4]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 09:46:03 +0000
Message-ID: <d9832c82-6037-4a96-9815-5f351eaff9ea@oracle.com>
Date: Wed, 23 Jul 2025 10:45:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lexer: support // comments
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56723B89F0E03BCEB06A3FFEC25FA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <SJ0PR10MB56723B89F0E03BCEB06A3FFEC25FA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0107.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::10) To CY5PR10MB6261.namprd10.prod.outlook.com
 (2603:10b6:930:43::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR10MB6261:EE_|IA0PR10MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0532840d-7ddc-4cf6-bdbb-08ddc9cdbd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0F1NzVhK0dnUlVhNERtTVRpSlEvaWxTY0M2WlRMdGRGMDdkRCs1R2VJQ2xV?=
 =?utf-8?B?VmkrQjFZTVQ3VnV4Sjc4dTh4bHZpaW55ZGVScHdQUk1NUnRFOWpySnBtajVN?=
 =?utf-8?B?TXlYY0ViS2ZLcnJ6T2xnQjRYV1BNanFteTdQSW1vTWVReXYvVkxPciszRE4y?=
 =?utf-8?B?aEpyZUg3LzZaeHdVUjFjRm1YWDRvbVNRc3lBd2I4TndSNnpPcGh1cmxHMkN3?=
 =?utf-8?B?WkZXOFhmMkhCOVpoSGgvT1Rrb2RoRmRDM3V5UVV5UnByaHlEYjgwVUkrSjdn?=
 =?utf-8?B?dTN1Umx2OU1Dck83SzZzWmswUHd5WGJjR1VGWS83YW00d2srR0E2bUtEaEJP?=
 =?utf-8?B?STk5c3V2QWxFUXRVU0xWbE1vS0dvaDRRT250Ylc1SDFWV2QyWnlBVUV5UDBq?=
 =?utf-8?B?WjJPcVo5V29wdVlmblpEV21rOTgwV1BIQkxhVnlQOXV1YjgrVGZEYXpPMDk3?=
 =?utf-8?B?OHZISDdYSXpLdm5GOVd2bTBvUUE3WVZxNzYxRGdtUTFEb0lJUDNCYXNGSHI5?=
 =?utf-8?B?cE12dVVJdDlJZElrNzlxTzAzRDZ2MG11TDNTU1JydmZSakFna3Q3bkxoQnk3?=
 =?utf-8?B?UDdQdy9TSjVMWElRbkFYbkVXRkwrZjIyVzdIQzdMeUVrMEwzVVlhcTV6bjFG?=
 =?utf-8?B?OWhJZ0JjeEJxWE8vUkxJaFcyZkRTclFvMVQ1aS9sWFJtSm14QVcwM3Z2YVNR?=
 =?utf-8?B?Tkp1eTkxVjNYekdhcGs5UG5SL0lNbExQWHZMUS9CZ1pjeEdxbXdKdUlCbHN5?=
 =?utf-8?B?aThiVWlrR2JHZjVrS2FLQUY2cnlVTllBMFd4Q2d0V1RWMlBTczFMVWh5UXd1?=
 =?utf-8?B?d0lZSS9DYUh3a0x6c3FsVVNzeS82T0MzS0dnSTdLcVFtYjRpclJLWEd0K2lH?=
 =?utf-8?B?WGIyZzlNSjBpR3AybGFSdUZTdHVDMXpKZ2RBcU9STWxjTEFVbjh2Qk5LMk1R?=
 =?utf-8?B?OHppd2Y3Vy9ZL1p5dEVGVUFmK0pMVVhtcmV3T3Zkdm9KYzRNREhWWHY4Lzh2?=
 =?utf-8?B?aWdERjdoenN2aS9FZ25UUFpIbzJtZW93RUlCMDI0cE9yV1RrZnVzR3c3RGJm?=
 =?utf-8?B?R1VISENiWHdtUTdUYU1Rc0JiSlhRc3Z4L0xrejEvbnZJQWlENldSYlVEVlBw?=
 =?utf-8?B?Y2NUY1VZNnNZS0hWYUswS3MrQW5DdWFVQWhHQkZzUVF5WFU2NERKa045Zk1T?=
 =?utf-8?B?L29HWTFrUlY2SGVPbmR0Y3YrUk1YQTNEU3ZmYTIyczNtelI1Ynp4WitTdk1H?=
 =?utf-8?B?MXJrRkFhSFVzWi9sdHc2UEpCNHdjaFZVU3B4bHpuVll1dWZkZlhyWFlHQVc5?=
 =?utf-8?B?U2l2OE5oYk9QOVQwVXhvTVlZcmtIbXVzTXdES0R4ekk4WVVqYUhleFE3bmxL?=
 =?utf-8?B?dWJWeUJ3S2ZTN1MxK0Y2T3pMMjJxZ1J3RTV0MmVyak9RbFhrWmlxenZKS3My?=
 =?utf-8?B?amppY0xIekFpL2pxdWJUc3Zkc3ByV21POEhKa1h1N3FXbVdHY01wTVRKSFRa?=
 =?utf-8?B?VlFsYko0WkJuVEVtUVJOd0E3dWRaOENvUFk5Ulk5TEVGWHcrNkdXU3RGR21O?=
 =?utf-8?B?MWJ4cDNEUjhXMkJKbjBsWVFGOERIcGkyQlM3WUhBYldyWk5oZmdhbVpkMlU2?=
 =?utf-8?B?WlpsOEVOREc4TUxFTzh6ZzFianVJeERjSWVPY3RsTGRxb0t0K3B6WGtvVy9U?=
 =?utf-8?B?Z0R0WFJ1NkFqcHJIbE5jYnhHU3BheHRxbTRQU0paR2VxS3d1ZHJSTzBXRDlz?=
 =?utf-8?B?M0NwejQxWmVtN2lRZk1EVXV0YTVvT0phVkVvT2ZmZUEvb0x3b0phQzJVVXVt?=
 =?utf-8?B?WkxjYXZibzZjWWFiWVRJN2w0cXJaV2wyL1dLUXlyWG02ZENWdjczVVpCODBC?=
 =?utf-8?B?cWtIWE5EdUtrUElKcFRVaFpZV2NkdmZrbnViOUdQZkkyQUVlOTZDTzZxajZl?=
 =?utf-8?Q?xehCrwoOz1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR10MB6261.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW5Za3BGbDZXeGtDSUxwdmhOc1ZLbVk5UmdwUlpnQytGNS9DK2t1OG1jQ3FT?=
 =?utf-8?B?T1N3WjZvc25yTE41NGl4VGg2dHc0YjFxSmhnci81VkFWU0NEVUJDV1JNVCtU?=
 =?utf-8?B?aW5YdEh6R1pRVjBiT1UrcVFEeUFJSzlqY3Q0dGNSeDhpcUNNOU9jY1hEYUtC?=
 =?utf-8?B?OXkwVk0xODVuMDBZdlVVcDBwaGY4R3VsVkladTdYWVE0NER1RCtIOVpzMEZZ?=
 =?utf-8?B?U0tnWlNkUXZsVndITXdkREhoamZybUx0ckU1SVNOT3R3anRjMlZLaldWRjVa?=
 =?utf-8?B?a3JyREdhY0oxVEljcjB0d1BhWXZ2a1VSeXFqNUV0Z0xHMlhBWG8wTUQ0VEJL?=
 =?utf-8?B?eUlVd3JZMnVwTW5La0NaendJZzVzUUpGMlRxOTc1R1lHMXM5MkVVd0IwK2Vu?=
 =?utf-8?B?NTRKU1ptWFBOdUFqYkFPcFpvRWdZWEh6V0J5VWh3dnVMcVAwM1FaZ3RKQ2My?=
 =?utf-8?B?Q3VTdjJKcWhnZkx3VUxoWVdkTW1xeDdBNlZHQkVMcHorR0hHcExxSzQwZnpv?=
 =?utf-8?B?Q3JEVTJWYWY4Ym1jUTM4ZHI2MjEzWCtwQzUrdXdUY0tqQ1prbzZWeVhKbVpB?=
 =?utf-8?B?dFUvKzUyMEhPSXFkbUZVNzBqSWFlUW5VM0JuM0FaeCtWaWhlN2tjSEMzWkEr?=
 =?utf-8?B?Mm84TS8xWDdISUVlVFYzeHZZS0picElyVVg4aU40NE9SeXp1Mm9WRitYZ0py?=
 =?utf-8?B?NTVsd3Z2c1drVXYwVklyUDhYM0ZndmU1S1oxWnJXRW01YWNuS0M2YzB2QldS?=
 =?utf-8?B?SEg2VjVmZTM4YkkwbnBWZG51UU1abFpyNEFkQnc3UEdjcU95ckwwTCtjWmNw?=
 =?utf-8?B?eFJOcmlEZkpGamh3dXlPN2srYUM3diticENBa2VTU2FMeitXbnBzTDhzcEc0?=
 =?utf-8?B?dlppN1ZSRmFVL2VNazdRR1h1TCtzMElXWGtkMnc0alpUT2VnMmp4NXUyb2pJ?=
 =?utf-8?B?VXRZTEswc2h3VkpwZHM5b01qcXhIbWNOUzdoOEZERHpFVEdGWEtvVUdTZ3p4?=
 =?utf-8?B?cWRITm1QeXpVWkJ1a1FsTng2ZWs5WFhFWnZxOHV1ZW52dExXbkNGaGNzNnVQ?=
 =?utf-8?B?Qm1lL3l0OUJxSUlsbyt3cUhoZFBHVlZJcHJRSmc4cytnQUhHZkpWa3JoOXlP?=
 =?utf-8?B?YkpSOGlHaDJKd0U4ZWpPd05LNE50QkVwTWt1R1AybWYweVZLV2gvbG5MeVJT?=
 =?utf-8?B?NlNDMVhRT0xadnlVWmRGNkl5ckZZeUgwWnhMamtabVErQllOaVVSZVNuQ0Rm?=
 =?utf-8?B?b0tFL0IzSVNOd094Y3pZMWJRcGpTUzdpS2dKNVNFYW8zU04yV0NTdDFYdGpn?=
 =?utf-8?B?NVd0OEdvOXR6dkIva093L0ZEZ0VSNDlpNnY4dGN4bjdxbkNhNmJOT1lVMDF0?=
 =?utf-8?B?MkQwYmI4S24zSko1SlBiUFpXQnQwelZWWmRCR2w4T1FIaDJ1WHJXQTMxS2tr?=
 =?utf-8?B?eDhGUnhCSVlkc3BUYTFqd0NoL1BEVlZKMEF6WEJZanl4QzY4Y0tzOVZaSTBK?=
 =?utf-8?B?VEdEQUJnem5kSWhxN09ZU0RVdDBpUkhkQ0VKT3JLV0ZxelRRNmlhWjBaRENC?=
 =?utf-8?B?V0JKcmtsSzdTbnVRQjVQUVNwaVdkK1JXMVQ2U3I2Nm1rWVpnWEtjMGFUdDVI?=
 =?utf-8?B?dU0ybUxaanh6UUhlVVBoZmlsQnQ5M3QxNStoR0FzVmc4TDFrY2ExMEVZbzgy?=
 =?utf-8?B?djZLb3RNakxDQ0szK1dldVdleXk2ZzJtN2hkNktURFJtQmJZalU5Z3k4K3Rj?=
 =?utf-8?B?TnZkTU9wY3lXWkJzeVdFTzlza2hVb3h3Q3l6T28zNWF6TjdpbGNHZXN3ckNJ?=
 =?utf-8?B?bTlZQlVwbnVuYngvdnhqSVd1WS9uclNoUGh1UVNEZmxlcndGeDNDeW5uc2My?=
 =?utf-8?B?dWNLN1VwY1VpZlNuMzR0SjI2RVRSSG1tb2dZcVFqZHo0emxKSkF3VjdBOUYr?=
 =?utf-8?B?VnpwRmN6d2FQTU1wSzJ0MkNRc2l6b2JWbVNyQ2tCWWRZL29ReGEzbk5ETGZF?=
 =?utf-8?B?WnNoQUg0S0l6SWZ1OG9DOVVaMGZTeTFUaHNMQk01cEFCRTAwSVhPYnF3c0NW?=
 =?utf-8?B?elVoVjVyRHBvZ2VOMG5HTmszbHZqOFVmdTJPenAwRXNGRlVyNnRTbURGckJL?=
 =?utf-8?B?SVgxUHVoUXhaUlN0UTQxbGpieExjcjZ3cnNYenZZbVJqQVN5UnBYeG9lQzl2?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d95dWxG7Sbh4FANE0LhujGnuNPebk3KU30iOy4u5pMg1rUDNuyhBKFFthgP0JD166HPrLf3DC69DkN9LB4hNmm3kJfEcS+x7dc3cR4UiVfGpe7qkSTpW8rckX2wznUA3gzyy8qyF/gxmT+YxlHLAdH6DiMJdpi6q1XXpM9YKShuqJNjxiOe6c8Cqb+VtXnDU6XRf4peg73KYSrxEyUab02bH9ZQ4lY99AoidmAoAEw+PmBOf4H4LOjSQ6ep/I6lupz5IAW3YArEg+uUik8nTwNLIvB4W2kqwX0nmHzKbks2qbOx0aLlxsLO3DE9gYA3WUooR4Bu/Kzln1FEk43Baptj2sTYThDJ+GYBoW//8ZW0HfeyPR+TjGIwl1c/kiGmGTfw/wxcwMKd16jdR1ZoGaROfMtMFvGAqt/PbL59TQzs+fmVVZk3DQPuAGxgHSWxosWmkEWi46q8h44Se0wuMRwF2GljoQmYojTaDQlcQiBVIYQa/dKMSwTTYC1J92HlOT7eJL9/vy2W0Lhfa+wjCVG/TN+vf3NidAaUD2PnTRzkcCfiGHmHXs+F/Sjt1hA8CpBOKVL/UeaoozCxiMxzerMXnHRDTi61cB+RlmGgYuLc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0532840d-7ddc-4cf6-bdbb-08ddc9cdbd22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR10MB6261.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 09:46:03.9011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAeSsrsX7aVNM5OoRgzT5M+16kTj6xf9ExRZI/Zl5YI+uJFhBy8Omgl7deRjQ9iIJ0R7SxSeB5woxLHwBIwI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230081
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=6880af5f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=VXsP9fLcg-Zq9sDogxcA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13600
X-Proofpoint-ORIG-GUID: sheR3Bzl8gYJ0keZa9ZR14XHWT5yvZHB
X-Proofpoint-GUID: sheR3Bzl8gYJ0keZa9ZR14XHWT5yvZHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4MiBTYWx0ZWRfX8IVWNhZO9EwD
 ppCDXyQCRtKLgjzO3V+/SPaS9THFwL62ddUJ9X5suQd3iw+OozY85mALGqwTMFEa7mZZud3IsLx
 7GFUvfkPSpKtVN5wL3aV0SfoHpbHcicm7f2R+iSn4l864apK+H+WkOZz3kTOzpPgISygrfwraos
 GqNYX1AwzyC/G226tT/W8bGmJfhbm2UU/a0qtybP5YMRaor+Ko7KbyEMOjQUPUiEm+b2Afa/Lvk
 c3kcfF1hiS/skzVH62f4qhAF7UP75lCpHjrUITZpzTfwK1xsXok4fY/F8Sm/U+73oORfTbgkMGt
 d5TZYEX89tJ66N9jYox43ZUsIYUeRqAl2z1bJJhHnmGSdzVduMIJ5iexBYtyuAIdxrG95V+g96F
 23dFU5npTad1K4NzjsvXk6O8NRKm3U1ImjyMCAP2b5GtT4PnCAU8qQ3YFjAB1hhg7wetWupP

On 23/07/2025 06:11, Kris Van Hees wrote:
> Suggested-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> Suggested-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Tested-by: Alan Maguire <alan.maguire@oracle.com>

a few small things below regarding assertions as these are all positive
tests now I think (allowing /* after // etc), so the assertions need
updating, but aside from that looks great!

> ---
>  libdtrace/dt_lex.l                            | 11 ++++++++++-
>  test/unittest/lexer/tst.boc-in-line-comment.d | 16 ++++++++++++++++
>  test/unittest/lexer/tst.boc-in-line-comment.r |  5 +++++
>  test/unittest/lexer/tst.eoc-in-line-comment.d | 16 ++++++++++++++++
>  test/unittest/lexer/tst.eoc-in-line-comment.r |  5 +++++
>  test/unittest/lexer/tst.eof-in-line-comment.d | 16 ++++++++++++++++
>  test/unittest/lexer/tst.eof-in-line-comment.r |  5 +++++
>  test/unittest/lexer/tst.lc-in-line-comment.d  | 16 ++++++++++++++++
>  test/unittest/lexer/tst.lc-in-line-comment.r  |  5 +++++
>  test/unittest/lexer/tst.line-comment.d        | 16 ++++++++++++++++
>  test/unittest/lexer/tst.line-comment.r        |  5 +++++
>  11 files changed, 115 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.d
>  create mode 100644 test/unittest/lexer/tst.boc-in-line-comment.r
>  create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.d
>  create mode 100644 test/unittest/lexer/tst.eoc-in-line-comment.r
>  create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.d
>  create mode 100644 test/unittest/lexer/tst.eof-in-line-comment.r
>  create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.d
>  create mode 100644 test/unittest/lexer/tst.lc-in-line-comment.r
>  create mode 100644 test/unittest/lexer/tst.line-comment.d
>  create mode 100644 test/unittest/lexer/tst.line-comment.r
> 
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index 9d502912..e8f3bc8c 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -35,6 +35,7 @@ int yydebug;
>   * S2 - D program outer scope (probe specifiers and declarations)
>   * S3 - D control line parsing (i.e. after ^# is seen but before \n)
>   * S4 - D control line scan (locate control directives only and invoke S3)
> + * S5 - D line comments (i.e. skip everything until end of line)
>   * SIDENT - identifiers and comments only (after -> and .).  (We switch to
>   *          SIDENT only from state S0: changing this would require new code
>   *          to track the state to switch back to.)
> @@ -46,7 +47,7 @@ int yydebug;
>  %n 600		/* maximum states */
>  %option yylineno
>  
> -%s S0 S1 S2 S3 S4 SIDENT
> +%s S0 S1 S2 S3 S4 S5 SIDENT
>  
>  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
>  RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
> @@ -408,6 +409,11 @@ if (yypcb->pcb_token != 0) {
>  			BEGIN(S1);
>  		}
>  
> +<S0,S2,SIDENT>"//"	{
> +			yypcb->pcb_cstate = (YYSTATE);
> +			BEGIN(S5);
> +		}
> +
>  <S0>^{RGX_INTERP} |
>  <S2>^{RGX_INTERP} ;	/* discard any #! lines */
>  
> @@ -548,6 +554,9 @@ if (yypcb->pcb_token != 0) {
>  <S1>.|\n	; /* discard */
>  <S1><<EOF>>	yyerror("end-of-file encountered before matching */\n");
>  
> +<S5>\n		BEGIN(yypcb->pcb_cstate);
> +<S5>.		; /* discard */
> +
>  <S2>{RGX_PSPEC}	{
>  			/*
>  			 * S2 has an ambiguity because RGX_PSPEC includes '*'
> diff --git a/test/unittest/lexer/tst.boc-in-line-comment.d b/test/unittest/lexer/tst.boc-in-line-comment.d
> new file mode 100644
> index 00000000..61f5961f
> --- /dev/null
> +++ b/test/unittest/lexer/tst.boc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain begin-of-comment markers.
> + */

this needs to be updated I think? i.e. Like C, line comments can contain
begin-of-comment markers.

> +
> +// Comment /*
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/tst.boc-in-line-comment.r b/test/unittest/lexer/tst.boc-in-line-comment.r
> new file mode 100644
> index 00000000..d57f017a
> --- /dev/null
> +++ b/test/unittest/lexer/tst.boc-in-line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.boc-in-line-comment.d' matched 1 probe
> diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.d b/test/unittest/lexer/tst.eoc-in-line-comment.d
> new file mode 100644
> index 00000000..8fe2ff04
> --- /dev/null
> +++ b/test/unittest/lexer/tst.eoc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain end-of-comment markers.

same here.

> + */
> +
> +// Comment */
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/tst.eoc-in-line-comment.r b/test/unittest/lexer/tst.eoc-in-line-comment.r
> new file mode 100644
> index 00000000..884cd554
> --- /dev/null
> +++ b/test/unittest/lexer/tst.eoc-in-line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.eoc-in-line-comment.d' matched 1 probe
> diff --git a/test/unittest/lexer/tst.eof-in-line-comment.d b/test/unittest/lexer/tst.eof-in-line-comment.d
> new file mode 100644
> index 00000000..a9207693
> --- /dev/null
> +++ b/test/unittest/lexer/tst.eof-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: End-of-file in a line comment is an error.

again this doesn't seem like an error test?

> + */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +// Comment
> \ No newline at end of file
> diff --git a/test/unittest/lexer/tst.eof-in-line-comment.r b/test/unittest/lexer/tst.eof-in-line-comment.r
> new file mode 100644
> index 00000000..fdf259e0
> --- /dev/null
> +++ b/test/unittest/lexer/tst.eof-in-line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.eof-in-line-comment.d' matched 1 probe
> diff --git a/test/unittest/lexer/tst.lc-in-line-comment.d b/test/unittest/lexer/tst.lc-in-line-comment.d
> new file mode 100644
> index 00000000..0332e1ae
> --- /dev/null
> +++ b/test/unittest/lexer/tst.lc-in-line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Line comments cannot contain a line commens marker.

same here

> + */
> +
> +// Comment //
> +BEGIN
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/tst.lc-in-line-comment.r b/test/unittest/lexer/tst.lc-in-line-comment.r
> new file mode 100644
> index 00000000..3075b987
> --- /dev/null
> +++ b/test/unittest/lexer/tst.lc-in-line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.lc-in-line-comment.d' matched 1 probe
> diff --git a/test/unittest/lexer/tst.line-comment.d b/test/unittest/lexer/tst.line-comment.d
> new file mode 100644
> index 00000000..4deb66f4
> --- /dev/null
> +++ b/test/unittest/lexer/tst.line-comment.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: // comments are supported.
> + */
> +
> +// exit(1);
> +BEGIN // exit(1);
> +{ // exit(1);
> +	exit(0); // exit(1);
> +} // exit(1);
> diff --git a/test/unittest/lexer/tst.line-comment.r b/test/unittest/lexer/tst.line-comment.r
> new file mode 100644
> index 00000000..d4e4c325
> --- /dev/null
> +++ b/test/unittest/lexer/tst.line-comment.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/lexer/tst.line-comment.d' matched 1 probe

