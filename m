Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA32627E9
	for <dtrace@lists.linux.dev>; Fri,  9 May 2025 04:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766764; cv=fail; b=lhRm6kH8bQK8GK5x/6T9a6jD8yPhpMFMyMSIabJucJGvmGsPL/5UyXuo7onBcap7VLsz1gh/JiXnwrn/4cspnTaUsxGKMpY7rcxKl0/nhbdKtpczahB465Nqw1k35/Ino2ammRRSJ+9zIjpncCcobWTncHjwsgfB0px5nh2l3Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766764; c=relaxed/simple;
	bh=HkQ8kL8hSxsVYAoZcH5XKMnZQ58ReTP3SmGkOppX5NA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k05yNoiQZlrtims5PksMZcHK8g5tgdGVZykIN9HnC6mbMc0S3lc65FvNmrcTJSAbBH4t+arMncxUUCI8/YQQ3itBqPjytaI6CuQ8/8RaP2IAX190cvHtR1EuxHPqgqMB873bmMMaZ9Y3wa8qgHPZt2uJzXDY8OQi8YNqGaRC7Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=alQTQ4MQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xmXA85zX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="alQTQ4MQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xmXA85zX"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5494HGaV031371;
	Fri, 9 May 2025 04:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ML0ZqCJkhHuJmynYQ6WiqvemWXY3g+mLHkqkiWtmKaw=; b=
	alQTQ4MQQaXwHsqm5EDPSU2cbWshnhi/01aYgvIM5tRSTbWtFnRN58lx0SX+vgKS
	N3PSd5PkMFJO3sw1P98mOhabbyWvPViK2F01HGzh6B7C2Lx4K1qg76jl0nQXT7/Y
	vuv10JmrWW6NYJ7pvFiQOh34KfAFrZQhJBEwBWi/aIO5XSdxDZVADKFOUO7npn58
	F8P/2DaNy1OQfDiLT+6brLGYxA1FrQ8wn1J2xbFq7yXrls78UyWAZAM2qx3YoyjG
	N2mWe3Gibh36ElcHrpbxKfV4kkA3Lqkhuj62S9GsKaU5A4wtcUnM2c0zsxozjU/H
	mrKdmx99QGp0vGzh8aIHfQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46hahtr16s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 04:59:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5493kdHD002667;
	Fri, 9 May 2025 04:59:12 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012054.outbound.protection.outlook.com [40.93.20.54])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46gmcckpbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 04:59:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzop3p+D0234wEyb0odQ1wesIDx26vpy0S6O9WmOuu709qwobh0Ji2w+1cI2wnCSqXrDlNZfora29QNYMgfP9n5E4VTDVrgxyNtpWPtupFQaFslOVDK1SocgXmSdLLLFqhigoBzRj8pwsj6SlseNFljuTP/N30F/f518l0JCGwFCX/r4iGw0wlFdwIIO+jNiddAJ8h9G+nTzrpV7IhY+1LINQWxdII0Bo/aMwu13mlLy8FRkRQQHeq9skvOQih5mS1EX+3XzrbM5Lr3zU85qYXzDjhJsOI/nWWT19wh2za0WuGRfqC0dvmd1Qv2H6S+SGnIFaZYXVAwvoTuPmKdF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML0ZqCJkhHuJmynYQ6WiqvemWXY3g+mLHkqkiWtmKaw=;
 b=nP/6ljQASHA3bqn0TqOsairEvlmzkqcghVIjsRJN+lJt3W+tm4ouRwA0SZLkdT/4qLqxpYUuFcIFxXT2Jz1/NbzSzHwHs+/zgbRotseSyzIrMqOWVhZs3N7NcAqT8pB9J2DNdVj+NahQtS9iQjNeoaCTqGtU51hJMkkaPqU5afKuFGRGUSQk+hZKiCD+6QAatU0/msxW3b/KLyjjP2bgltYSgkNtr1SSKgPZkSGJWQlKNT4E61A5npq0RzZPman4CL3slk0Ee8S++9xCf8fBQRkOkFQ5XO8cO6BAsIV122B/dVgYB6dY+bY1bIHnU4dGVeAA1Lgs1/Mxac6mkSZ/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML0ZqCJkhHuJmynYQ6WiqvemWXY3g+mLHkqkiWtmKaw=;
 b=xmXA85zX0W713yF4fKiJeZal2Tii+G48OTC7mKPC7VcUpCFqPU82GWtwZ/DbVel85djfEFkiHEACE0u76xcrJ9YpSqBTXpo6CY8Rotbxr2PFSxP668LFD+UHNSUXiv4Jw13vbo/65tuJKLY9gXsmrPhtIf9074LVMV2i1cMWTOE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 9 May
 2025 04:59:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Fri, 9 May 2025
 04:59:10 +0000
Message-ID: <f5e23dde-b868-5142-5487-7a34aef7e796@oracle.com>
Date: Fri, 9 May 2025 00:59:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
Content-Language: en-US
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
References: <cover.1737686990.git.sam@gentoo.org>
 <6df5a570b768a59808b2b197b9b5cdeaed426958.1737686990.git.sam@gentoo.org>
 <2c89d9e9-5844-d480-b268-6ba70bbfddd9@oracle.com> <87cyf57eib.fsf@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87cyf57eib.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:a03:60::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c6f701-8238-487c-01a1-08dd8eb63c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjZONGFZdkY1RFdyQ0JBOFJRd25LdGxzbEVieERIZFpLb0xJYkVuUytXTXhG?=
 =?utf-8?B?elNzNmZTQ1h1NFlIanNSN011TlJFOUt0RGIrTmd3VmxURk00TjR4eEw1NHRx?=
 =?utf-8?B?Z0dkN2J6QnVHTC9qMXhRTkFYMklUenRWVVdvTTdFUnZreXAwS0FnWXRxVFVx?=
 =?utf-8?B?YjFpcHYzNmxoaHJIL2ZMT1I3dFV6KzQwRTBpcmtDTHBDODE3c2VrOHNWVXlQ?=
 =?utf-8?B?YkhydXhML0VVQnFGSFUyKzhlaFByNTJZaUMreFU4RmxCVW1YbDNqMnptWEE0?=
 =?utf-8?B?NzF5S0xVYXJzaVB5UGRLcVJqRkZKQnNYVEhSV2s3OENEVzNabG8xR1RjTm9Z?=
 =?utf-8?B?QlBnN0xaUllha2NyWHkxZWV6Zmd5WFZMeklBMitxYjFPQ294b2dhSWNsUWVt?=
 =?utf-8?B?N3FvT3JEaFkwQUdyZkttNFRlUWV4ck9OYzdtemVybnpFWFV1emQzV2JhRm9o?=
 =?utf-8?B?cFpJS0NsNjhMa3poNU5POU0zemtTWHlKWEhNQUxJc3o1UlJKdUdhS2JHQ1NF?=
 =?utf-8?B?Y1Z5UmpxdmNpRi80aisyWGVSaVNITGp5UXM3bmFPYjVwTXBMQSt1TWF6MGNI?=
 =?utf-8?B?Tm9lOE9tNENRZWc0WXJqcm5OdnpSMStCU3BWR2U0MTJ1VzFudVA5bkduNlBa?=
 =?utf-8?B?YzhPMEdFcWk3bkVvMmlvSWpXUnZWUEZ2alRWbk5ubStaV0ltNm8yU3Q5US9D?=
 =?utf-8?B?d2lNSXJKcGkyTDlnQ1lHY29GcTRkUm82NCt4cFR1TjNKZUw4ZnNrRkVtTHNY?=
 =?utf-8?B?Q3RSUGM3aXhiMTYvSTlhNUY5SzI1WnNPcmdMU1gwTFNPa1FNY3ByNThLY1Ir?=
 =?utf-8?B?YXpzdVlsWTFlK241RlQ3VnYxZ0tDZHhST3lYcmtoMlB0L0tGZ1BDd3hpNUd5?=
 =?utf-8?B?ZWJwTWhyZHdpVVdOT1ZtOU5ZQ25OcUxCQ01YdXlEcmlMVGlNTkRZOUduTmhU?=
 =?utf-8?B?RDA4bUhKV3YveEVlcWdjcjZHL0ZhMjh5czJkeFJycUVTTERKcU42R3FwNkhk?=
 =?utf-8?B?U1doWVdvaE1OKzVRWHZOZ1Q3S1pYK0pEUjBxU0pSU0hFSk1jWHR1Z0VvNlhP?=
 =?utf-8?B?VGtvNElFYmRrVkxNUHZscW9ISW9yYmR1alhaRkhKQ1hhSHRFaFV1N2FKSmdT?=
 =?utf-8?B?Q0cxWm15cFE0MG5YVGlCTit3S0xHMUhiMmZzZVVFMmF4dnZyRFpZOGZwTUs5?=
 =?utf-8?B?MHhuSkpyTlVCbC9IOVRGS1BSdzFQeEUxcDlFLzBxUDBVOUkvWW5vNi9BbTE5?=
 =?utf-8?B?Z3ozTndkeHh4dUZBYVhPbC83SkF3U1IzN1dJaXI5SXVUMFNIbVVVNmh2NkVi?=
 =?utf-8?B?WVh6OHRHS2g2V0duYWhWQVVBdjl0MitjZUxKSnV1bjJ3a0ZIRWZsZ1hxRTJn?=
 =?utf-8?B?TFdpYm9Td1h3di8xdmtraWhaZFllaHBRR3N4MGZkN2FuYjFDL3BuM1hLUks2?=
 =?utf-8?B?TVFmWDBlZXdHVFpjRDdZNVdHWmtIRTkybXFCOExRTU0wdzF0eGE5RXpiQ3g3?=
 =?utf-8?B?ZWZEMzY4endqZ01KaTU5KzVmZzhzVFNWOGYzaCtUeDFqQ0FIL1ZmcWU4QUVN?=
 =?utf-8?B?dXFVQ2VzMUgwckxyRWFISnEycHVuOENsMlBadWNsZFhVQktIQ0g4aTZERUVt?=
 =?utf-8?B?VkpBMldjeUJJZ3NhSXNXeFZrUGRHQUdJalY0VWg5aWswQzFJdnQzOWxzL1N6?=
 =?utf-8?B?blBTY3pJdVIwN2pxL3QranlaandMRFZQUHF6amFVZzVoaFpkdGNiWVI2SzVr?=
 =?utf-8?B?NWUyRW80OTQ5L0ZvMHZyeG5mRUw3dzdUYXBHNHZreGV5K3JQYUtzdEQ2cmJC?=
 =?utf-8?B?eUR6a1pMT2dRS3lxTkRyWGlDeUdpcDkxejBLdm9XUDNxUldRQWt3UWgvcVZn?=
 =?utf-8?B?OXBMcW5uUnRJOS92WTBHK0VIMzgvdERwNW9sZlRQZWREajRkVGZhenJhMzFh?=
 =?utf-8?Q?Fo9bVsp6Bts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckduZ0RxeUlEK0lnOFpnSGY0WklwTGlybEJvOCsvaUJDakRUTGNIZ3dKU1h2?=
 =?utf-8?B?UzhYZ043bytpUlFJZk5Xemt6TG5rNUlnd1d3TG1ob1Q2VTBuTDRCZ3dyaVM2?=
 =?utf-8?B?Q1ArWHo1ZlRnS0plNHN1VU44Z05vSWYxcHpid0t4alBOZkVxWHR3Y2dzMFBV?=
 =?utf-8?B?TGsxSkl1OCtnQnl2WkpMQTgwWXpvMlpDYzFjNWRteWhTTEhPb0xtTlVNY1U0?=
 =?utf-8?B?UVQ1RFRnTUxwbjEyN3BGRHNBYmdKSVRrRGk5b3YzUWFYeGppZVQwYlJHRk1z?=
 =?utf-8?B?NmFxMHRrNGFQVGNMT2dLS21TZ1JKT1NrbkJCYURwR1hLN0JaMUtiU1lVTEM3?=
 =?utf-8?B?SXFjYUNzckQ1UytTYldSUU9QVElBb21wZEtyemlOTVdVWTk5RjZWTXh6ZEhy?=
 =?utf-8?B?Q1p6NUFkRU5lTDdpaUVjam5vQ09XNnViTDJLbE9DNHFxNUtoQnJDdE0rcWhK?=
 =?utf-8?B?djcwYUFmb0ZkWWdCMW04dEhVcXRPR08xZW95R3VwaHkzMS9UbkU0QkxhNDcx?=
 =?utf-8?B?ZE83aXdneEhuckllN1I3Y25uSkFaSHJ6RVRMbTcvQW9meWlnZ3NHc3VDZWxP?=
 =?utf-8?B?OWVKY1ZWb05wZ0JkY2FkVDhwdFcrelp3QW9vWStRNFpxSDhFVStmODE3NzJN?=
 =?utf-8?B?ZXZFdVZiK29DblVGZys2d01QaFF3ajBrajBGaVpsaDNqaHZDeVZjcndYMTYx?=
 =?utf-8?B?QW4xQjlkZ0NzSTAxMWpmUEdsUnk0ODBWNlVQbjNIL0FidSsxN05RaUpjdHE3?=
 =?utf-8?B?b2VlTlBPMEdMQ2ovLzBKUGtVQWlHV3ZSRVprQjBRc3pBNUR2ajJ0UGsyUldR?=
 =?utf-8?B?dmRGbzVHQzAyYWhiY0YrUStDSWVXVWY4SWJjSUVNWE1OVXJJdkhEMUlhQ1Bz?=
 =?utf-8?B?QjBmM1JRWUtybWVRMlpzb2ZwVlNJYk5xV2V4bWkzKys4WXphWVlWQXBYdEdE?=
 =?utf-8?B?MUhPRG5rbXBzS1lKaVBDd20xU25KbzBBcEVpZjgvaGp3OENUNGNvWnZHa2Rz?=
 =?utf-8?B?aWJCM0lHK0I3NWNNYXJzVGJwMlNJZzZmRSsydEVZekRsbjZmTk1yWGlrOCs5?=
 =?utf-8?B?TFJscEVlRWoraEVmZ1pZR0wyS1lwN0FZS2hRWFg2bHdadVVnaFE1UEVhanAx?=
 =?utf-8?B?dE5xT1dQNUMxMlRndlY0WVJJVnppY3RUZUFGSkprbkQ0TnZ3ZXR1SXpZMEVW?=
 =?utf-8?B?dzZPTkhDZWYwdW02SlJXM1MrTkhvOGp0ZlhJeUc1RTl2dytNODB4UENIVTlk?=
 =?utf-8?B?anhUa0YyQldjM3JiTVNDdHgwMUVvbEl1NFVwZTgyWTVvSWFRU3F4Zzg1L1ZD?=
 =?utf-8?B?RW5YbDZ1am96NllNdC9CVytYYk9SSkdFdmFxaENqM20vUlB5UHlTNFBFd0FZ?=
 =?utf-8?B?ZXRyQk1tdXFZZmNScFJjQVpQd3liMHhLUGd3emZlUWVmRVFiMmxnZkpOKzRB?=
 =?utf-8?B?VUxPNi91cFd3U2RmV21xeUVPYUlTRlRsbnFIdFA5M0djRmttQVJ3Y1NxMzBi?=
 =?utf-8?B?SlpNcTQzS0o1NmhleFhIbW5GMEk1Zm5MVnAzdTNGRFNSYnJER3N4OU91Zlo4?=
 =?utf-8?B?SmdBLzN1UmRlVlpIUXVWemprajB3Y2ViNFZMTXpBSENpd3k1VE9IL29HRUk3?=
 =?utf-8?B?SkpJaFJLeFhOMnVLeVkzd2J0UzJSQ1FmMXp2OGpLd1dqWDZTbkxVWFBpckhl?=
 =?utf-8?B?UHdvYTliTnFXcXpoSHQvTFFGQVpBczQ0cjQ1aHBZMmFxcUZjbzJaQ0htZyt2?=
 =?utf-8?B?Q1dwZHlTQWZrRzZ6NlNrMnk1cnlKSUJnd0N4YkVSOWF4b09sVkVHRVMrczVv?=
 =?utf-8?B?Qi83ZzNBKzYvekl6UEZaWko2YU1TTVBnRlVFMXdJeWI3M01yTkRTNmgwd2Nm?=
 =?utf-8?B?R1JkU3VneStJUkp6NTdoTWd2cDdQdVBpenJZd2ttWkNkSHB6Y2Q0S2V2NEhr?=
 =?utf-8?B?VlloNFlZb2hjTmhwcmU3Q3ZxWHZpWlRrU1BxWEU4VHBjVmJpWHRmNC90YTVm?=
 =?utf-8?B?SjBrUVV3aklBS1Jxa0lhWjlzZHVCdTlET2FvY2dFb0N2c09hOElmUmFjeU9X?=
 =?utf-8?B?Mktvd2dEdVJtUVl6ZTloZEtCeEN3ZlhrazFuT1ZyTmVFUTliTTkrYUdoSkE1?=
 =?utf-8?Q?cgRihm3g1Gz1FGNQNYwCrmbLn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mHGxcNCzeDRd9j9/aTknbo+LTcz0nCLVEyGnHANH4sfAQKYfB7Vini24qhQ38nl+PrjcNNJClfSLkHdCnMWCYjLp7FMjYEWRGeXhMUA6bA/ot2KnrBHPl6k5Ptqq5jv+hZylS8qT/n6eSiPl0Xd6qjZXBjx0BhVOafdJSv4i29JbiZVT2DbU13WN/IWhQctF2sqqzOV38BB6z21A7mbWjm5ezXz9sEJJwCQP1cGcj1mxzhXH4f6KIrUNTNog93EEflVNBh/e1XoexXU0UwmcNi/z58cj/UeoXmk5jtrlEfnWBioge7+g8d6o44DV68epheP2meNpInchJvDWTqMRWt/mmB4d1C1pc22LnYNglW4oRxkUC8Nc4W7gKt610PEIQGLHug52TF9PmBzDKm7EMOzfzIUud3Q8zAUlVOpFUOUMR/q+Fc9Jrd7qLohp1o7JgvjrS1jmCrW2Sn5gYbgZ1469Bz/K45VfMOddSWIzzocUKFA4mxTr72wyoHgkTytbaouUv/j9aEqhxNTTd75EupuJCCMYE/qOLYVM/YvWl7ALzH3bPTWoR2mgNphC1ZD3ykkSUwoiMIsblZ6f6mdx0naIYN6KCAe6ehsEXms+h7g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c6f701-8238-487c-01a1-08dd8eb63c5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:59:10.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cygVeMUzP987j/dXNbIwHv2ZTaMCHgx9qVZ3AKrToJimBAXjaEhdEgXIF3Ixq6Cski0UaSZ+eKZISxwQQdz8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505090046
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA0NSBTYWx0ZWRfX3vVDWNRthhqD Qwk11871J7LbaFp2HOSflylL4amG6twYbp8ya2ANbQ/aTM540TgVkasA6StRzVH1Ff+tZlMdVy3 ZYyNwWHJXrh2tX1EWGS0Guk3CK6RzTyrbErHIXxZMynLzrMwMt/DxEc8e0v/RMw+9UktrUtg/7q
 7f3IcGKKxmVvyy5yB/G8lgAj3Rg6UW6VkKJJAnheI+z8q4R2Xds1Nn7C47DaIqXvOjB3+TV1I4X 1dq4uBd1QewH9cqC8IieqWWAeu1IvnUVJPO08N0r+OAuIRthgyhoorFE9L+EUn2+IM43YU8Vmkj qPexhCGD0XrNB/Vahz5b4juxfLX1n7pg8qmOmKF5V68cq13x/zbbZNh2cU6TJwa56tsFYvCpNBY
 D+TNTy0u3vufOHvp5Qrqkz8Sybz9p3KqRhDzlgGDht4P9alWQhqoSVQcfpWjhMvHhSPour/9
X-Proofpoint-GUID: 7yR2bx71aGylccgN8NtkGmZYkqWWBKX0
X-Proofpoint-ORIG-GUID: 7yR2bx71aGylccgN8NtkGmZYkqWWBKX0
X-Authority-Analysis: v=2.4 cv=F7ZXdrhN c=1 sm=1 tr=0 ts=681d8ba1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PHZwnFzNXjS4XuvObAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13186

I went ahead and rebased the patch on origin/dev, incorporated my 
suggestions, and ran the test suite to check things out.  I'll post a v2 
of the patch momentarily.  I hope that's okay.  I don't mean to step on 
your toes, but the patch has so many little changes that it'd be nice to 
get these changes made and then adhere to the new practice.

On 2/25/25 19:09, Sam James wrote:
> Eugene Loh <eugene.loh@oracle.com> writes:
>
>> I'm open to signing off on this patch, but I have some questions:
> Thanks for the reviews. I'm just replying to let you know it may be a
> little while before I can handle answering & respinning.
>
>> [...]
> sam
>
