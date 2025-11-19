Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A321CFFD
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763593426; cv=fail; b=aHh1mFM6UHcyyo0Qn+ZAJiw8dB18BSAoDedyFit+dt6bKHLhFWEm800zkJ+9X+t5zfeM8huNq88jKuI8IXEk1lS/m/UUzAjhjzErMsJSaduMvL3+FQZNPkLLKiQGqAXRCG8J9slOeDwrIq/y/DPdAX/4ZhiT7F1KH8pTzlVMWVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763593426; c=relaxed/simple;
	bh=yznLCIbAxfgvZ3ISg/Q83b+toMPCtcC24dBo4oXoOII=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GhKFv9L5k4e9ORUjx3eoOX/VJi1ZajPehHIZeMoDytKIi0l0Z+V3p8ZuWclxMOAKPQdMN49EAx+FGaaF++zsgQN1Rl8/u7u1Pu4Wid491fDiYCWZsF75oTWO/UN+Z5K7zkodQOfioyzboMsIF8PvfgJrwsbch040ZctbqJ+KJlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rzNjPD3z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ds2lgVHy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rzNjPD3z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ds2lgVHy"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLPYGv015205
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 23:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1x17KNLMR4+KGYQkkAZ/1bo5TSqj09dn2nGlH7sZmoY=; b=
	rzNjPD3zq3Oipb+wyvoYM+VYX0ngBiCZawihkV2A/BlppM2wN2nB2wy1MFLuusaS
	IhBsZzbvUsqoRMa+dF1fOPdqyuma8qfRxNwx035OKpZf9sSCMMe5gn1VK/56smYb
	Kdb6EwAcx+kNsJAFGlBeS/5Dm4IxCAYqzWWV7+Sh/44iNpRQWPYNKDmnde/s5UPS
	d8vFpG6QoLTujXBMA3h6WALPhtbdcxe0ZdogEp9eaFnwcqWOJRrLNs7juZmlTdLX
	sitSDGWzLB9HGHsjG28k2NxSbJ8Rl2spsWowc4CoJSc4A/nk3qNDkpLZ3ThjbyUf
	vdB4jkpI1pLfvWRQ8a9z9g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej8j857c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 23:03:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJMA1mq040040
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 23:03:42 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefynk7hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 23:03:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej/9nhRoY/zT5vJbiEWm5BC+WLhI0hnUjuQfBvwxTR3FFWU6+BqdI59oLHgebFeZ3BH4c50/TvWCS3kLbaaxN+pKIuntF1pXoLco1ltpAbRDYa/2VB0iPg+DEb6uD9HXxUaF1zUzTzB4fARiUt9o6wzs2mZ8n5tjob6CauDeAZM0d2vTpHJ0R9or+2832AhTAw69u3gACjB0STga6H4/+Nv0LAp2ya4uz3K9ytb4BMuGW7JlJLP/VmnlQUrLJPMzotxpFOAErvtDA1tvbY9MlaQdGU1IhDWxEw8+d6Mby1ntRW+wuREBbtk+K5D9/x0Iz4V2oEiWMTj3OfSnrzxzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x17KNLMR4+KGYQkkAZ/1bo5TSqj09dn2nGlH7sZmoY=;
 b=l0fFNfP0QdX9kKl2g+RguJWOk8YD3r0Naowx4BwmeUjJFxUkEl83wjmH0wHJObFbMC9pd0w/qXH9Ot1gpyr9dM6DPvqRS/FsFJeqXQABachJ50vRhshvz3pfH1aPkIaYi7n+WlaGaYDpIFhYF8OZ2X9bAjHQqKDoTbUxOeevXfHUeQUow4VMeE3Ukeq/N9UrwFSuSn9UPO2Q1h7fRb3bkLAoC4gX9K1DRGVdxAhqzdfI7YvDgzpLNXa3BGvJABgFh6qaAVRW2SwR2+KRL0SiK5pKFcX+AL7knm1L5q9EekvFMHhsgf0G4rh6XWu6FDN0/B4kcj9QJelNB0yjACIwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x17KNLMR4+KGYQkkAZ/1bo5TSqj09dn2nGlH7sZmoY=;
 b=Ds2lgVHyx0llop+3+wrLypQmrQ6GPjxRxwKdCe327kW7o+Vk2WXaDAvH8piZ79t0mZ0fZSu9fi0Dh8JMCkQDGlnDgUpiIwSXh/MsqCuc9bZbGjChUnd5Zv6LgZhpmVdi6hloGocvU3PXgGBim7W48YfhvFcov83GKEZWoq32C+Q=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPFDE34AA4C5.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 23:03:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 23:03:32 +0000
Message-ID: <075f124a-f2ae-b4f1-6040-eadea0125399@oracle.com>
Date: Wed, 19 Nov 2025 18:03:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] spec: add testsuite dependency for
 perl-Net-Ping
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987DF7E2FC1582D1AAE045BC2D7A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987DF7E2FC1582D1AAE045BC2D7A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPFDE34AA4C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb645bf-f1d8-42b6-0e51-08de27bfdc42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MksvQ1crQUp5RWsrZG5TZ0tBZXZFejcyY3A4bEcyZDBJWGFMcklQQy9YVEhV?=
 =?utf-8?B?ZlNFOWVPQ0xyamNBb3p0RWJpa2VoM2hLanZHcDAwYnFqUllwRURsQWowSDM0?=
 =?utf-8?B?TGFwU2tJTVFkMG1IUi9iemNqNjNRWGZCampaZ0djWitDb003NUZYUmxJa2pT?=
 =?utf-8?B?SXVGS3p2eGFwekVmZkdwZm00cTRMRmFBL1A4dCt1TWpReDZNbGQzZEplc0xV?=
 =?utf-8?B?QUhxSE1zbi85Z3I2UElCRUtQS1Z2eVBJbG1QNUk5eGRicnFJWVBxSis1ZGc2?=
 =?utf-8?B?cTZUWEg5dkJSYXVmbWQwNlJvZk1NRXZoZFpQejRhVmhOZTM0SFc3djhQR0N4?=
 =?utf-8?B?RXhHSTV2aVBpMjYxTVRsSDdTdXhzRjloczJxZm5KcXNxKy9SazhIQUxPTkxo?=
 =?utf-8?B?Q1JCR2p4SzNJamhXVGFtZXhwRVhnbWMyd2g2cm82WjNOYkgvbkhkVGRTbkp3?=
 =?utf-8?B?TDI3N2VmS1RlbWNweHVNRTlUbjRtL0dHcTdlTUJwT1lQenF4V09xdWdsVTE0?=
 =?utf-8?B?c2tORkNtK09jVHVmYmNFTjhlQzMzZU84THhRYThjMzBIb29GN2FneGpUYTQ4?=
 =?utf-8?B?TWRKWVI0ektJOXVnSzd3TDRMUDRWU3NVU2w4QmNEZkY3VFFzc0I0RGFwVnJ2?=
 =?utf-8?B?M3hPWWlDL1dud0VPQUVHdWN1SmlQSy9NTm90azJNY1JRZzV5ZndQVWpVeENJ?=
 =?utf-8?B?eWZNUmtwZ2ZXWTVDdUlxbWZTa3ZJUUovQ0FucEFaQm5xenBYTFBUdmVnaUVZ?=
 =?utf-8?B?WGNxSkVUd0daZHVXWklObFY0RGI1S1ZoNlRkcXBFK05Wd282NTlBZHRNYnRl?=
 =?utf-8?B?emo4M29XSlhxSXJBakNCVmtoVC9PK0NHTjI0L0xlbmpIK2MxamptS0k2SXQ1?=
 =?utf-8?B?ckt5cXQrcWFuZ3NwQURoTlpXaXV6aWpYcmpHc2ZKaDB5K1FnRURRK2t2a1dL?=
 =?utf-8?B?NG5qTlNuZVlKMm1YNzE3V01jNEZRLy9kcnA0NjFGMU5UNlp5R1orNFpKaGhM?=
 =?utf-8?B?aml3aVhPQ2wrM3BIb1ZPb3kweWwwNlBnckJnK25CNk9pNTJHOUg1SXBnblNE?=
 =?utf-8?B?eWJmaGNnR1dBaGpqRFc0cmxsWHhFdXZoTlkxcHJpZ2plcHY0bU10WHRpY3Y5?=
 =?utf-8?B?WTBkUDVrZ2kzaUNidU1IN1RCbjBpaEZ6MEZUeFNaNUJyN1ZlZmdHMEVVY2J1?=
 =?utf-8?B?NHVOTlZmaFdISG1NRFd1WHdSeXU1b29oS0pLR080d3FlaVdxQzhyUThiMFZP?=
 =?utf-8?B?bVl0Tk5USnduZXNpZW9IU2NhSno4cUlJdVBWOG9wMzBBY08zOE5SMTJzSHRM?=
 =?utf-8?B?U0hpakNjZlo1K05BWGE3M25CTm5qaHMrejlubVQ4ZDg2VGQxcUdLVE1oY3FV?=
 =?utf-8?B?ZUk2elB1OEkrUlpyQUsxTFFQb3RBSEdMSnRzSzQ4eTVtc0I5NVQ5RDl0U2VX?=
 =?utf-8?B?cTF2M1pFaGxHaC9SUzFrZzAvczlNRzJzbURpM1dPcHo2WllnSmZHZDlMbUFt?=
 =?utf-8?B?VDZ4YlN5M1N3Y0lkK0RaMGJDaC9CVXBPNjZvKzREM3c3MlNRQm1jRGJzMXFa?=
 =?utf-8?B?ZFFCYktyblprMG4wNk1OdmhkcEd3SjdnNmJOTzJRUEFIR0VxM1dsdk12QUdo?=
 =?utf-8?B?b2MwS29ncDE5cm5mTGNaVWlhL2RQVFh4SStoUUczS1pPRGpPNXkzbCtEMFBo?=
 =?utf-8?B?U0hwNmRlWUVId0lwNGRzWTRlSkQ5WnMvQmF0dk54NTdDVTBQVThBTVB5SVRp?=
 =?utf-8?B?cHhVODA5TVUyM0RXYUx6N0RoUFhqZHpoQ0UyV2VZVE82TWZtK2txbk1oWUhn?=
 =?utf-8?B?TUF5RjNTQWI2R3MzVXYyRVZuUTN4eTU4TEw1MkhHNzkzK2lqTGZ0ZkRoVGR3?=
 =?utf-8?B?OThZeERBcEtNYjE2Skd3eFpWdE96Z0ZYMHg4U3BLSzFoYkM3V2FhWUpzK0Vz?=
 =?utf-8?Q?Lmx69ecz8usCpn4LKN8Gdl265YdPUVx+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFdNZE96eGNIR0dxYXRRVmtJV0ZPR3Y0bklIZExmUGxQUUJoMSs2TFlkK2tN?=
 =?utf-8?B?RnJmanBLWXl5VXY4bjlOREFBcjdSYWphOGxTbjFDaThVeHljQUZWeUNxMFZL?=
 =?utf-8?B?N2FKOUxROXZ4R2orekMrdXFZQzlhdzExQW41aThUVXdRV2c2aDcxL3docDhP?=
 =?utf-8?B?SUdoOVlsbUNVNEJpd2NGSGhSd1ppaWJDVU9NTTk2MmIybGhnQ1lqZDBLeWVC?=
 =?utf-8?B?OE5PNzMzelYweGdvalczcENiV2dLUVBtNnFjQmxFblNOVnA1L2puZFkyMGZj?=
 =?utf-8?B?aHJaRVhBV0p3aHZjc2VIeEtGc1hwTnFDSmtIWG00MGgyZGs5Y3JWMFliaUhs?=
 =?utf-8?B?Z2p5RWZscVhaVXZZditEdTlJa0hCT0hEcTU2ZzhyZkJrTzBsL2xZTEpvbVNI?=
 =?utf-8?B?T1NIT1k3bVkzRHpKazB2TEEwd2RodjFaOFNBSlhSN2Z0QnFxR084UXlTR2gy?=
 =?utf-8?B?dWVKTGJCeE92Rm04eDd1Zkd0YTY1VXV5dHVCUmxzN2UxUTRHMDRBNmxJbll4?=
 =?utf-8?B?Y1dmUFdOMS9MSXREUjI4akhzV0xudmgyMTR4UkFkUVJRNFlKbFZNZXlIdExh?=
 =?utf-8?B?NVJ2aktxTjFmWFdwRERFWjJmYjJ2TXRid21lOFJXNU5hSGpoVExTRzdudmJF?=
 =?utf-8?B?OXpQTGgrZlY4VFpDQ0dJUGdWSDQ2ZE42c25pWUFHU1ROajZ5OGUzUFlzcmZF?=
 =?utf-8?B?QVV0SnI5Z0phOFl3Z21LdHBnQTRKcUpmUnlJUHNHbTZGZjUyRjUrUUFDSGNW?=
 =?utf-8?B?OWdPNDA3YXY3bkx4eHZSTVR4Nzk2QkpzOTBMTFk0aGFBekZncE9ZeGtYd2Vj?=
 =?utf-8?B?UC9jMXFLQmJtY091OXBRYk1yOHhabDJLMzk3T2szK2UxQlR4WGs1TjZTdzJF?=
 =?utf-8?B?MzArblQzajJFNHg4WGg5K2ZER2hsZ09iUXRFSGh5VVFTMDc3YlRFeGlOUjBM?=
 =?utf-8?B?TS9CTG9Oc0FTS0N4SDhPMkt1cStjVTVwQVZueDV0bVVDc2Fac1h1REtZbzkr?=
 =?utf-8?B?b0xUVmR3YzdWaEJENyszSy90ajUyN2RUSmF4Q1c5R0xodnFHYloyTFdoYVhm?=
 =?utf-8?B?emt1dkdyck1lUUdFajhBcmd6WW1URkJUdUlmUlozTlNXaHoxR3RPSit5b2dL?=
 =?utf-8?B?aXlHdkVDYmk1SUxzQmg5c3NRdk5saFA4aXNxRC9iclVCV3R4YWphazgrRTBF?=
 =?utf-8?B?VkhVTTgveUZtcVQvUTY5K3ZaRkFFNGJmTDdaTDBCU0xMQUluLzM5eDR2QVRi?=
 =?utf-8?B?WTBmcGNHOTBxUi9kbEFmVmVKK1dib2UrSDhMcFp6bHZGajhKaGMxc3k0N2E2?=
 =?utf-8?B?R2FXckRhbjlkRTUvanc5ZzdiS2JKQzRZTHFmbFpLWFJBWlBXS3AzV1V4Vjdv?=
 =?utf-8?B?QnZMQ0Fkczk2WEtybmJHR3JVLzVDMWtjdUlOYVZnZTAybUVxa0VKNG84emd4?=
 =?utf-8?B?SHJhZHdCWHBNdWRpUTZkdE0wMm5wL2Z6dWs5OGVpSFZNcWYrMGFPVzZWZ2hC?=
 =?utf-8?B?SWp4MDRGSU5uMkY1L1JPNkVpN1RaWFFPeEJ4Z3lwemJ0bVJvNEpiNHB1ZDdV?=
 =?utf-8?B?QXZNYmFjU2oxZ2svNHhqN2I5Tjh0bkxlbVg5M05MY3hNSVM3cDZTcnIxK0RG?=
 =?utf-8?B?ZFhjZUJsSVJYaDcrOGhoWEc2UWs5Y1kvNXQwTlVjSnMrdW81c1d4emVnVm8y?=
 =?utf-8?B?U3V0RW9XdU1TZmhrODFQdGZueXlsTVFIaTE5dlljWUw3cnFtWHllemZsZ2sx?=
 =?utf-8?B?SFRsQjJYZTZFSlFmenc0UEpiMkJUQ1Q4ajVzOXNiUVhDSTRXcWRKbnpBNUFh?=
 =?utf-8?B?eU9kajZuSU1rTFV3dVpZekxOUVJiTVI2WGNZOEJVbjQ5RDh3UWNDTWtNNEpU?=
 =?utf-8?B?OXEwL094VC85bi8wUzVIWmNOczNKaUU2R2wyZ2U3MlM1TVZ0SWlDek9DdGdM?=
 =?utf-8?B?YUZWbGoyYVlZNnlrTTdHWG1DbFY2b2hmd3BLNDNXZmh5dVJBM0hXbTdhWjV1?=
 =?utf-8?B?ZlVQaFk1OFkvenU2MzBTcndpcHpMeURyMnpyKzM2d3NKbkIzNmo5NjBuSmdl?=
 =?utf-8?B?RUFVTkJuL3NoNEt6R2pkSEJQckVqY2JWZFNjeDkrU3ZzNVl1eHBWUVhtekFX?=
 =?utf-8?Q?8vvOQEJGUBh/uRirc44JVTJFE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gYUpF8hc0rv03WWi3qwh6ViOaMqErtO180Alr+zUBME133Nn6rAh5At9MmJBS6nocVPE5s6yV4Dp6fW2+GJmvg2sCPbUiWBuy12mv4t3aLPZgj0ld7KtLOrFXJWylBRyVx9R9GZ8vjxFhBYnFLJv58d3J/eVO6NORI++PmToQHYp8QGlf+NAferk5vmIjZrc/v0XLq5ieFAyyZHBRqaZ98LWUXXwEWxqQxTKdlzhO77Ew2j4XlflzrCgRW1Mq66Hc9Ya8H6KTrtiCfooE4I1WVfnjfJbdwJa1oNQQce5kEJes/BI3tlHc1OElnHkMN4u7Lq06uzOQIoYD6cQCbeStZn4cNB5uC4tdjgpc3oqlwD2pr39d8TkWb95L/HTibwSE1hXY8X0DJHtu/cgRtYcdeGGrZasc4FDbxSEHU8Y6MKhgEWUK6+hrptClw2g6AfbCfh7Ztd2aYwnf7geMiZKY5n05M4K+ok7f1vcsOK3uLNEdYlQTlAFF3b75m+RrU391A9X2mSU0qNzcgWHBbbKmuuFa3haACxu0xbhnp9rp6Z6Zt+RnIzV7o+2OdJaNNntO9VMK4tBwn3DuX/xfCIBgS3bzQWKjRZuzkVoQCpMGF4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb645bf-f1d8-42b6-0e51-08de27bfdc42
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 23:03:32.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTbjz1sojijNfV4DmQX+49zp1yAPaEBXiNT53C8oWYfL9VlBHj7+m8q13VO7r8F4lJ+JwAb/zL+hQdBTaH3Lhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDE34AA4C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_07,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511190181
X-Proofpoint-ORIG-GUID: a3CsVPa_NmNVZgthCgkF-9oQ6z3MksZM
X-Proofpoint-GUID: a3CsVPa_NmNVZgthCgkF-9oQ6z3MksZM
X-Authority-Analysis: v=2.4 cv=I7xohdgg c=1 sm=1 tr=0 ts=691e4ccf b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=bO7Y1eIzxcSEf0d5THQA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX3i53acy6foHK
 QFjN9IZwt3BBgg5wBiGu/7wSCGfMr8RuG+0c22kq2edA7OTONRIDHwqSr96AAQRyucjZIv87YV3
 NQjgLYOFwEazgqJJnEV/13/+HeENqFAIG717zH1hPQuZIfXRTLL2jt1vPLYZ8aclYm38xTOnczm
 KKCjAlMsY4cYZzGZwgOqTNT89HoEXjRxbZoPt15sLxhqtf1/Im/nACi4j0xUsqSH9UCVOPsXwQv
 YWre+6fbWKjSRA0ArtZ/XhCTmIvYAmxKAForRxAB+mOyneaUQqHCXlEOomJ0Y1YcJU6lf1IxbJI
 TX9JRmMY6g7kV9Vp5ETDJZKA9gVBuIwia+pm1jyJ/+PuLByBlSjCY+o8aFo1yX0ttZzIujBYSll
 7e/rAOEkFyHq3r6gksizYa1N9rW4byynmKVxySY0oHWvE8DXHVg=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 11/19/25 16:14, Kris Van Hees via DTrace-devel wrote:
> Commit 1e689f55 ("Make a start at reviving the ip tests.") added the
> perlping.pl script, but did not ensure that a dependency was added
> for perl-Net-Ping that the script depends on.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dtrace.spec | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/dtrace.spec b/dtrace.spec
> index 0905763f..4b20dc40 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -112,7 +112,7 @@ Summary:      DTrace testsuite.
>   Requires:     make glibc-devel(%{__isa_name}-64) libgcc(%{__isa_name}-64)
>   Requires:     dtrace-headers >= 2.0.0 module-init-tools
>   Requires:     %{name}-devel = %{version}-%{release} perl gcc java
> -Requires:     java-devel perl-IO-Socket-IP xfsprogs
> +Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
>   Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>   Requires:     coreutils wireshark %{glibc32}
>   Requires:     perf time bc nfs-utils
