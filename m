Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293627BF93
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043619; cv=fail; b=LYZccH7s3Uz1TOEb5/XMseEU+ePfV9sLC5Ocyz6zM5QstH0bdVixKJ4KP4/g0RK2V95aYpOdp+FEYaZWq54sU46ivb+lgvlv36Qxqy+ACXlwm8pey93xLFx/gn9aEF+7jvCiTl+d1fST9qw8zFjQqfQEkZORV365lQUn2SHBW44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043619; c=relaxed/simple;
	bh=jcBboHpq7vXRfzugHciYDSyw8JQtQIdClicNl8Xd9HQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mu7/8NiuCN0WEkdlmjdxgYg9AB/eYAHwNlzqA4rfUXa68fGBZHQN1Ls5KBGB8I4d/tTE5YniHfLJEmIxPT961riaxEwfkLPPAdE2tCy/JT/S47uqZ2TE/QPUlhKPobwQl+sx2G3xFCQC7FjLJEo3j0IOXSgg21X35PAYc/DLGJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lPCVTwKO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c5PFjTzD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lPCVTwKO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c5PFjTzD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599KgMJC014003
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=shjmQn3MLdKomtmZFqz0kyviOs74p28p0opjh9u8MQE=; b=
	lPCVTwKOp+eHe4oeOhLR2Z5ELbnFA/XfB5BB64BHmiNA5wFxD9RGfAB147/ulHZH
	HEXbXnQ76W4s+BpQTPJa1B1M9uH05ey+77cRQx/H2cDKL9t9ESyCXTcKsU76ZfHl
	5RAis8qy/Re5Ke8EcWcnkarFkXyD/Oc6XgUpyXbP/onwNVmGt1yzJQAIT5EKNJ43
	h8iz/4jH9TsZXOecAUJqJHOG/O4wPxQRISr4OB+fkvpb0YzT0cs0YM1EzHLZVvoG
	ujDmH2ZPlLNPfJqcPfWw2aWkgJDpb8YlLpJxR4BK1myLVwkaKhE1Avhv68uyYZQs
	roZSRPPVO3Thjl2SyEqZpg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv8ptha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:00:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599JEW9T037088
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:00:13 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011071.outbound.protection.outlook.com [40.93.194.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49nv64ensr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2VCuSH2BbK7SZK4QW0f2bQXUaU6ARq6aolHVEmTljLZMcDwnROea5Jq3YphEF6qsfKDM1F+ef6c/B4MrcC8wedd8v1EnbFcCvELSbkWKr1U6LMNeUuiT2+ZxJ0qldVzWuLFLZ9czSElVujPW8TxLDaJkgIhUH3Gyk3iG4D/mkmqBFT+HjuCxaTKm+oIP+laGtU4ke704cZq1dfUpPJuI6AENqh9gF0ZGm8ejkH42S2y4sgrG4K75TpAAJNeFJYWWqEwq2K5FYETzGIL1Syy7zld0mj/umxx7Vp50vvK2nFj4Fd42OQTdUiFMOZuPJY86CvfXiZLB91xtz1J07+LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shjmQn3MLdKomtmZFqz0kyviOs74p28p0opjh9u8MQE=;
 b=JKz0bYI5rFVPjGNTZ7DunSiJyk5kwFihsbWj/yDGn3zennEd4EqF97I2eOn6KZnUamBGXDWY3sLHtSZe9PTYtOiUaBArWjcEA9i709fhiHlY5+rBzEJm/riGTU95VQE/6BTLDL/+vizmsu9WpaaX6yQxP0o3RKjd6yKpGmZhaaUeqpuHlyNJd0BIvR4MXsIzuRt2OiNhdu2/KbXX/7mQa0KNVLlaB77rFrAt3ZSq1uSGg3+7h9BWLD6Qlhqz+q7C4/rafxMCp2zqcYRXITEiZwR0dUjaB9JAxk5oBQb1Njw9W/6SsuuE2rrfQig2C7w8d/dTTG30vIHoRlA3FahjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shjmQn3MLdKomtmZFqz0kyviOs74p28p0opjh9u8MQE=;
 b=c5PFjTzDnag9zmQRS+2+f3PQFf/kEjbl3I4IESJ8NfTQQrnF03ynIggCvz2cVooANZH7241h85vhEYw7XAyK/EhA8YFmQew+afYGeyBzMg6LAkGkIW+YxGZkcJymFaBDPYFYC4+ZXvAVgmeVYWjjjN3r26CytP6zqxWMoGfxFp4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8419.namprd10.prod.outlook.com (2603:10b6:208:57f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 21:00:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:00:09 +0000
Message-ID: <1c254ac3-ef20-b402-5e5b-debdf5128a8f@oracle.com>
Date: Thu, 9 Oct 2025 17:00:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 17/20] doc: Add IP provider documentation
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-17-eugene.loh@oracle.com> <aOfq59B41hE5uas/@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOfq59B41hE5uas/@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:510:174::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c1f94d-79f6-4c60-4e5b-08de0776d4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXNvanhqVU1rYjZLSTcrZy9HbjhNN1JoajhLYXNnakJadzhGa3lFKzNUUENp?=
 =?utf-8?B?aDRYOHM4UDRhaWcxcFY1Y1lnU2ZUZElsZW5sSVQ2M09rS21vMG9GcUtNV1kx?=
 =?utf-8?B?SFp0NGxYUGtSTTRjK05YK1d5N1RkTit3WDc0VjRSUnpEVGRsSmpyNlJ5UnRY?=
 =?utf-8?B?MVNaWmxvTnFzOGh4ZGs5Y0xKbm41aGpwTFpxcEN0U1hrT1NEaG01eVJQWWo4?=
 =?utf-8?B?MmtXU2VpS1RZREYyd1dVUitrZVhHN2F1Nk0wZGxpUzYzVnpQQnVZckFtdzB5?=
 =?utf-8?B?ZnlTVzRTSmRJbkNpNURSUUFWcW02Z3dFT1RVVHF3MmhQV2FlWlp0aXpBU3RI?=
 =?utf-8?B?N2lHV2l6MWpEMi9nMjd6MlZZVERWdDVZRGhnQ09TWlhBZ1gwU1lwd3ByaFBm?=
 =?utf-8?B?RmFBVUhDTzl0Vm5zQlR5VGYybXZ4OVJGd1ZzR1dDcHo5cktKK3kyL2FRMW5K?=
 =?utf-8?B?ellqaGdqN0pVM1FsUExFWkpPaWpmUzZiMVhyc0pleXc3bUxNN1VPQ0hoNkps?=
 =?utf-8?B?b21HZGtxdm9iWXVNT2xOZVpBZmo0SFBrZ3h5M2tMV1VXT1FHVjNFakFZMFRO?=
 =?utf-8?B?QlFwcWpCSWl6VXRuUXRmKzFDeFV1OEs0VzVlVGNuSWZEQTI3MmFDQlhCV0Fl?=
 =?utf-8?B?cG8yQWpxQlRIUStnY25sZm5RaHpCY1ZYRDRNTU5pYnY3MGg2bmwyWENkVWpn?=
 =?utf-8?B?REdockQ1anE5VnNYYnc4VzdmUkxxWmVHeUIvcG9VV0NNRWQ4emRwS0hNZDEv?=
 =?utf-8?B?dXVsOXV6VWlIV3E3cjcrajZZcFQ1WDRJMXE1dlhkSStGTjAxMUdpaDBCbk1t?=
 =?utf-8?B?ZFVDbkxTRVRNMXk4MG5JQjI0QkcwTHp1OUEzcnZhZTFCT3FNQ1BIeEVSTG81?=
 =?utf-8?B?RmVFTlNaQXJZd3lsTlhnVzZmajhsNlN5L0JaR2RObFZMeFNJbXJPQmlqRW9I?=
 =?utf-8?B?VUhSdUdmekRHK0N6RjF0NVFWM1FWVEtoOXhZWDErNnpKOWdtcFRKTFVLWFNY?=
 =?utf-8?B?MVE5YnJFTlVJZ2hmTXJBV3FKSS9UQVU3dFlzUzZqZkx0VmVtRGJDai9taEdI?=
 =?utf-8?B?N01xay9sYTA0d080bU1vZDBOZXcrRk9WMklYWFpxZi9wNG5Ubyt0eUw4UUNx?=
 =?utf-8?B?dmZldjNEL1I0MGxaUEhNbUxlaU5NbHRQcXRab1VCMTZsd1VnalpJRTFVbTNm?=
 =?utf-8?B?b1pOS2ZrSC9jRGNlQUY3Q3NIOHFqa0NPRjU4Z1IvV1czT29KUzlOZmZvRlk3?=
 =?utf-8?B?cmEraXFoOENENXBVUTFodkVOZmRWSktIbHo3bXZVVlhHZ2FJVWJZZEpvT2VP?=
 =?utf-8?B?T2c4b0pqamdnNVB4eEMyUjRnbnRLNkVRdXZ1eFpXTFZBOS9XVUpNSkZJQUZC?=
 =?utf-8?B?MnZxTHpnNHh1dVV0UE0zT2JNRjVvR1gwU3BzaW9xTkgwU2E3eTJYNER6NmUw?=
 =?utf-8?B?VFpsTS80UmEzL1UvOUtRK3N6Z2cwckpMcXZUM25YZnprZFN5UUNnQWdBN2tE?=
 =?utf-8?B?Q1NUTkRHdWNkRTNGR1hzTWVVTE5jblIvRHoxdXFqRTRnWWhzOERwQmlGQTlP?=
 =?utf-8?B?RUJNOHpUUVJKbGFhODRWRDVjVUR1M2w5VzlHclgyRUxOUi9VanJ1N2R0TGs2?=
 =?utf-8?B?dG9kcWlDZWVwbUI2aGJJMkVWZVhsTnltOWt4dWs3K0F1VkdseGZHVFk2NEJX?=
 =?utf-8?B?VGd4eENHZ1Z5RVRheC96MTAySTVLclRXdWZ6b0tUSmJBSEF0Qm44RHF1QU13?=
 =?utf-8?B?V0djdlJiNlBud1FqellMRysxRmQ3aStBa1YvdWE4bWlrTExxT2dzZGZ0Q2tx?=
 =?utf-8?B?MytvM09NY0dLbVc2UTBOMlJNQllPN0FNbVVPQkJ1OUROblNMdVFGV2VCbUlC?=
 =?utf-8?B?UU1BVXMxeEorZWJvTHBoWDRRa1dwQXJIL2J0WGNDV1dhc0pvbGxKWHhJUmpZ?=
 =?utf-8?Q?ksfRKGIBxW1fCBl09Ygww807/DeW+Zpz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9Bc2lMY0lybmZDY0l5R1ZWWFBXZ2gydFhiVitDRmJRNEZrMXFOT0FQc0ds?=
 =?utf-8?B?MFhQMFMrTTZMNEJyQUg5VTg1a3RXTEFsMXBTOEFOVi9OMXArVU9VQWp5S3Jn?=
 =?utf-8?B?czZjZXlzZXRLc3lJbWc5SVpoNytpUGpRMGhIdjg1WnUyMTRiSlJ4Nks0Umhr?=
 =?utf-8?B?RlJEZ0dmZlBJdVNsTys0RkVpcWFoSy9hd2pza1V0N003OGR4M3JIbXN3dTNr?=
 =?utf-8?B?d1VGYUNpdE1icUdVV1hiUUZFWWI4bkt4YVUzU3NZRjBOblUzSzJMNDl6US92?=
 =?utf-8?B?a0pBa0lDL0NSVW85WWJFVUxVUmNQWDBaOHkyTHJiZ1R6Wm1zT0xSVGFXT3h3?=
 =?utf-8?B?ZUFWSGRXRmNjSkVBUEU4T3dDZ1FtT0RTd1h4MDhYUVNFeWlZeHRTdER6T2xI?=
 =?utf-8?B?SDZlYityOVFtUHdlZVg4Q0VBeVhqZ21aNk5VWmViSG9GaTNyRmZLS0Vlc1lX?=
 =?utf-8?B?SUJGSHpkcUdlWW1sWFhQSEgrUE1lQ1k5dmxJL2lMOVV4YzcrV2FXZGl5UXJE?=
 =?utf-8?B?bndOVUFmeEs4NkR0bE9PZ0RPajVKRUVHdWp6STNTem9vN1RRMDM4Z2xuSDBQ?=
 =?utf-8?B?OWVUT0p3cy90cFpPR1NyM2lRcCtqWmN4VGVxMHIvZ2lzUk9XL01MOHU0Y3dp?=
 =?utf-8?B?RXJmWU9NV21wL2l1SVVLdUZ5dUE5dWV4alJtc2Z5KzREQ2tQTGVsZE9keGhU?=
 =?utf-8?B?d3lWSGZRWEtxaTdnOVBDNGNPWlI5bStmRUpiNXgwY01VREZXQkxkSXdWY0pC?=
 =?utf-8?B?MTlpSWwxNVUxZlMyWUdpaTFITjZlMUovZ3BxQmQzYm82NkJaNG9BQlFDaUQ2?=
 =?utf-8?B?RFcyU2Y3S0hZYmd3MDQvZVBWVUdKeXlmYmlCMFZGdzNZNFpndEdPK1hURVIw?=
 =?utf-8?B?b20yNHZaRVltREhRbzM4WFVSQXFvbGwrbndhbGNodVhmaVFGOGtiOHQ4WUJp?=
 =?utf-8?B?bWMyZ0FhWnN0dnA0cGRncFRTT1FoQVI2MkRYUGJqbkJ3a0gxcnA0dFN6TUZm?=
 =?utf-8?B?aHY0Ly9xLzdJM0V0MUF2QytoR05YNlFiNzY5UkRadFE3aDVybzV2emFqSGZF?=
 =?utf-8?B?YUtKMUV2cEV2WVZNbnpzK3NyTTcyajcvUXhIOUFwZ212K1o0TEU2Qit2VmhN?=
 =?utf-8?B?MDdpeXErTmlSNTdVVVgza0xRYWVjNitwbEs1SExHcWJRKzdTUkdVbzl0cEdP?=
 =?utf-8?B?Y1ZIdnRZWWp6Nk9IQ3Jsb3pUYlRXRGNlbUswVmlnY2dUWDl5TkFZaEptekVx?=
 =?utf-8?B?bjJsT3dYSmJESUJ3YWloMysrS0JUeFJVRkpoMTc5VVl5Q3RORUc4c3JrMklq?=
 =?utf-8?B?S0hIcmJ0T3hxbGZyQ2o1UktsQ0JMdDNKTVE1U1hsLzVTSVkzdmE1R1ZmYUE2?=
 =?utf-8?B?c2xWa0Mvdk5KWWFnY2pmSlJFM0E0aFJ1enVURDFXbHR0WFhnaXN5YXp2UXZ4?=
 =?utf-8?B?cFhMWkN5ZzVvVlRaUGEwVTNveDR1YWJMNFlaMTQ1RFN2dkJFTUtjbGhlc3Vm?=
 =?utf-8?B?YkszbThjNFBlM1pJZFpyY24yWWF6K2lucXY4ZllMNG93NitIRXRxaDBTMWdD?=
 =?utf-8?B?SXVFQ3FCbVpFZnhoK3dmRjNvZm82S3dKRmZwQUxBdHMrejBRcU4yMS9GWVFx?=
 =?utf-8?B?Um1yejVPRXY5SEZRRW00dTdlcjBnTFBqbTdoY2tHV3J6d0drNU9PMm1oR3hF?=
 =?utf-8?B?eHZDVUlJcFlTWkIrV2FyRFY4eUtkSUxlUXRjcXVxQ0YwWno2SXBBUjBESllx?=
 =?utf-8?B?cnd1MTd5MVUvYzhUV0RMNTdURUdTR2lHNGxpZDVIVXFIOUtvang4RVIzMEVK?=
 =?utf-8?B?RzBhbDhvZXltZjBxNlhVMWxuR2cwRFpYL1ZJNHgyalNtSWp0cjVLSG1ja3Rr?=
 =?utf-8?B?Z2ZrL09jdTZ3VjhzUTFQbWFiYTRPUnh5aG5PMlBCNllRRGQ5SGhNWE1Nc1p1?=
 =?utf-8?B?Q0k2dGY4YUxhdWkzeVhuRDIwSnNTNUNXZ0J4aVBzZnBsUjZ6eUdvZitFdGsr?=
 =?utf-8?B?TUVmY0pFMkt3OWdqV0ZHaEtBbXhsSFJxbmcvWklNa3hqR0dMREUxd0Y5UWln?=
 =?utf-8?B?WHNMSCtDdW9DR3dZRzZBU1dLRlFuTkEyUk1WSXJ3blBqR3o0NldXWmd5bGhF?=
 =?utf-8?Q?pUrG3+dNF5b8xf3GbO/5FOqt6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nDmpc4lI5FYRJseTu0FsOSvQ2sd6RFyY+/1+opAFnWiYp7DUiiANiayfUufTq7KlBjKparQM2TIWALZe0d4a0w4zRmF+ZcuKZc9q1h+nsU/3PjWBYnLb0k1zZSnbqJ9qZe3GQXBSSoBY/wFezlm6b/78dAtGoFLM+F2ebEEbnz05YJcXvCUm141YPTeabeaapvuFDNkIvdgjRkSpx3G+UaBtrhZFnrkiezHGwaVvsSKI7VL80pvRGw52VnDFSaou9kJyWKMyN23I8TDpHU1tg16oQcLLqyJuYmax8TpKkMKgGaIlrl3It6M+s6WcI0tAkqOcZlP/u19Kkr8rpPpm0NedDC3G2+EmZZqC9fLPuUz0qONjcmhy+IBEEL12ArrY5vm5Q/nUXGFl+5HfwrpLysHkxYM1I9UtF3PyEEoKs4dn38h03g7o39h1mBbxqqbUVjBE86XNHLErhau7OzQ8ZvOuVG7pK6llp6I7U6p4A6lcvb+iIrb3AkRle2GLXBjdwMQlvy060xtP2sRm4Y+TFoRSYjMgihJXUcUIrGoqYfb+CAIPZ+ciX1jcb4f/lDZ96GTc99EF68bO/SZBiuagSZClCI8gNwtEFwXg2WDRF38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c1f94d-79f6-4c60-4e5b-08de0776d4cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:00:09.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6h350qZzJr1KidraIXqfzP7FPdhboD68nRKItbxwY4cSfxQVOizxSJBh5654WJL5KqFDng1wqVi9c4eeL9qeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8419
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510090129
X-Proofpoint-GUID: eOUHiZpIOjg0chcS7LQdPXWsbA9TRJUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXxvfgzua/s6RH
 EdTIU7zh0wU+RabiR+E/YJf5ZE1L9Knn2JSXwyD73K8h3wul8tfqu1IKwfirr/0JJY7jQIFE+09
 meWF2yf1PRm2bpYeNxUYl7MZtDklLERm04gSCqT0fg+i15EYMBvWz/zPbNj4EBMHRm8SNqOz0uV
 nbXIhHAjHYnSY8sOmhHvFv590fWyDz2dgtdn4nsqWK19NMvUp1HqFh4wMeibf2vbkoE/S7KOreK
 XNHFbrPjbDw/QP0LDPVJnhYWr/orXk1SnxmMPVeQ+JLD5FWgpW+eL1cZBreHud8w8xx5b8udCDF
 vIecqCLRl+k8qIbcoNf1Pmuhrr7jBQ7uERj9qKNffZboko/ib0NOPmv8k5P6NmPyezDi+9kcFLH
 h4e4PkJF5y6kqx7WvmTW0SDtR1fL9rolvMkEIBe0/TjAdW/Jg0w=
X-Proofpoint-ORIG-GUID: eOUHiZpIOjg0chcS7LQdPXWsbA9TRJUX
X-Authority-Analysis: v=2.4 cv=U6SfzOru c=1 sm=1 tr=0 ts=68e8225e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=kFeDIgo7kkaU_W6QhxIA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624

Hmm, just to clarify... you mean pull this patch out of the patch series 
so that it can be applied independently of the other fixes?

On 10/9/25 13:03, Kris Van Hees wrote:
> This patch does not apply cleanly to dev-queue.  Can you look into that and
> post a v3 (keeping the R-b)?
>
> On Fri, Sep 26, 2025 at 03:05:54PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>   doc/userguide/index.md                        |  10 +
>>   doc/userguide/reference/dtrace_providers.md   |   2 +
>>   .../reference/dtrace_providers_ip.md          | 174 ++++++++++++++++++
>>   3 files changed, 186 insertions(+)
>>   create mode 100644 doc/userguide/reference/dtrace_providers_ip.md
>>
>> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
>> index f3d96a4d6..18b9bcd68 100644
>> --- a/doc/userguide/index.md
>> +++ b/doc/userguide/index.md
>> @@ -208,6 +208,16 @@
>>               -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
>>           -   [io Examples](reference/dtrace_providers_io.md#io-examples)
>>           -   [io Stability](reference/dtrace_providers_io.md#io-stability)
>> +    -   [IP Provider](reference/dtrace_providers_ip.md)
>> +        -   [ip Probes](reference/dtrace_providers_ip.md#ip-probes)
>> +        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#ip-probe-arguments)
>> +            -   [pktinfo\_t](reference/dtrace_providers_ip.md#pktinfo_t)
>> +            -   [csinfo\_t](reference/dtrace_providers_ip.md#csinfo_t)
>> +            -   [ipinfo\_t](reference/dtrace_providers_ip.md#ipinfo_t)
>> +            -   [ifinfo\_t](reference/dtrace_providers_ip.md#ifinfo_t)
>> +            -   [ipv4info\_t](reference/dtrace_providers_ip.md#ipv4info_t)
>> +            -   [ipv6info\_t](reference/dtrace_providers_ip.md#ipv6info_t)
>> +        -   [ip Stability](reference/dtrace_providers_ip.md#ip-stability)
>>       -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
>>           -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
>>           -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
>> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
>> index 9f64935c6..54a018d5c 100644
>> --- a/doc/userguide/reference/dtrace_providers.md
>> +++ b/doc/userguide/reference/dtrace_providers.md
>> @@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
>>   The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>>   -   **[IO Provider](../reference/dtrace_providers_io.md)**
>>   The `io` provider makes available probes that relate to data input and output.
>> +-   **[IP Provider](../reference/dtrace_providers_ip.md)**
>> +The `ip` provider provides probes that can be used to study IP traffic.
>>   -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
>>   The `lockstat` provider provides probes that can be used to study lock usage and contention.
>>   -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
>> diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
>> new file mode 100644
>> index 000000000..4e6c47fb2
>> --- /dev/null
>> +++ b/doc/userguide/reference/dtrace_providers_ip.md
>> @@ -0,0 +1,174 @@
>> +
>> +# IP Provider
>> +
>> +The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
>> +
>> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>> +
>> +## ip Probes
>> +
>> +The `ip` provider provides one probe for IP sends and another for IP receives.
>> +The module name is always `vmlinux` and the function name is empty.
>> +
>> +## ip Probe Arguments
>> +
>> +The following table lists the argument types for both the `send` and `receive` probes.
>> +
>> +| arg       | type            |
>> +| :---      | :---            |
>> +| `args[0]` | `pktinfo_t *`   |
>> +| `args[1]` | `csinfo_t *`    |
>> +| `args[2]` | `ipinfo_t *`    |
>> +| `args[3]` | `ifinfo_t *`    |
>> +| `args[4]` | `ipv4info_t *`  |
>> +| `args[5]` | `ipv6sinfo_t *` |
>> +
>> +### pktinfo\_t
>> +
>> +The `pktinfo_t` structure is an abstraction that describes a packet.
>> +Detailed information about this data structure can be found in
>> +`/usr/lib64/dtrace/*version*/ip.d` or
>> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
>> +The definition of `pktinfo_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct pktinfo {
>> +        uintptr_t pkt_addr;
>> +} pktinfo_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
>> +
>> +### csinfo\_t
>> +
>> +The `csinfo_t` structure is an abstraction that describes connection state.
>> +Detailed information about this data structure can be found in
>> +`/usr/lib64/dtrace/*version*/ip.d` or
>> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
>> +The definition of `csinfo_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct csinfo {
>> +	uintptr_t	cs_addr;
>> +	uint64_t	cs_cid;
>> +} csinfo_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `csinfo_t` from the `struct sock *`.
>> +
>> +### ipinfo\_t
>> +
>> +The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>> +The definition of `ipinfo_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct ipinfo {
>> +        uint8_t ip_ver;         /* IP version (4, 6) */
>> +        uint32_t ip_plength;    /* payload length */
>> +        string ip_saddr;        /* source address */
>> +        string ip_daddr;        /* destination address */
>> +} ipinfo_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `ipinfo_t` from, variously,
>> +`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
>> +
>> +### ifinfo\_t
>> +
>> +The `ifinfo_t` structure contains network interface info.
>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>> +The definition of `ifinfo_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct ifinfo {
>> +        string if_name;            /* interface name */
>> +        int8_t if_local;           /* is delivered locally */
>> +        netstackid_t if_ipstack;   /* netns pointer on Linux */
>> +        uintptr_t if_addr;         /* pointer to raw struct net_device */
>> +} ifinfo_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
>> +
>> +### ipv4info\_t
>> +
>> +The `ipv4info_t` structure is translated version of the IPv4 header
>> +(with raw pointer).
>> +These values are NULL if the packet is not IPv4.
>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>> +The definition of `ipv4info_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct ipv4info {
>> +        uint8_t ipv4_ver;               /* IP version (4) */
>> +        uint8_t ipv4_ihl;               /* header length, bytes */
>> +        uint8_t ipv4_tos;               /* type of service field */
>> +        uint16_t ipv4_length;           /* length (header + payload) */
>> +        uint16_t ipv4_ident;            /* identification */
>> +        uint8_t ipv4_flags;             /* IP flags */
>> +        uint16_t ipv4_offset;           /* fragment offset */
>> +        uint8_t ipv4_ttl;               /* time to live */
>> +        uint8_t ipv4_protocol;          /* next level protocol */
>> +        string ipv4_protostr;           /* next level protocol, as string */
>> +        uint16_t ipv4_checksum;         /* header checksum */
>> +        ipaddr_t ipv4_src;              /* source address */
>> +        ipaddr_t ipv4_dst;              /* destination address */
>> +        string ipv4_saddr;              /* source address, string */
>> +        string ipv4_daddr;              /* destination address, string */
>> +        struct iphdr *ipv4_hdr;         /* pointer to raw header */
>> +} ipv4info_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
>> +
>> +### ipv6info\_t
>> +
>> +The `ipv6info_t` structure is translated version of the IPv6 header
>> +(with raw pointer).
>> +These values are NULL if the packet is not IPv6.
>> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
>> +The definition of `ipv6info_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct ipv6info {
>> +        uint8_t ipv6_ver;               /* IP version (6) */
>> +        uint8_t ipv6_tclass;            /* traffic class */
>> +        uint32_t ipv6_flow;             /* flow label */
>> +        uint16_t ipv6_plen;             /* payload length */
>> +        uint8_t ipv6_nexthdr;           /* next header protocol */
>> +        string ipv6_nextstr;            /* next header protocol, as string */
>> +        uint8_t ipv6_hlim;              /* hop limit */
>> +        in6_addr_t *ipv6_src;           /* source address */
>> +        in6_addr_t *ipv6_dst;           /* destination address */
>> +        string ipv6_saddr;              /* source address, string */
>> +        string ipv6_daddr;              /* destination address, string */
>> +        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
>> +} ipv6info_t;
>> +```
>> +
>> +**Note:**
>> +
>> +DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
>> +
>> +## ip Stability
>> +
>> +The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>> +
>> +| Element   | Name Stability | Data Stability | Dependency Class |
>> +| :---      | :---           | :---           | :---             |
>> +| Provider  | Evolving       | Evolving       | ISA              |
>> +| Module    | Private        | Private        | Unknown          |
>> +| Function  | Private        | Private        | Unknown          |
>> +| Name      | Evolving       | Evolving       | ISA              |
>> +| Arguments | Evolving       | Evolving       | ISA              |
>> -- 
>> 2.47.3
>>
