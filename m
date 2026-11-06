Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794000449;
	b=fGoZjnSQJMvA/GN/j5iBOsGKNGsrPdvvj0K7r6qV+TlZN4+sE64ZmS2lV38O7dS7GxBh
	 j1E9U73PSThnayaLX9OBXPYzNFUagsnLPo760/Tb9gbdwbrYUYJsELIUy6t7GtIirNiLj
	 3HoCSIcRG9TiaIPQD3D8ry0jwo6aKZ7uLn4qRyKSCJRgsYFX2ygdm0Hb7s0sNu+BwpZ2O
	 j/wbxs/x57T5jg4IOeqLfBP9KcPBoaV+MtORnGFrffklTzFE5cfsF2cGThbjlriMytFXz
	 1+geymEtB2+7Njgti21HSXV7C/ie57RD1dmNuALDuXDiXCQwbp+6dPpdsawNUCbLPhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info;
	bh=qdKrYRjnNtRAs4Fav3LRHEIGLb3LNHlWqxz6eK+CKKk=;
	b=HX/8rPz2SnEZ0jBXGcPPO9ypdDmMW8oong+Khy/yQg+exdlA/4Auxg36hZXn86koPLhg
	 W14RVEEHA4pb3y2oK9oV2v6VFCwRlpXQ2a5/9sZStYqEiNkR2Bn1TCf6CjCOTQQVRZHni
	 XOOXZAt6ccPdvEAAL3vtkpzI5W3YtMNl3DBFsWtPnmdP/NBTe1l8owpWTJiBFx21xApJ8
	 z3nrGbL6cqjmqAlkPHn80T0/pmB4kpOtw+5i7uQdpaY0131uHNKl7Cy9a3gN8ULFsocGI
	 lKKE3YKVznh0A5yhOaW+8WBEGfeZUgQlAlO/32GHHHzQQ6dzvSt5iUSfoTDW0WtFUkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=MYkgOIZ7;
	dkim=fail reason="signature verification failed" header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IVwmiIEp;
	arc=fail smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990D606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 21:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8990D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=MYkgOIZ7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IVwmiIEp
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FT34o1963320;
	Fri, 6 Nov 2026 21:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qdKrYRjnNtRAs4Fav3LRHEIGLb3LNHlWqxz6eK+CKKk=; b=
	MYkgOIZ7Mgu9C2RKyK45mibxuTH82+9w8hXj6ZFLGzDQhiAKJbGwzgdNDHhn3zlq
	zSfk83TwzFqeZqCKE0g/kbZ/8dxLcuLNJl7M/KRPjj0wnnnuurSr18O2TxpA4eqs
	Gp7r1Awh88Y51c9gwvauXa0pjEy6Nnk71zVy3oxHG1TMVeZ6GgRNk9CAwn1vXAUo
	GWn3QxMGDwsJbxU9bg7vpiTiSP59GmYnvjFC2rNPPU9dtkV1g8gOyLUjOmWM/Hzi
	lJNLJngXlLJbzpaLOVvsABdhMY58oG/rsU4OUNRt1oRxWThxZHSlkSoVq40mGJwb
	9MEjaHkZPpJP6NZkX/gtYA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hs3qkhg13-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 06 Nov 2026 21:27:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6KKfGF3221086;
	Fri, 6 Nov 2026 21:27:22 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hskdug67n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 06 Nov 2026 21:27:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBuvQ4M/L8Rl5/fwDZxoxbg6l/M2KU2vqNI8ypGIfhTXQPDx43KhE8cU5Zn2An84Yzaz51pyV1qFt9YELzFfegId9/BKNFsND+BNjLZEfMwKWlQVzYN7zXn4UBcCMRicApD2TCd21OqcGoOkTvGnIK+WNtFbLCCgcNL83hljngCUcEpgdzbpC7Nf6OmTynnKAreCPG6rTcMWVzgzh103774TlY8V+L+cnmbZ3gjSJTky1kPn5Oy4eV3m86UvgSgq75iaJtWooIlvl4qP/C3iCl54+mmCB0SyxR6V2o8DEOclxvbirJks7HyDEYAGpWDb7dqDWtRAspAThvV9eQQ1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOFlBcKD/va2yOY0SXUgoG2ffCW5+k6Jf+2UDV6Vvng=;
 b=fdOQ+d9ISLkpw/JWS9U/Eg9w5Lme0lA2xPyXcNWSQ5lwrpsO1nf5ETJhZUbnspawSkH+MpqXVB2Ou5sCuFgMcDTNiVZpylk3bnlzcR9+JnoT5ukuHEd9U0uaIehyU5DxijsJnkyW1xvof6XWqTQtOWF9VHvujU4Vl6YunwsaoOoeV/RP90MGBII2Ph93bjFDk4MYuNAweFyGhJDUFxV0+tZqeTS+n6CMlWBnWZzYmVMwxrvB5b8GQR05lRBfXmucprNQnSghuT5e1EKmtZZOk2VqXbU/8wryQsEFOX3H3GDrEe3HE35SCJMNY/PxBnou1/pWdyaZRrDDc47OjxNjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOFlBcKD/va2yOY0SXUgoG2ffCW5+k6Jf+2UDV6Vvng=;
 b=IVwmiIEpVcaS+U2uuGfRXkBmh069RvbE/iqi8C8vjKMb8UJl1807RVqFvjryKlFT6cIJbofPPzyTFzk9kNFjZPiKjqUGde3DQDzYij8zHoVKaG3P+ugxlGFi2d53WqU4Z3dcAAxmBLQhcJwABl2qNxlTqPJrgm/iKPJ2k0uNVYk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LVWPR10MB997863.namprd10.prod.outlook.com (2603:10b6:408:3be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 21:27:18 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:27:17 +0000
Date: Fri, 6 Nov 2026 16:27:14 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
Message-ID: <au5GMni77WoIIoMQ@oracle.com>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
 <87ik2artkr.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ik2artkr.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LVWPR10MB997863:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0ac92e-d514-4b25-2b57-08df3c4cbbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|261021135927099003|261022105027099003|261021121427099003|261022075727099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3BJRIETlQNxXFnhbEih22Rd0SYhE5Ab+XkkLAQetDAwa7vfoZkuiFjQZfK/eooLbozDqDASZlFANBCYpRwnn6XTDJG7NTz4j9PWWHWd5lowidyZ114CLWHUFe5hctboAGEeL3WxIMbj6DggvHbx9Qh64XF2XuWTUEJLFoxx4wd8cprMFYhQogW0n8IPv7ur2N81foi2b7kFnlaOKP/+7/2RwcThFDk9QwN6xr3F8ab+ZPX1uVgJ3XlXPjFJXk4Dmbt7ZjPXg6pt6VL+Tzp+hAz8GazM0EJ/fcK5sopDgQAq5wPA/B5TjQKM6tJALUrtjWV2/4qjacghIzjoNbGeXp7omyM4UYZUJquK9tbTciQxFS7b4lS2cPkVG80wGQHlr0iKDnK8MqYNqfGB04mrJ5A27b15lbxza0+zchkM2s5/bVUpwrOP2qXEmX1lvfEEzuubGUm2WNY984MUTUjlEvIJ2cCgby5QxxZdZklIrvlQRLfzKsDgpMSUWFZulwhlC3nNec5iDhAyvpu6OiEdBaEPqbip9a3G3c5GVReWcPRJaB27KM5mNVrizvmsfVbD/Zj8OkYlGKoCuj8qvjT0U7ekeDLbvF8VKNd8okiCNY1dR2GkmI+c7EUQsqadxqVxfbZFyP2FaHrzSHPQmtfzHSKM6tgxHBwxY0yjBjBE7s+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(261021135927099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?EVp9zq8l979eaGwIYCNyv5ZQrbzmIJlukFnUBnPyC/iXHIDLKCJUnMma5J?=
 =?iso-8859-1?Q?DoXOO9o3JWC3ngofIi/xtTougOCzyOIY5RcUmfCzpjZLIB09SBkWOPkd36?=
 =?iso-8859-1?Q?OE59wKWj8FG+0/ce5h7uT/Dh5LwLXfAIfehlqndCVSS6lE3g3UgM2rJN/8?=
 =?iso-8859-1?Q?bgVSwJGB4YrRGnjy0DBPdmghLLLwuw65raB8aLENwV1D9xAKV3jx/uIKt7?=
 =?iso-8859-1?Q?V7qg8akgVpYiRW5ME9bzAmUeIYgHtBEi1X4DVFx6lG49rqHnBBEKp9LHzL?=
 =?iso-8859-1?Q?KZbYGPrHrJKTM/qRy+5p/28Pigj3OrTVyjrJa/mtXmILsgAj6SeeGukQVw?=
 =?iso-8859-1?Q?3xi0DZy3BN2l7VHDP1eOd8Y2npzFypUhs6qIv32UuyLqdpkjwVCI/vhdoX?=
 =?iso-8859-1?Q?Ns5BahhuJMgMQGCbJXDfrgRcVt7ucQIGCaIgcb8hGr8NloyrV5n87CPQgm?=
 =?iso-8859-1?Q?PMxJQQTYzTjfFuYEtLimAslh9PaaX9rc2CxhyzpM/bbXMaNYC3XNOxxRiB?=
 =?iso-8859-1?Q?11FrrK2O0KB1eTIUzHA+ab/V6H9yBChdx91uY3SA4cIJKjnPeR4y/8gUpG?=
 =?iso-8859-1?Q?U3k8L4Ea+e7XTiPx1iPTWSU4nelXB3O51F74y2RHF1Vnnn/8EHM/jUf/pP?=
 =?iso-8859-1?Q?fTXvNEX/GY4yh3rnlRm6lgl1kHPjrEj9EMXxOBOTGKDE98ZsWo2X0PAYsJ?=
 =?iso-8859-1?Q?TtjX8fizSdH/ALqgeANaE2nLyR6t++yP6RFEmMfeB6wph+M2NP+Gb0H70Y?=
 =?iso-8859-1?Q?WTJAJ9ozUPHXmcg7Z/lzZiIfwUx1SKjRWciQSeK7gRVaeAqFqFWrliE0x8?=
 =?iso-8859-1?Q?frFvYzVlZhgH6wZ5sxstICbeC+PH5qQxg/8HNNH6s0KbJNHiMOM7a7VyO+?=
 =?iso-8859-1?Q?4LiLewzodkgr2BRYQlRaimXnOmhTnKmw0aZk9j5TtelJFBAaiBtwZIvb1d?=
 =?iso-8859-1?Q?U9J1zFHhBsahzN8jgFPzHeNRagfTvvt3Du3ayu8xOEroquUt6QFfvsUkSs?=
 =?iso-8859-1?Q?tYtu2JA9Ql7fZecOkvmmewr9V9KEp0t7OHlXg+uPsMhzniGv8vDKanhlIT?=
 =?iso-8859-1?Q?Eh7M+WxfHY0Wsj3cdjSGDzLl8F5TXuRvX3AQ+kMoxqHfQRkXVby6mXpk8V?=
 =?iso-8859-1?Q?EOvXb3YjDuWQcDwJ7wlL9LhYwlQft9HVm39bLpIMVOVXIOXbAsLEPwcm54?=
 =?iso-8859-1?Q?sqCA7Ez23IiFpO62DOqLZiS9TdPvgGCvpUzSscRw+VOdI6O4/oPaS5epqx?=
 =?iso-8859-1?Q?Mlk72/+86NwzkVQchZxtJnteQ5fACwnMx9sOBgbgro+G/1uq+5aqZsPyUy?=
 =?iso-8859-1?Q?YiMNzokDUcMUBIKwWBN7btgEngUZSKehZKsrMgj5388VIxVzjf6YGnMB+P?=
 =?iso-8859-1?Q?bfL6GeiP4b5aK4aH0NK0N+L/cV8zWKVjE5lF469NhWKAfIzkTCjd9pBJIz?=
 =?iso-8859-1?Q?W1/h5QqU2E9IbjZw5JwwcLBhRWmvaQO8Udk7ob0em/oWQJSyuMByE3ni1F?=
 =?iso-8859-1?Q?NNXeAtYyPephq0eVfQ+M6i8FQCNJxNjTr86O+E7iKfxB23jogitss9ufdq?=
 =?iso-8859-1?Q?FmodJlU5LzwMztpZNnDLvFF8a+aTB8XsWQIiPMROjmdYGXGbBGIcmkSg34?=
 =?iso-8859-1?Q?bZL3yLqFrM8bQlXMLcmg9p/2XHZUcJxE8FkPjIuaOWeH1dkHmAA4hZ9YIb?=
 =?iso-8859-1?Q?G3BPYta42JPziQh6x3p0HAcRLGtUuFgpdpoeJrRttuhRq+xSEId0RgY/6F?=
 =?iso-8859-1?Q?1geqBNSTaFYS85BDySQ3aB3KD8Hz0+2pp8QBA1SfeHYkPNuEzNrI5QHwxQ?=
 =?iso-8859-1?Q?+4FBh+yXcQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	4O6KEbCXMaV4TyBeMuhLG8uduqWSWcFkR+RxEfIDjaVvm2TDU4h2B2pzsuWjPk0xFsQHOWZySUrCjxiBbIeFz+6hdgaa7Ui8rx8m8KvFDnq54lLTq8KAaJ0vci/SHJ+h2hPBJypBh6jBO7I+3DXdG1yUMAdKi/ELYKNP7hhO97gnz9DfgkkwkjgQAqp+g7Gway/nqd8SEo6OkwGkrK6+TOXwPDJB22tAdby6eoNwNyv7W/75uZAAkkN5+CWz7Hp4eCJOQory7+yxsy89yAtUwZHcGomB3ct+8jAscsHN5mngpwIzTX16G78TYLul08CkzS8RtInE3hVEiqGqCMh9yQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M0OZOSFu9CGkRoNQ8yEeuUKfA5RloO7Z2xGR8GNcPO1SUOgE+E1oYF/s8OFG8+XqEf7kCff3vMIbQPpVAeFwaF+iZZO6qqq7TWWfAf3RXuRLqylHNb2O43bVoIo6mqH8ul6ZPP09zBT/Y2ESDkeGBnK6dY4HgRCGYO5YR6vhxSrz56iUl8qbpvjx+u9d536DDE1wzZ7rHHN4iv1HQGsIQ7ak02wc4f6dZVrgf2ufncyyA/13KWUNfkbn8aZf5ntmqTcmXJ4a9XOjnEZTI+V5A0prpeb4dcpwWKLzrdGRVWYmee7QL5g0lfn8Ak/JfN0pjFpsru384l5mjbafVrHlkiqvn3BrzNhQeHL/VImljJhOwj0Cgurhzi2OiPzmEvF8eP79U+HWTMiWAfme4ZpBXdZaTVi3ANQYqm2aKd4hTd0383h/W6cvRj2DDL2UVpDMNRxol8G5ZSw+8KWXpy8LK7w4XI0BN7BRMaAmSsk7+h6W3YzcswfxJL6WQbDScGLyzEDuykC91LSWmHEt+vsHK7yzrGgGy9ds2ZTRKKVktnhNmrTa9dJKRXp+zydQa/oiKoR9Km1v8n5Yc5Tt1kpPqFaE6g79+Wj71m5YBraaYa8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0ac92e-d514-4b25-2b57-08df3c4cbbaa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:27:17.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nds6SFLMMQKMIxIH4y5IWHJ7wX5NCTZhF6z59WQzj3AVlQlSFIGWzFZOJ/6NH7Nddiodsi7CZr3sfMlI5f9Il4oVUdYdSK9BCk7png5Vwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997863
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 mlxlogscore=829 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfXx86vdunqXUN6
 DmpWUtYaapze/Kq8rM2b9xyydIm8kmHyKI60EJs7RApH/Et/oNpZg2ukkFsOr2D3qaSfLNTvnjM
 BJMF+KuROwW1tsfmKreoN/NHd1MRHi+Rzm7+6/SAukeDEoDZs3D3X8IRis66godGkX01zJ/29uB
 HvTzOENyp9miRgcImpj/Pby48fUWvu1BqrVqT+mev7gKrndCUzkUral193kuf8QT5S7nLbViqOb
 9xhDycny3Dh750v/YHus03YYp9QUxn9pX8sZ0j5waQPkAc+4fb5yJ194gWwq97UnR9tnBVaf8P3
 zmWpskUbTB6KZeQdt3t4V/37GXP1ESnwY1bYKiJwxC7uU6SkoSbRZfjR15WZ67TSfSs0fv+iTB8
 nDCv4qjnDf+fQtdj1n84s+ie2qjmm/IvTqlbTDg7Oy8X8uT3tOmmPPibfWCh1R3eS+r5h2r/zMy
 9dbSpNNtZCs3wqs+VeA==
X-Authority-Analysis: v=2.4 cv=HrfjiETS c=1 sm=1 tr=0 ts=6aee463b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=mL0xekCOjJLsMSk7ZVMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: hCxp54V17sTJWhjqkhAjR_N8qB4gA6tq
X-Proofpoint-GUID: hCxp54V17sTJWhjqkhAjR_N8qB4gA6tq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX3/GG+d2fZ6zh
 NyOltyk0xsdZMhtbr2bESf5E8VGWvHz49rxjsFAHAdIUFHf8KhgEetJ3AFsLZLEYmsWVZ2tB4Fx
 5GtBgPAwUcGfF22YIBuH5zcpskCWuMNOQXAvBHhgGgkQ9msflkrh

On Fri, Nov 06, 2026 at 01:13:40PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees said:
> 
> > Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSYM,
> > loading strings through each tableâ?Ts sh_link. Search .symtab before .dynsym
> > and include dynamic-only names in module symbol iteration.
> 
> Yet noather place where one or the other strtab was overlooked. These
> mistakes all date right back to Solaris...
> 
> > Preserve .symtab indices for CTF, place dynamic and external symbols in
> > separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow
> 
> Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
> dict flag), .dynsym should be searched unconditionally for CTF.
> Preferring the symtab is wrong. (I suspect this code is basically never
> run, since it's all symtypetab stuff, and the symtypetab isn't emitted
> for kernel CTF.)

R-b?
