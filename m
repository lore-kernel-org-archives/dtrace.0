Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACA9495E5
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718054638; cv=fail; b=tdPmr2cAja3JyKiGcaDQ9MtM3uuVUxclkpfMotMRk3fxJ6t4vqA1H71z2wAjiII46E+ePijaw1tjY1vUqIg/6OJ+Fc1dpgxtROW0AGBxQGS1WL1Mr29vq4sc8Vo/SNw21tqgnF2cAhdn1ekq+2pe47/WP320CDH69G8Ei39Djgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718054638; c=relaxed/simple;
	bh=nV2ivfAxkt4GmZvZ+25xxldGB3ohV0JUMokPszE1mC4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RbboaKR4EtuRjYcl3Y1G8Hf5OV0qM5N0/FVD3LazWWYh2Qd8yB17PsAYQIvuHeYAoYEiYgD6PXca097d62Z2qVH1zZJkn1GvkmIouH2wkC0nke6CZ+YSRqs5EB+XNTXuhyLYWOGCY7wIp0o9Tl5W3mNHBiJs6IIjwDILtg7Hd70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bI5zGwGo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YcDrbiwE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bI5zGwGo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YcDrbiwE"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEMSV6026670
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=8vH89KSsI1Yp95g3on1ZnFJtWA6JrCoGCcxSy+XHwlo=; b=
	bI5zGwGomK/rvcQ9cNfdenZovsbQZ1gphAahGUj2xr0rhqq8+TdO1xsiAJuwwS6t
	HTRd9JDIC4KYuZBCmMc6M0USub5N3L++zqefVtNzeq2yh4Uy/xwWWp+J7jDCIHq9
	oY/llbvEsoVUdNEr/27Uhhbif4nIePc2+ZLz/cykvMHGiosjhpUf/YqmrtuyLIRQ
	cX6vIhkaD2u4wBHAcfu4EREeMccsOp5TmcCRKW6YbP25JqfuBIxhn6CB+QvUFH2k
	TBabXE59TZRwHaXTWCs+a8GbfDwMdlBPrUqQdtJvU8wMH0GRyRie35KV+NRfZnfQ
	zjBiZVBFlxFfhK6V7pwO7w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhf1bjc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:23:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45AJqRpn014230
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:23:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yncet3quk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 21:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5FmuBKfKt+7s0EG5/gmwB3gzMIjl/RLTdFBD6gEpxF6h0jsX+x7KkC0FrStaRysN5ZInEjzeF5oDJtriTj/acVeeIbQCN+n64DFOxLauHj1CD8vW2ggXhFn5ykAp6of/eim0OSKsrxfcPJS2cn+7xS82Ar5ABVz75RS9aqqyiAKAnI5BXqGzOW16VrJPNCnDR/DIXiUmyMvRruPi17lKKyYVqADbjSsOPbrLB9KzLMOVU5NjoaFZp1velqbn5WP/I2YoJpbh0KQnehtgBqvNdCi/ORYEa66/ho8FcnMYS0dn6+POW7QP4XIl9sO3GSFVtrOKkOWJ0j7i8QauK2LwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vH89KSsI1Yp95g3on1ZnFJtWA6JrCoGCcxSy+XHwlo=;
 b=L8UQPyj0Z8gT0WCpYEhTBA39n4/xfefJwAC98xlQ1YZgSPdeZo3i12/d5D0h3cNSAGRIphEDV77ekgB7v1+X33fgwxhQswxG1MEuZWG2iFIl2jQZEkN8KAePBok91yN4jfffrYtngnhx3RtO7L99+hEwAXwHTYGP6gp9gsq/cOnJUdaWp1rcmbqkNoXt3eK7OIPYjqeHTbruA5TMBEngEOUdNAIDIkXG9f5kQRGg8JJW/V4CfT0ac6vIQ1llVWFX0vJL3Xz9eMe/hu/KPqFtjvn5veq4sBhIxlxIE44B7tvnV6U22ipEu4P3OEFN6e7Udfnz0EkQ2T5E3Eq8L4jngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vH89KSsI1Yp95g3on1ZnFJtWA6JrCoGCcxSy+XHwlo=;
 b=YcDrbiwEDWp6ewS5Z2NDumU8hReaEQIKdKSbBXSQmInnY37TzqHOM5OQCbFA+cNB9pAbVnn4ZbhDbdoaolXLklD7IRPBHhvw/u1PREj1Qp2OAA43vBsc111cZ4TrKG+8JdSqDY7h+ScUeezqlcCsrPLYH+fE7h3O33HyQcmwxAI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7190.namprd10.prod.outlook.com (2603:10b6:8:db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 21:23:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Mon, 10 Jun 2024
 21:23:50 +0000
Message-ID: <f6970d29-7a32-c9af-a30e-e00d53ccf037@oracle.com>
Date: Mon, 10 Jun 2024 17:23:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 04/14] Track uprobe provider descriptions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-5-eugene.loh@oracle.com> <Zl+CwFHv6bSJTNHw@oracle.com>
 <c1d70ac8-ee5f-4b1d-9e8c-75075b18db48@oracle.com>
 <ZmOG1p6wPx77nc2q@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZmOG1p6wPx77nc2q@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0052.namprd15.prod.outlook.com
 (2603:10b6:208:237::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 33da9974-5744-4c49-86c6-08dc89939f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cnRWdURMUVJTUHZkMXRES0s1SWh6cFd6a21DcjFWeStCMkF3T3BSUWRUWm9V?=
 =?utf-8?B?ME9GODVCRzRxWDRwMEQwSnk1NGxkWHdaaUo0KzJZOWNBTzBiOGdTT1EvT0l3?=
 =?utf-8?B?Z3k2QVJGL3hQbm1jRVA3ZDBLdlpIQkpUVW0zNGRWUkh4Y3RjTnorbXora2Vx?=
 =?utf-8?B?MjRDck5FY1ErV3k2bEN1N3pxMDFlSDJMMDdhNml0dFJVckRwNkRNRmZST2RD?=
 =?utf-8?B?dlk3L2lxMjZMTVlMQlVUSVhKZXFXS3JnbVBOeVpGYzJwK3FZaUFpSVM4WEpz?=
 =?utf-8?B?VUNXMHZFYXNHaW1CWFM1N2hmQzJvbTJxa3BFU0FGYmh0NUQ3a0hXNmlkd1ps?=
 =?utf-8?B?bHE3TlZ4akFuL25CaFc5SWdnUndrWDJNdkNBTXVVNWt1anN2Mi9hNVR2U1g0?=
 =?utf-8?B?bkp3bW5KcWZjT3J0RjB6VGlyRTdYR0lvenBZWEZick5uY0ZhWThEQ2xIcWtG?=
 =?utf-8?B?QWZRTzZWYTlRSzZGQldUUHh4S0VORXhuYkZYUTBleW9TRzhxRU9nVVJOMnpa?=
 =?utf-8?B?bHBJQ2lLbnkyWVpKdWxrZHFFZGRyWUM5WWRGcjhicSt3dVFuZFRqUXU5TFlG?=
 =?utf-8?B?VFlqYmtoTWw2bjZld3VUYW5CSUtkOVRsR3JkbWszaDJlbnJiWk0zWHVORGk1?=
 =?utf-8?B?MUtBODBVdWZodnpXdjQxZTljTGRiaXB6RngvL1krR1hpSFJSOXUxVVl2RkZ0?=
 =?utf-8?B?WUFDOCswV0xHU0hieDBhZ205bzNFVVNCVVZ1RWdLM0E3cUlIU3F3ZzAwamNF?=
 =?utf-8?B?VXRRRUFZbGE2S1BaNmZvQm5weWFNV0hJbEVQa0ZoNjNMV0l1a01sOUszbnUr?=
 =?utf-8?B?UlJTY01VSmYyM0tpMHB6NXBWSUpMWWxCc2pmMUNNNmZBR1ErUVFDTStvR2lr?=
 =?utf-8?B?MldoTjdWZW5ZRDJsc0Izclg0S21ZNVZkNzF2L1BqZm1qWUo5YjVlNXNKTkFQ?=
 =?utf-8?B?cnRuYTAzNlcyaXlaVGh2WitYbWNPVjlGWUtPemNhdlNWQmd0b0R3SmRCVDAx?=
 =?utf-8?B?c1duWnl5eGZtRWwyd2tOY3R3Qy9CaG9ZdW1OYU9KUFpZVzdFYmNqc1hod0g3?=
 =?utf-8?B?RDNaNGhFbm45TVFxZno0WXBlK3lrRHBBZ0ovOVhaZUl5OXI4MFoxdllFZStF?=
 =?utf-8?B?NGN0MlAwNElRcGxud1JYRHBGZUpxWXZSeUIxQys4anMxS29XaW8wRTc1aHo3?=
 =?utf-8?B?MnZBT2FpKzBndzJvYW14M2VBRVJHVmt1d0hJMXpDWXVkTlo0N21XZllsZlZm?=
 =?utf-8?B?WkNQRWZidWdKenJROVJaejNkS1p5MENFblE0QkY4NTJ6bGl6cGxrdk9MbFYz?=
 =?utf-8?B?QlAwZTFOMGxwSDhhUk4yZ2djaEdrbDRDZzllek9kOVZ5V1B2NzdudkVUVlBw?=
 =?utf-8?B?bENpTU51YklZKzByWUdBU1V0UkpvU1FaMDYwT0tKZitIYUZoSWhzYnNqUWxo?=
 =?utf-8?B?NUZsV2pJWUZ1OXc4WUdHRzRjSE9WSS9hM0Q1eEt2UHFrcERjR3FLakxxVStj?=
 =?utf-8?B?L1ZWSHJ3QlkxODFncUpqZXNJTHVBM1d1Y0Y4dE9HMVdNK0xHYk1qTWMydzN2?=
 =?utf-8?B?RCthR2laZHppK3FPdTBPbzhwNnFXcXp4QnpmeU1zTjBiNUpKKzJhLzZHY1lH?=
 =?utf-8?B?ZzJTMElRL1orWlJPMmhmK1I0dVZiaXlBNjRJOVpsUzlkUDJPNTAxSlBxZmJx?=
 =?utf-8?B?VGpVcExBd3E5YU81SVdqMlVWLzdtY2E0VDdUQWV2eXJqdEZxYjJLdmUxTHBz?=
 =?utf-8?Q?AvTHKSQ4UNQehbdwmI9m+QdNjiBUbUr+t9+nR1l?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkdPdys2NFVjZXJNRWM1RXdpOFo5TGN6cy9OOWVuaDBOREcxYjNYaVpheDJu?=
 =?utf-8?B?K3A5cW1PSkhOR24wbUwxL1g2VE8rdnVCS1NuQ0JucFFkVnhtS08wRkJrYUNZ?=
 =?utf-8?B?R1AvUTYzN0NUQlUrV05OMkdVKzhpY1l6UTE2by9KaUd3bUZXNUhQM0pZb1pa?=
 =?utf-8?B?R1IyYW9nbW8zY1RrakFndllsZ3hPL2Nic0tBV25YVWZvemJTd0VGMWc5a1ox?=
 =?utf-8?B?UklCZjlvRks2QVJmL1dsb0xCZGlNeTJjNElyZFZ1RFBHb1pRVVRSMVc5TXNV?=
 =?utf-8?B?MlBvUHMwYk4yT280eWY1dGRGYXdpcXd1UEorVjNnemh3eFRsOGQrUmFiTVpu?=
 =?utf-8?B?a29XN3V0SitCUFdDbkx6b1pzYTJvUDJzR0FGS2I2RHBGcEVFSVdmUGtHdXdP?=
 =?utf-8?B?TjRwN251T2t1WHBQU3dhQURPekE5SVZqL0JzVXVQVW0vWCtiMUYzdFY5Y0Jm?=
 =?utf-8?B?cVNOSjFUWjFCbTI4YndDN0d1bzNBZVUyRDBHT2ZEa1BRS2x0eDluQjByTEtj?=
 =?utf-8?B?cllENCthMEZ0US9VcnpXV2FhcUszMTBsQ1ZaUnlvcCtBa3I5UFZLcUNRb1Nj?=
 =?utf-8?B?MTVLT3lGK2t1YVo3RGJCcDVxTGZESXRaOGljNlpWVEREaWdETGdDRy80UVhh?=
 =?utf-8?B?TTMwb0Y1VFNQdHFiczhrbmt1ZjNhYnFGOUJoeUw0QVZpRzVsWEZZQm9HYVQw?=
 =?utf-8?B?UWU0bUhFS0Z1Y0NWTGtNaXQrNHVBS0tkcXNxR3cwZGZZVGxVZlhyaFhYWGZn?=
 =?utf-8?B?YWlkVVdHRVIzeTgxeFU3RTY5WStQNy9sTFlFaUdnRGlDcWVlSm96V1FxK3FM?=
 =?utf-8?B?WTFhN3lHYVFQalVxSkNZR3RJV25xVEFjNWoxMlVYRGZkQS9EYkkrRCtJUjNO?=
 =?utf-8?B?cDZtODZtWW02bC9ZTDBxS1JjTloyaExFNmZvQ2RiRGE3OHNMSko4ZHJBTTdU?=
 =?utf-8?B?ZEZEVlFYS3FWc2NoclFoSzBuT0FESVhSd2R3YTRvaTdjd3Uwa0NZaW5HRnRu?=
 =?utf-8?B?U3JIS0dlbk9VVkJJT3Y0RXNCQ1dwOFEranZtd1RlSnhWblJ4dkVpYVFjZTNC?=
 =?utf-8?B?YVNuTVl5OWhuOXpnSDczRmZiTEppV1lIajlCWmMwTENxMVNpS1UxRFhYTjNy?=
 =?utf-8?B?V1U2ZVZhVmNtQ1dRNmswdzRzRm80N2NnQ0JnZ1ViOERPSi9UaENhY0VFemxh?=
 =?utf-8?B?VXcxYmt3c0E0RFdDUC8yL2hvYUZ2ZGE2L1k2SUk5bWcyRlhlK2FJQU5wTnpq?=
 =?utf-8?B?VHlPT2d6dG5BeTBBZlVTV0RnaDFLNlhlVHZvd0gvSERaOGRDNk5BaFJqV2dq?=
 =?utf-8?B?UXZhREVtVW9TQVBDc3RYc2pWZGVydjVoSm5JVXBtb3g0dkQwamd6d0RyQXBv?=
 =?utf-8?B?Rm1XelBVT3VLRUwwQU00VEV5RVBzWG91eFJRd05udTcrWnpXTG1TcmRIRHRx?=
 =?utf-8?B?RW1YanU2bHhXMGNpc20vZWdzdE1XeEs1MS9ucGJSVUZOS2cyazViekt1QU1s?=
 =?utf-8?B?bmptV1hzZ29Yc1FtVVFCWVBIeDNqYi9xUTRpenBkaDkzZDYyYjNSelVmZGlh?=
 =?utf-8?B?cURILzlRWEI4MENvV282ZjJEaytHODRoQndSU3R6L3NuRnZpa2pia3hDUnh3?=
 =?utf-8?B?ZDBpd3ZNaWV0bk8rd1d1ZC84QUlWaXViWVh3V3lkQTBQazNmMnN0djdIK0xq?=
 =?utf-8?B?VUZqSFpqc3B5OTVqRTl1Zi9yakRBY0puSm9jSGRaTzRGck5GVkd0YXZsZWpF?=
 =?utf-8?B?MkVGalVaN1NGMDFrZmpVTHdTUDFtZ1FMNm9EVGg5TGxlYWdaUmd6eGVIL0s3?=
 =?utf-8?B?VlU4aUpVMkxxQUl5elZNNjg4Q0tKejVtUVRzWThMd2psWVhydnlnU1U1VWdO?=
 =?utf-8?B?cDJidlZZZmFCb2YzQjdld2lvNmoxVDl6U2tmTGIrZU9EeEdTQTJKTE9Dbmdk?=
 =?utf-8?B?dDBUemh0LzVFQTlhQWIvTVdNalRHQVd0Vnl1UlB4YlJSVzBVOFdoQ1I1S0d2?=
 =?utf-8?B?K1VxVzVpUHJITkZTenJwbFNiSDdCenVSajg5dzlwMEIwRitRbldPQnIyMGFm?=
 =?utf-8?B?MDlidG4vaVh1bzB1QUVsTXZyYUFwVzlJNTF6MmRYTWlHbi8rZnNEWm52TGlo?=
 =?utf-8?Q?/4rrvbVwumu8f1bcr1ydNrIDl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	i9GR5Kb5D4pAZdXBdWpFG/yUsQGOU/u8ahPUEC1WeSYbsG875mvSVCV2azZZXT/Bj+MLCjl/uyVWJrYJ7CIjRBwYO4pl+0Z0MI+B0L798CckSkBciQc3dGbz4focCSZPOfXFRLOv2b3QmaZqd7s+nKvOFp5v9vKBMzmVIgunROoyw4FjS9CT+vG1r47NB1XO6LvfnUu03N5jddX5rT4DqCqS8uQtYqagth9etJjFsToMYRqdMEbrA4ZXy+Dd2DwDjZjCRAmLKXHLZzkPLD05Z2QFM5G3HIWZbuV1HPnm4cJ1QtZjScjrtkBpfXA454SLdcn7xDefBdMlKLw+P5HvnNU1hqtycVMfT8iAivrQzsRuQSvNhAWZ2q8NWjvtpJpeaz7F4JjTA/GW1Nhc+DZisv9tP9phmlfAGvYtTve+f+gnbPyXorCUsvSGXxI6PGXCKP5YUnW3unOfMxFVQA/WW7wqE2gV7m4tx0SB7J1igkhrQDXVw0fu8b74VSotDakMzezUmRXq2gPLhX2WEXYNYEk8nJwAE/XRhTaKG4zHPtAeBybVHNhSZRE/s2UWL96UwxSyn5YAQXVGcycWTHjlieNA3PqW9dwnR364cEE4ZNQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33da9974-5744-4c49-86c6-08dc89939f63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 21:23:50.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/GsXUy5wCVl1s5a64I8YOBmCSStYG6XvuuNwW3YLh1RfQvbSuqYUlk6HhXZcFNWIq8qsiquQ7hkfHVgHy19Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7190
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100158
X-Proofpoint-ORIG-GUID: aN-Ll4rxARy4ETrw3-3U9HxWDhsfZ7Yt
X-Proofpoint-GUID: aN-Ll4rxARy4ETrw3-3U9HxWDhsfZ7Yt

On 6/7/24 18:16, Kris Van Hees wrote:

> On Fri, Jun 07, 2024 at 05:40:51PM -0400, Eugene Loh wrote:
>> On 6/4/24 17:10, Kris Van Hees wrote:
>>
>>> On Tue, Jun 04, 2024 at 02:11:03PM -0400, eugene.loh--- via DTrace-devel wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> A uprobe will have to decide which of its clauses to run for a
>>>> given pid.  For now, keep the provider description for each clause.
>>>> There are many shortcomings to the way this is done in this patch,
>>>> but it is quick and dirty and helps us bootstrap real support.
>>>> Clean this up later, probably turning it into a growable array.
>>> This is the wrong way to look at it, I think.  The underlying concept is that
>>> DTrace supports specifying probes that do not match anything yet (-Z).  Those
>>> are called retained enablings and they can exist for more than just uprobes.
>>> So this needs to be more generic.
>> Okay.  I looked at legacy-DTrace retained enablings.  They seem to be a
>> linked list -- (mainly) of arrays of dtrace_ecbdesc pointers. And
>> dtrace_ecbdesc has dtrace_probedesc, dtrace_preddesc, and dtrace_actdesc.
>> In DTrace on eBPF, dtrace_ecbdesc is much simpler -- it's really just a
>> dtrace_probedesc.  So it seems to me we could just make our retained
>> enablings be an array of probe desc pointers.  That would be a small change
>> to this (small) patch.
>>
>>> We also shouldn't do this non-discriminately for all clauses all the time.
>>> Obviously, when -Z is not used, there is no point in doing this because there
>>> cannot be a match-after-start.
>> FWIW, that's not how legacy DTrace seems to work:  there *can* be
>> match-after-start without -Z.  The -Z option only addresses whether there is
>> an initial match.  If there is, then -Z is not needed, not even for
>> subsequent matches to work.
> Yes, I didnt think of that.  But -Z is still relevant in view of the stuff I
> mention below...
>
>>> Even when -Z is specified, you might be able
>>> to determine whether the probe specification for a probe matches perfectly
>>> or whether it needs to be retained for match-after-start.
>> Maybe.  But what if you have pid1234:a.out:main:go, but pid 1234 has not yet
>> started up?  (Yes, that's an extremely weird example.)
> No, when a pid* probe is not able to be resolved, dtrace flags an error:
>
> $ sudo ./build/run-dtrace -n 'pid12:a.out:main:go,BEGIN { exit(0); }'
> dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12
> # sudo ./build/run-dtrace -Zn 'pid12:a.out:main:go,BEGIN { exit(0); }'
> dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12

Hmm, seems a little strange to me.  I do not understand why the pid 
provider should act like that.  With -Z, why not silently ignore probes 
that aren't legit or for pids that do not exist yet?  Anyhow, that's 
maybe not important to think about at this point.

>> Mostly (going back to your "shouldn't non-discriminately" comment), trying
>> to decide whether to keep a probe desc seems unnecessary. Just keep them
>> all.  They will likely be dwarfed by dtp->dt_probes[] anyhow.
> The issue is not space...  but any retained enabling would have to be
> re-evaluated everytime we need to see if there are new probes to be enabled.
> And this will be happening while we are already tracing, so avoiding needless
> matching is probably worth it.

Good point.  I suspect it is not yet important to identify all the 
retained enablings that do not need to be retained.  We can start the 
implementation with all of them.  As we think of cases where retained 
enablings do not have to be re-evaluated, we can teach the 
implementation later.

>>> So, let's put some thought into designing this in the more generic case, so
>>> that we can avoid going down a rabbit hole that gets tough to recover from.
>> What do you think of:
>>
>>      struct dtrace_hdl {
>>          [...]
>>          dt_list_t dt_enablings; /* list of (to be) enabled probes */
>> +       dtrace_probedesc_t **dt_retained;
>> +       int dt_nretained;
>> +       int dt_maxretained;
> I don't think you need both varoables.  Just keeping dt_retained_sz (which is
> your dt_maxretained, but made consistent with dt_probes_sz) is enough since
> you can know what the last entry is when looping over it by checking if the
> element is NULL.  There should never be gaps, so the first NULL indicates that
> you reached the end.

Good point.  I simply was mimicking legacy DTrace, but that's not necessary.

>>          struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id
>> */
>>          [...]
>>      }
>>
>>
>>> (And whatever we store the retained enablings in probably should be added to
>>>    dtrace_hdl_t after dt_enablings.)
>> No problem.
>>
>>>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>>>> @@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
>>>>    	 */
>>>>    	dt_cg(yypcb, cnp);
>>>>    	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
>>>> +	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
>>>>    	assert(yypcb->pcb_stmt == sdp);
>>>>    	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
>>>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>>>> @@ -310,6 +310,7 @@ struct dtrace_hdl {
>>>>    	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
>>>>    	ulong_t dt_gen;		/* compiler generation number */
>>>>    	uint_t dt_clause_nextid; /* next ID to use for programs */
>>>> +	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
>>>>    	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>>>>    	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>>>>    	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
