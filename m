Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436C622D795
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148391; cv=fail; b=ZC1t5Iuopd3y1inxzXxohqNS4aJUDaTSIcz3OvKEzn6Zzmcv/XKm1lXXmvrpZiiN4hyN9TPh9i1WV+uPudzxAFFCsTmZdv6jbtndA5/YP2Px2JV0unqRfq508I1tc+Yj6aG6XSOVJ7l+sxbpy48NX9PBcOWUEY87MN/qzVfP6Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148391; c=relaxed/simple;
	bh=ikzxHHh7mWIPArnHnDGBhHm2p6L1RsB9ULgF6ilYcL0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M9CrLGDCsh/dK6wKj1ZmbKEzVPQCHiiHthrW8ZEQQCsaRJ8LE17/t8zWJwVU2bUidEg2ha/OO1kOrfbaW/IlVWJGZxgzvmDEVKzktGTujGo1F/wZPW+oHZzCGnyZg5BCgwKRqgN5WfNR/o99AuOcTSTWgAgaOuudmRHqLC8GPMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YnBmHMCC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FnJt/3tx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YnBmHMCC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FnJt/3tx"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuFU3318465
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 19:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=XWzpjQVLpjEIRF8d13neVui8GFazFOh9CGGwMDjXBpk=; b=
	YnBmHMCCDImgkEY5peon+NYi0pUFvahphcMgfDYSB6tMKnrRcMO5bGaNvFWlytxG
	PrvZWwZLHJgvUO74KZqdtJRy5CyKS3t94Ej+nCdKc+zXyAWA/SLZ7Gh5NLwr0cW2
	TGKNYANAKn1Oj80B6t24f7TNMuwgakfCEnxB++QnItv/a7ipPeOSb46BSCDY/C7M
	zgpIb0sRsZ2C41qdfl/CrgwqZMHJR9taPGrPF4B+LdcPXif5R4/3gWoD2jzUvlpp
	937e5Xb9PEyGvHsiPTqIQwrya7j59ja77gRvPhnQwxlgOpVTluA7qM3cq26Z+DVy
	Jx8LDo7asKLGE7Q/SyRBRg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7ugj1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 19:53:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613JGRS4025793
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 19:53:07 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186ab0r5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 19:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrQby9SDGpiFj3FMdJNJ/aNf1T2VsHbDTOEgNTNCGvzVY8Q/ioVWXVrUrtHn3WLWdUdEsTOg/TQKecsaoOBFTff5jNJciGqGzLltFMQt9RlUJ6AE1tMwKGK3PH6dCQ7CeyfZdIO3MB1FouWEGJ5cB9NChJiaLZRtcUzHiHXFaXhMpAdhCLZMb7E5bGKKmgL6L40kCns17V6fnpvhGo0UCLQCd54iPkADxYaXF48r0G1D16pdvVFmE283sWb1Be+IqvXde22qthDYXc/HKcTJCDbJWu9CDQ08T9HE53Ru1R+dr1Nfs42ZIAewfyERgghSRBl4/7L8PsCojPAZmkwbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWzpjQVLpjEIRF8d13neVui8GFazFOh9CGGwMDjXBpk=;
 b=FA7bBHv+onsicNuTFro8uhDrJP9TNFAF4sqDguZWkSG28hFn9+KPSJbcX/uw8AaJzU3hduz2J8z7lssDoqx4Pqk7qb+0DuXbtrjkIMTdqoOJvt1BV2qj2x+ihzi/vMmVKfVaVPRdXdBwiuXvEeOQyI/InBNm9QVOeHQh8HfXm8EviS66xFXu/pZ5Tbw5Bxe0pLVYvWP/ZjL3jYHp3cCbUVAEGenMPy4V3cXXypZFId4OqdnjPyOfANMKi0Ub+HoMfRN+kgilseONxQdqKfsmz/Cgu2OjgNRlR2pXrml7zmKov08qE/Qc0mQ5ZoUqhZ+iIsahyj9TeHE4yM0JUvwLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWzpjQVLpjEIRF8d13neVui8GFazFOh9CGGwMDjXBpk=;
 b=FnJt/3txbKK5XoTAj1cz1c6Y+Ad3ur90es3IhhXvEk49fzoV2AWl+sMYgJJKiDP7+UcQTKkgrjRGQh5b0GgXZ2QH9GdxqqetEoACwliloEYQbuoPOOBiL8MKjVrblF6YYSSYlf47+Md+EbwzQ+zfwNniAng5tJYdv2QCvAUkhBw=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by LV8PR10MB7990.namprd10.prod.outlook.com (2603:10b6:408:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:53:04 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 19:53:04 +0000
Message-ID: <e3696840-024a-9a83-7baf-bf3b3a4faeda@oracle.com>
Date: Tue, 3 Feb 2026 14:53:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] syscall: fix syscall probe argument
 handling
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522673147BF87561EFF9A68C29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522673147BF87561EFF9A68C29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|LV8PR10MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b11155-2100-4d53-05a1-08de635dd7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDRZZTZLMVYrUktoRE1SOC9zMWxmcW5YRThnblkyNEJDRW5tdU1ibzZJWTlp?=
 =?utf-8?B?Rldjb0Y4ZWYyRExDYllHd0xFdUExc3ArUnJsUHhRUXZPbFJJcldkVktSTHl5?=
 =?utf-8?B?UzcySXNqMHJSN2lsR3QzWlFUa3lSZnhmSWNLcVBKYnhyOUxLbElsckhpaXg3?=
 =?utf-8?B?TWQvS29lRVJhL1BZbkx4V1pvTXljY1BFMGZCRFhGQWlNVXJ5djVZVkpzaHhs?=
 =?utf-8?B?Q1FTdXdtalRjWlUyT3JEY3QvMmx3em5IQXBLYy8vZlVZbk93OE1WMWM2Ri9i?=
 =?utf-8?B?Zk1sUHVrT0JsMmErR2NNdEx3cHlLK0kwZDJMNHdZSXRJdnpOYW5ZL1RmMFlJ?=
 =?utf-8?B?UnFnejhMcFJsZnFHSHZLaHpPVGIrMVFMYVBLTnFJS1lGVFB4Skc4aTNZT2FP?=
 =?utf-8?B?dStta1FoMHVEYS9BaHFCK29LcktnOVpTcGhHMEJraG5PMVVNV3FNMHBrVHU5?=
 =?utf-8?B?V1VmSC9ZbE1yTmRLR2R4WlZUQ2NSMDdybU1TZHhHUlF0a1ZhK0oxejhRREhM?=
 =?utf-8?B?V2ZNNis1anlZeUNUR2hhNnVWWUhoenNnY2FKZXIvOVV2di9xa3NGZHBxaDR5?=
 =?utf-8?B?N3RWSmZvSGYxMTNwRFhBS0FzcXdENmxoQjlwV2lJT0JGdDJMQ2U3SjZBalZu?=
 =?utf-8?B?M1pqSHZVN0FSRlZkbkxBLzF5L3RjSC8wcjRuYzArajdUZE1vY09KdzFNSkl3?=
 =?utf-8?B?THdOVmRTUzJwaC9qUkxpM3JhVGN4emdFNk5hZUl5S1ByVmM2RU83eUNSRVdz?=
 =?utf-8?B?VnJGMWlNNUZDcmRlbkh1NmR2aXVUTDNZWk9HaGFzWWJYUWFwSlFGcEgrTmsw?=
 =?utf-8?B?Qm5HVUlOMWFlRnJOWFo4Sk1taGlrYUd3NEZlQXE3SW1vNElZeVNuK2NNaEhR?=
 =?utf-8?B?OWVHSDhma01aeXIvSjJwMTg0cEVIM3pxdnBTWDgzSFJFdjV6TUkwcWpLU2Fk?=
 =?utf-8?B?YnNYekVSN3N4QXRkWTAzZm5qQnBKNDBjQnhQN0UwYWJ4OTdkcVhQZGF2Q0JL?=
 =?utf-8?B?YjYreXRISFdLRGFVM3JrY0tmYVhJNFRRazNuTnE3Sk9sNmhOdTNBUjNwc2Ji?=
 =?utf-8?B?cHI3QXk5YTRjWFZiTFc4TU9ZL3dJTWYwZjgrNjZoU1BzcmRMNzdYT2RXZkNR?=
 =?utf-8?B?ampWMDJnSGlHcDJpUmJOVm9QV0RZa3p5MlR5VGp3MjlhSkU5T0t1a1NaRUpi?=
 =?utf-8?B?RFZNcG1CZlk3YU90WlJWZVpHTS9ndzBkOHBlZEdFa2htWC9KNk1CNVpIanhW?=
 =?utf-8?B?SGp0KzVtSWw0SHBSSXhsK2orVFdsWWkzdHpkOWQ1QjZuYi9nR2J0Ri9HQkZq?=
 =?utf-8?B?UXFVSXZSWXNyK21STURVK1pZMDBNTHloOVVaYUErUnYzZHRrMDdrM05TVzJT?=
 =?utf-8?B?Y1BLOXNaODZDQkRJZTFJQi82WUdIeU1Kc3kwUWNwaWMrWWlZUlN3TFNWa1lD?=
 =?utf-8?B?b0YzQmR6b3lPekc3ZzNhd2xnQkNaSHVIRjlEK3FKd0xRMTIvdW0yWlMvQ0hi?=
 =?utf-8?B?SS8yeXkrMmpaYStJelNTb0kydDg1eWFwZVdMWDdJMytQTElhNUQ4U1dsZG1J?=
 =?utf-8?B?QXp2bUtRbWFCdDVFNWJPY2tCNFlJQVBqNU5WS3JSb3ZhZVVaa0tLNlJ2QjJF?=
 =?utf-8?B?ckhGV1IvcEpkK2Q5V2s4L1V0R1prVldCcm1OT3I0RGJLbU41Q2dDOFBsbW0r?=
 =?utf-8?B?UTNYcFpRWi9LUVVzdDl1UDZhK21EdTV3YUtXeExsNGpYV24vZVBPalk5Mkcz?=
 =?utf-8?B?RHEvZnNHWnVsRVVubVZpRHNpOVFzSlY3ZmNPMG14aHFReGtQbWlPaXBFT0Ru?=
 =?utf-8?B?MEtjTzluVEkwY01yc2x5cU9tblh3aGt4QTYrdTRzMS81TU1rNFJ0SEFxRDJv?=
 =?utf-8?B?L3JxUkNpR0pMSTlMamRtR0c3TC9JcnlSb3EzZ1E1VWc4TStIUSt4Tk9PSzZW?=
 =?utf-8?B?WllUUGZaR1RBSzM4bTNaVmVJOFQySVg4REc2QnN2WEhUQmdoL3l5OEIxYS9i?=
 =?utf-8?B?KzBxd05JK2tsMzAzVGYxM2VNY0wzSXViQ0NwT2lPV2pLOTlQSHd1ZlM4cXgv?=
 =?utf-8?B?V2YrUmdpZUg1YnEzcTNzYTdOaEgrSmg2M1hNbTBtRTJxUmZ3bk5PM0NFemc2?=
 =?utf-8?Q?HZPc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0MyRXBrRGRYc2Z6dVl5dkZnbVJscHZlTHJ2M3ExU1ZzYnFVUkg2ckZOc3V5?=
 =?utf-8?B?YnozcWdhbW5FQk55RDZMZ00yYUxJd0pCRlJkd1Q0VlpYZDdmS0ZVUzkyb0ZL?=
 =?utf-8?B?blpTV3dzT3dyK3BIaHppN0R1bWxoK2RzRkZub2R4NGYwczM5dEE3bmtjVHpp?=
 =?utf-8?B?a3BIMXhNakc1TStZMW1Pd3NCRWZmOW04WVI2TXNRM2tZdXR5Y1hrUTdEQkVR?=
 =?utf-8?B?b2U3TUt6dm1sRzBIcGpxaVJjcVhJSDdJYXdSMW9zOHM3S0dJdk1Vd1JndDlv?=
 =?utf-8?B?VUxQS2JSbFJhNGJjVUpSUGI5SklaZWdBUTVSOUdqZzdhWmJzVVBXUEJPOTQz?=
 =?utf-8?B?ZlNWcG51RTNOTDQxZXorTEl1ZmdNVlBJQUgyNjU1cm1SVHBZbmhYU1laZEFa?=
 =?utf-8?B?eW9IRjhXZWRTTGRPY3VURC9TVEVra25YMnc0NXRLMms4aUdOUXY0Mk9VVVZZ?=
 =?utf-8?B?N0pRSnFYK0dIZGx1U0x6bHNXSk9rNVRHRmJRMkdiR0c5dXUrQjQ4bHRHWllq?=
 =?utf-8?B?MXhMbHdvK3d2NXduQVNlOU5DNDRwbkFZMFpPcVhSNFBaelhTRzVqdkVCcW4y?=
 =?utf-8?B?WTcxMURyVU8zV3lGQU1oeDhrV1BMUzRjVE9aaW53bVpFaGFZd05oM0tRaUEx?=
 =?utf-8?B?Vzhxa0RWNEJXM3RGUGdUQk1oTDdsaXNSMVNhUUpoVEpJbzRKbFhoTXhDcVNJ?=
 =?utf-8?B?dzRyUm9KK0MyNDlzUnRzQ3RSaGFrVHYyRjBwRkR4T2J5NzZBMVJSZXhZU1B3?=
 =?utf-8?B?Q2NnUlAxTHJCK2IxbEhjR1RmZVUvNFJOMlVjMXVTbUNOeEY2NDZhS3N1MkxW?=
 =?utf-8?B?RnVKQTVIaG1abUxuOGtRMWFkTG0wMUhrbjg3VHU3THFybk9hTkF4R3Ezdzh0?=
 =?utf-8?B?eUlEeHduRnlYdTJ0NU5rUUFSRkNsQk8ySXZ0R2JXNHZJR2N6RjUxOGlNS1NV?=
 =?utf-8?B?TU9UVHBseDBuc2w5bWNNZHAwRW9ERStmRG9NK2F0Z3ljUThRWlQ3b0ozcHVQ?=
 =?utf-8?B?dmI0a2c3aEdFbTBKTEg4UHlyNThmZ2o0R0d5WTFieFdtcytUMmRmMFh1d3BR?=
 =?utf-8?B?Y2t1cjlteGhlc0IrRXlGNmEvRVdYcE9MTGw0T0VPdWwzSmRDd05MUVZER3Ar?=
 =?utf-8?B?UXZrL2VXbVhnSFBnV2RSZ1JHWmJnVmZNME1jem92b2gyTEwxMndsOGRoMk4z?=
 =?utf-8?B?MjNQMjVIWmM0TFl1MDZOQnVsdkJvWU5FdlRiQWsvNkZzbUovZklTYVZmY1Q3?=
 =?utf-8?B?c0oySFQ4eHFSdWFjQ3ppM2JQOGorU0JXa2ViSVNxTVA5UjY5cmtTaXRxeDBp?=
 =?utf-8?B?N0wrNFBicThRaGhWT3RNQ3ZaaFNtYnlOWUY3cXBNa3dKZE5HZVZjdXZMUXFF?=
 =?utf-8?B?VHhGY1E4b3ZyZmUvb3ZYYVUvSWhmbEhZMEdyM3BsSUc1cUdKRjhtaGp0VUd6?=
 =?utf-8?B?WDFTbi9GZGg4WUJZdFdQMlFISVc1anpDOHI2TS9JYnpoRTJRekJydXJLbzRu?=
 =?utf-8?B?UEFpOG94TERDbEhiR3JoWXNBOWlUVnQzMWZVVkkwcHM1bU51M0FCWnR5UFlX?=
 =?utf-8?B?WjdQelkzbnBCZm1kR2xsV25kUHdZeTM1M29vNGc5ZTNiMnYrVFZUbk9yVGsv?=
 =?utf-8?B?ZXlpc0FwL2FoZlFTS3gxYlVWYzI1RXdyZEU1WS9UR3pkby93SXlFaWpKdFpi?=
 =?utf-8?B?T3RzQWY2MHBEQUxLM01hbEJrTitsZDJXU3JBOUxRalZvS0FZWlZ4MSsvY1JX?=
 =?utf-8?B?a2llVnFYUjFpbi80Q3A1TkhKL2V5VGsxVDh5YktNRmo2bHVqSzNONzQvRVk4?=
 =?utf-8?B?NDEyUWo4RFNqc1RtbGJvZjBHeUkvWThsNDBET2NTOXZMdEtaOWdLSi84Qnln?=
 =?utf-8?B?VElHTTJFbDZXVTY4dDBoTStJSDJhZTJraHI0T2RLenhjTHJiUEJqNmhWQUVI?=
 =?utf-8?B?bFArZ3lxUCs0c28yVG5qNDhZN2NTWXFDaGc1WE1kUkk2d3E5dmVrMEJaNHRP?=
 =?utf-8?B?M0FocGxYL3pNTUdTS2RuYUtRK29tR21COUh0NmtRc1g3Sk0yeFlZeTVyYnZq?=
 =?utf-8?B?SnZ6ckEvRTRJWCtHcWpkU2lhejhUZDVzZHZFWlZpbTlKYTdWN21MWkt0MXZP?=
 =?utf-8?B?b2JPaG5MakxjckY4UUpPQlRJVC9jc053V3NvWTFwclhvK0MrWmJQUTRMOCtX?=
 =?utf-8?B?L2xIUHVkZnFDOGZneFQ4MnVZT3Vzd2NhNHErVkp5QVlEeUlkTlpBOTV3c3VX?=
 =?utf-8?B?OFEzWjR5dVZqRUNnZUNFYmxvY3dVaXUrakR0ZUVhNEM4Rk11bzJHN0E1dXYy?=
 =?utf-8?B?TW1BQmpJQmFZdCtac0VlSkVIWjJMR3hGWUI5OXdzMkNiQ2FyUzBkdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vr0DGA6bl8lFonR9F3DNyVcmgzK4hfAWT0dEjjjRDTxgm8FkK27cJPYt+hnhnLQvzwPe3IZF3Oaccha8UCdGCC1S3Nl5UMdBEDqXcvylvPUcXtPmDc24aRrwTpKlLotbZaUe5R6jUexlB0Woaf91g7mSETIBKo70NhTDwoMFWx4EaxdwNmc5T7M/itXZPnE8mE6wswGVU7qEhd+t441HXL3iKcqbqzkso+MaRd0/xifv6xkKIn1rJnEc7RtxAv3lAVcX1vik4x4KkgivrxuY2qpM45ly4tSF2Pk+HGGnwbI7foxCpW7yBiGYcBBrNOtiWO6Y/BEKM7A95uWV6iR+qy+Hr7aqL3E8UTpBvWEH+WPt8qj25gdqpAOroUKo78mbCf5tD63VYA/in9d1UuNpMi+di/ibd+FoYE0zA//jiW/ymRENasnftY8BM5C4EnjZs/mi3xv68q4du3kfTEMelSmOv0YZswUHkVhTlfK0b/5qLJOShlblWUS/dGvSFP0dBqNO1dGdXeH1zrc57GeBq8r3cL99kybYSrQbRf+9Ap+aSufc62OePVr4YN/6GilINWIjZO9LnZ6YlfeVx1ZkbWMNI314xkm+zYhxUpw89Fw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b11155-2100-4d53-05a1-08de635dd7f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:53:04.1697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1mNxqC5/QM9HsPTaDgUOLzWoN5pE2Tg0Xmoc/G9oHIp6Wv+9rFG1n3PPXqqq/fTPqALiArbt95KlijBut9ImQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE1OCBTYWx0ZWRfX7xwIA6v5KueB
 oJ8XKgdotBE9owdLlza0HpSK2cmTox2pvNcdJYfJPiaaAsS2tiubZeT7srd4Q35M4G87qa6GFi3
 jj17YbW790ma9IAbioawfXnHuqgdYCiNr5U3dmdIlkLRQ95EcPCXhr3ywcN4FlTIalbcnbdJOxi
 PlFbldldCQwD6PoIg8ljDRbepW0pDBiZPhkdOqiKkaYPfoNIMWDNDvJvcn1gGqTWZQP66OFZ4/h
 MCgoaby5SLd4bcZD623bbd5bL5Ijhu78QG+ZzBgIghSJAmbOwXzxS83Nlec92iwi0jIPEy4AL/t
 KmsUizl4zTnVMj4Uj5CCt325+g+bjJp0O/8ZDPUXIgLi6pavGiYTJ1cL5htc5MBBc3CBs8zavwy
 aF+P2soQkI2fhgAndbJB/VEtAjz+oyF3d3YqUt8BsUxvFntUs9m0CtIL8nAAHgObanR+pPNCokh
 +rF7wej81cq9m1jPXAw==
X-Proofpoint-GUID: aCCGuE4zp1U5YtvhTQ5DJvzvEtFYOygT
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=69825224 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=9nSFC-9Pvd1xXuEOLrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aCCGuE4zp1U5YtvhTQ5DJvzvEtFYOygT

I'm probably good with this patch but just wanted to ask/say a few tiny 
things:

*)  What is the testing situation?  Is there a major outage of tests 
with 6.19 kernels?

*)  In valid_arg(), s/cmmon/common/.

*)  In valid_arg(), why is there a fldc arg?  If what we're trying to do 
is skip __syscall_nr, why not check strcmp(desc,"__syscall_nr")==0?  I 
suppose that's a more expensive check, but it's more precise?

On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> Kernel commit a544d9a66bdf
> ("tracing: Have syscall trace events read user space string") (added in
> 6.19-rc1) causes special fields to be added to the tracepoint format
> file for data strings that are faulted in.  We need to account for this
> when determining the number of arguments for syscall tracepoints.
>
> We introduce support for a valid_arg() callback function that providers
> can implement to support skipping initial non-common fields and also to
> stop processing fields as arguments.  The syscall provider uses this to
> skip the __syscall_nr field, and to stop argument processing when the
> first dynamic string field is found.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_dtrace.c  |  2 +-
>   libdtrace/dt_prov_fbt.c     |  2 +-
>   libdtrace/dt_prov_sdt.c     |  2 +-
>   libdtrace/dt_prov_syscall.c | 42 +++++++++++++++++++++----
>   libdtrace/dt_provider_tp.c  | 63 +++++++++++++++++++++++++------------
>   libdtrace/dt_provider_tp.h  | 11 +++++--
>   6 files changed, 90 insertions(+), 32 deletions(-)
>
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 9ef001a3..a0bf34c3 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -255,7 +255,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   		if (f == NULL)
>   			return -ENOENT;
>   
> -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
>   		fclose(f);
>   
>   		if (rc < 0)
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index ed1bd93d..59e4583b 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -526,7 +526,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   			goto out;
>   
>   		/* read event id from format file */
> -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
>   		fclose(f);
>   
>   		if (rc < 0)
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index f9de2cf8..b1343481 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -202,7 +202,7 @@ static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!f)
>   		return -ENOENT;
>   
> -	rc = dt_tp_probe_info(dtp, f, 0, prp, argcp, argvp);
> +	rc = dt_tp_probe_info(dtp, f, NULL, prp, argcp, argvp);
>   	fclose(f);
>   
>   	return rc;
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 4f1e206a..e80c7bcb 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -40,11 +40,6 @@ static const char		modname[] = "vmlinux";
>   
>   #define SYSCALLSFS		EVENTSFS "syscalls/"
>   
> -/*
> - * We need to skip over an extra field: __syscall_nr.
> - */
> -#define SKIP_EXTRA_FIELDS	1
> -
>   static const dtrace_pattr_t	pattr = {
>   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -186,6 +181,41 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	return 0;
>   }
>   
> +static int valid_arg(int fldc, const char *desc)
> +{
> +	char	*p, *q;
> +	int	rc = 1;
> +	size_t	l;
> +
> +	/* Skip the first non-cmmon field (__syscall_nr). */
> +	if (fldc < 1)
> +		return 0;
> +
> +	/*
> +	 * A non-common field with a __data_loc tag and __<name>_val name
> +	 * indicates the beginning of the dynamic data area.  The previously
> +	 * processed field was the last argument.
> +	 */
> +	p = strdup(desc);
> +	if (sscanf(p, "__data_loc %[^;]", p) <= 0)
> +		goto ok;
> +
> +	l = strlen(p);
> +	if (l < 4 || strcmp(&(p[l - 4]), "_val") != 0)
> +		goto ok;
> +
> +	q = strrchr(p, ' ');
> +	if (q == NULL || strncmp(q, " __", 3) != 0)
> +		goto ok;
> +
> +	/* Done with processing fields. */
> +	rc = -1;
> +
> +ok:
> +	free(p);
> +	return rc;
> +}
> +
>   static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		      int *argcp, dt_argdesc_t **argvp)
>   {
> @@ -209,7 +239,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!f)
>   		return -ENOENT;
>   
> -	rc = dt_tp_probe_info(dtp, f, SKIP_EXTRA_FIELDS, prp, argcp, argvp);
> +	rc = dt_tp_probe_info(dtp, f, valid_arg, prp, argcp, argvp);
>   	fclose(f);
>   
>   	return rc;
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 1faf5cd4..6e0d908a 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -123,17 +123,16 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
>    * array dimension specifiers (and those are part of the type).
>    *
>    * All events include a number of common fields that we are not interested
> - * in and that need to be skipped.  Callers of this function can specify an
> - * additional number of fields to skip (using the 'skip' parameter) before
> - * we get to the actual arguments.
> + * in and that need to be skipped.  Callers of this function can specify a
> + * callback function (valid_arg) to validate a non-common field.
>    */
>   int
> -dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> -		 int *argcp, dt_argdesc_t **argvp)
> +dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> +		 tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp)
>   {
>   	char		*buf = NULL;
>   	size_t		bufsz;
> -	int		argc, common = 1;
> +	int		idx = 0, argc = 0, skip = 0, common = 1;
>   	dt_argdesc_t	*argv = NULL;
>   
>   	tpp->id = 0;
> @@ -141,10 +140,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	/*
>   	 * Pass 1:
>   	 * Determine the event id and the number of arguments.
> -	 * Skip over how ever many arguments the caller asks us to skip.
> -	 * We will skip initial "common fields" as well.
> +	 * We will skip initial "common fields".
>   	 */
> -	argc = -skip;
>   	while (getline(&buf, &bufsz, f) >= 0) {
>   		char	*p = buf;
>   
> @@ -205,7 +202,31 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			common = 0;
>   		}
>   
> -		/* We found a non-common "field:" description. */
> +		/*
> +		 * We found a non-common "field:" description.
> +		 *
> +		 * If the caller provided a validation hook, call it with the
> +		 * current non-common field counter and the description text.
> +		 * The hook returns
> +		 *  -1 if the field is not a valid argument, and no additional
> +		 *       arguments can follow
> +		 *   0 if the field should be skipped
> +		 *   1 if the field is a valid argument
> +		 */
> +		idx++;
> +		if (valid_arg != NULL) {
> +			int	rc = valid_arg(idx - 1, p);
> +
> +			if (rc == -1)
> +				break;
> +			if (rc == 0) {
> +				skip++;
> +				continue;
> +			}
> +		}
> +
> +		sscanf(p, "__data_loc %[^;]", p);
> +
>   		argc++;
>   	}
>   	free(buf);
> @@ -232,7 +253,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	 * Fill in the actual argument datatype strings.
>   	 */
>   	rewind(f);
> -	argc = -skip;
> +	idx = -skip;
>   	while (getline(&buf, &bufsz, f) >= 0) {
>   		char	*p;
>   		size_t	l;
> @@ -249,7 +270,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			continue;
>   
>   		/* We found a field: description - see if we should skip it. */
> -		if (argc < 0)
> +		if (idx < 0)
>   			goto skip;
>   
>   		sscanf(p, "__data_loc %[^;]", p);
> @@ -320,13 +341,15 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			}
>   		}
>   
> -		argv[argc].mapping = argc;
> -		argv[argc].flags = 0;
> -		argv[argc].native = strdup(strp);
> -		argv[argc].xlate = NULL;
> +		argv[idx].mapping = idx;
> +		argv[idx].flags = 0;
> +		argv[idx].native = strdup(strp);
> +		argv[idx].xlate = NULL;
>   
>   skip:
> -		argc++;
> +		idx++;
> +		if (idx == argc)
> +			break;
>   	}
>   
>   done:
> @@ -413,12 +436,12 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>    * the argument types for a given probe.
>    */
>   int
> -dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip, const dt_probe_t *prp,
> -		 int *argcp, dt_argdesc_t **argvp)
> +dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> +		 const dt_probe_t *prp, int *argcp, dt_argdesc_t **argvp)
>   {
>   	tp_probe_t	*tpp = prp->prv_data;
>   
> -	return dt_tp_event_info(dtp, f, skip, tpp, argcp, argvp);
> +	return dt_tp_event_info(dtp, f, valid_arg, tpp, argcp, argvp);
>   }
>   
>   /*
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index 406609d1..bf73d96a 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -33,8 +33,12 @@ extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
>   extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
>   			    const char *name, int bpf_fd);
>   extern int dt_tp_has_info(const tp_probe_t *tpp);
> -extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> -			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
> +
> +typedef int dt_valid_arg_f(int fldc, const char *desc);
> +extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f,
> +			    dt_valid_arg_f *valid_arg, tp_probe_t *tpp,
> +			    int *argcp, dt_argdesc_t **argvp);
> +
>   extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
>   extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
>   extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
> @@ -44,7 +48,8 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
>   					   dt_provider_t *prov,
>   					   const char *prv, const char *mod,
>   					   const char *fun, const char *prb);
> -extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> +extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f,
> +			    dt_valid_arg_f *valid_arg,
>   			    const struct dt_probe *prp, int *argcp,
>   			    dt_argdesc_t **argvp);
>   extern int dt_tp_probe_has_info(const struct dt_probe *prp);
