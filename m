Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B323D7D6
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199641; cv=fail; b=DOXYuKMINIa2U2ZXPweXYrCVWqKhAzgRUR/b7NIKs1W4+aLZRbhzlG+oEhQeYBD5OGqJd+yFnwuY+15/mFtlcCxYiIt1oc4HZss+5qvRUrsSgv2rMT2jkrZRawbu4jx8fSQWrWYAiZIZ1GUz6ctQOx8sA1QPt56Nc6kA3/gzbj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199641; c=relaxed/simple;
	bh=QhruV1TJGaUjgNqx+77jRFPof7yoaOW4UVWQea2+faE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qN+jD0ebmy+0SvviZopUoMbiYZedAEsKAl1XMigsP+dUrBII74EvAuyr8X0gyFz/PgibZlQQpgWZa/sxWutRCtJCRWIU7t7PJln5l26m0NtRmaLKyFdcITT2owDazKC0FXW7+aFQBn6l8PWKbyC44ijNvKSHqxSZnswAKICFAxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CXfvXT3x; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GzVlyIKU reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CXfvXT3x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GzVlyIKU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfo5B018365
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FIYDJOH1TiZDPSH9diPgAI4UqI0UChr+8Ssu5EL0VII=; b=
	CXfvXT3xKeabElgSCn2bRaNttTOfDeXWyiJAmEovv5YqHNc9Nfv831xOuX64EPyy
	Aqi5pKUBf0nyH8rPwIvKlijZ6nFhyUvu7iWrlPBbfoElVNGPtmRXfWCvGLfzlG8i
	wZsajqGeCsj+vqnN63ss9q9G6iX0UM6s05dOMhKac6+rseMBUOhGtOOIskmssWWU
	ZyaYDWAp6RnV5wx28KwGX20navb2xXxLeaZnKlv2Se8lhJ2TnC6zxBy1tosqx4BU
	/mXYrIWR+utxaRAMKJOEPSq6K0nPrq7xdJU2dpIxLClv/gkW1Rww+V5IhoFDQ2yF
	GYTtydD9TX5FZD7FhtDenQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchb85g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:27:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIfBr2030436
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:27:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd5bfx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G833yxY5395gUC0uxeYJISbIFbxx5n2Ccwd2F8TcDZ+OoYCchjgkrT5ZiJMhF20cEj2uwVdNkptWTsGHAbH6zU4B/dDIOJLbvC17XmeOMut627kGbez/zozMXvhBOK4BrQ8JBDsvi5TEe++NE6Zc3vTTxJKNoYp9mOedR4mCR2FpcetqSt75cMD/Qh7MOJvg48og7PnmLHOWOW7XFitQ3Bgc659DhS37lPOIybVdeo7+ZBu/6YKRIoJHwD9vSLPoOsH97lqGBKvNIqJqqiWtBXfw6fI0n4oGmEANK1q5iDHzTi1CmghS6MQkQVIWO0FrgYit6fAVVip7vS6H8V9SQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8kPJEjjLukaXOZZhwzpK1Fx2JpPcbg9HYwm1l3bS6I=;
 b=YSN5cO+zJOQLGrsBgFN/oEqBPf85at5WyCf/JsGTEGwCFqMQsL3P0UYdb/uCF40ZhxwYW3gM2J2KkJcEOPAPpozVFgar2EaSNmqqel4ZGu3RyRViYrMWV2TTFEq/OVPRJzorZaibEjv0ws2Y+jbDl/AiejszbZc6Qlfw2ZDauN+u77bcmCWKAjcJmkxfcVFaNCfzbsHLoTzTic2KQB+nF5KbWi+xvuaxQWDL2vHRVI0Uvx7MNO2Urt6dm1KZSydwSfDxNdFqmBpTc0ybGvlYbpgmc7PspOq6grYtExdKVzwomV5YY5ESbanmdu5zNX3Ag44bP/zRfAJq05VM/I7BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8kPJEjjLukaXOZZhwzpK1Fx2JpPcbg9HYwm1l3bS6I=;
 b=GzVlyIKUaJe5GRYL9QovZsocRSsDP9MktrqDr1NlCIIGFq9djegjtvQYMsjL2rCyMz57GGzqbmduAfTolD5+f0uYakedY+AvKsE3J5i0oGFHL0Qmym7qBrRBu89JhuYWnZOxbID3xXZDoFIg9Yqp+7+DrSYnCzgH/NYS/nEo9rA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4544.namprd10.prod.outlook.com (2603:10b6:a03:2ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 19:27:13 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 19:27:13 +0000
Date: Thu, 14 Aug 2025 15:27:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] uprobe: do not call populate_args() for
 pid probes
Message-ID: <aJ44jo+ogadLIWau@oracle.com>
References: <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <8e075b06-1d39-3d9c-3924-61e948827485@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e075b06-1d39-3d9c-3924-61e948827485@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1f6bef-5a76-4c8d-b815-08dddb68920e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?lAM5wl72bOEmCw+9JM4tSu+V9W5tdtVJofRY6ts0hskZ5azpRaOqWIYPB0?=
 =?iso-8859-1?Q?TkP5HDHLhL3mLli9Q2pwPxOk1kTy8LOUB9v9wsq/gjkK6YtspLlhIp32uh?=
 =?iso-8859-1?Q?unwfW7SHXd+BogPHqxL5A6Zf8Q+ZMs6kfHUaA1U7EJ+LdKWM9s2vkvghSF?=
 =?iso-8859-1?Q?NOyA7cnEmD9PGVzYWbLvpf2rIHVrek5eid33dDmQywh+74qn2hCNBM98Uq?=
 =?iso-8859-1?Q?vL2SXPx+DyzozHeh8qB+JQ6VC3m15BBM8AiEvA9h3h8Mrp3T2VyZ6Z+jHf?=
 =?iso-8859-1?Q?L5/+Weq1FXfqCVz+BWzFPn5XgEKpYXPH+s1nuIYw4nJUaH3aHT60E7LYtO?=
 =?iso-8859-1?Q?Kc+ApbomUaRYmebkGmAeWFovG2I4CbqlXPThMZfaOcyCdEZq1dY0NVxvm5?=
 =?iso-8859-1?Q?QkQs5OcvLEgl8lNjC8r61lE7rCWKI5CEOYQ9MZcQ3h0ElB3B9Jb9baquTR?=
 =?iso-8859-1?Q?EyIihOqKdWo1dGGXE+SsklY4G/dtxE4RutGXovTy9oepBBnuq/GPj/pwTH?=
 =?iso-8859-1?Q?eufdmza9uFPaO+d4jtnlh3l/A8VdZwhRSb9AE/4f/nxSzNUXOjkiU9bH+z?=
 =?iso-8859-1?Q?iyAN8YehmXsNuU9K9kpaMz/tRv1IkfkQ1M8cJ/qLcP1hO4oxud8jJ+okkL?=
 =?iso-8859-1?Q?kGhbqAk9H+gqbv3flE8yfajaMtDjOOVAwAmdt1TOYyt66nLE2agj9voHt+?=
 =?iso-8859-1?Q?CVM1D2wTrPLJH1OSNSL4Iop95WmoEwTJU9f95ZRoVhxsZEv0PRa1z2IZl1?=
 =?iso-8859-1?Q?IJTkGJSKTLxybCQYMzXEriflj6bl29ijwA9ZN+UBRLkK8nMiCvO76xxir4?=
 =?iso-8859-1?Q?CyHC0HwSQEU0PtNVFafWC76aKsuqth2/clG4oz5LXm+dFzBtexHgNGmcLJ?=
 =?iso-8859-1?Q?C/dMtCl6qqwick96SKDfI5Hs39dbiST4LdOwHcPR0o5yJagqSooaQP0wDh?=
 =?iso-8859-1?Q?k2dcx/+vUni+AoT2QJj8NimuklNxIHNL5nhcn5Wkq8yeo9Ggfgm+h/HRSZ?=
 =?iso-8859-1?Q?+pEz/TAKAKQGFoDoswYPMWEBaDh6hUU+Li17KE8xN2Xdhinpcp06+PEeGd?=
 =?iso-8859-1?Q?FV2rhyC29+Dq3JkyNGeG9VUtAMRLQ+r82jUiKbnGGUjOWunZzQUATcGhwq?=
 =?iso-8859-1?Q?Cfyh4nR0GIlPrJUcmclWFAFhdFX4CHRSvpbsCVJzPWxzutZQR6sLzULjV6?=
 =?iso-8859-1?Q?YLhjbN8wQ9Vp5Af9IFMvUl7xJi6H1fF8RfodmTnBP+4cvzX2pAd52jBAja?=
 =?iso-8859-1?Q?BT3qUtwdRPEcke/7i1B+sBYTA0PmCkXcBESykZUUH7mnAmF+JblHQo8+GX?=
 =?iso-8859-1?Q?I16DPz2ugHFMBv65Z9ZQlu9Rtgfmoo+fcfrXCzA/53LCZ8XrvOiJXzGnl4?=
 =?iso-8859-1?Q?IoiMn2UqADWYh6K/wTKpLJsM5hlcQfAVXVnUx8mwYPDGgV+65XEea4WiZn?=
 =?iso-8859-1?Q?pkg2l2OxP11SjE6+JqyWw+gAjtYd/VYn7YaNQJGHcpvZqgT1hzOoIJhe5A?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?p1/De8/Xhe0QFksNI1Zy9AwyIuVF44y5bdNYKFzA5RJ03ew1QLdOWmGNUL?=
 =?iso-8859-1?Q?FT2bDSxOh/UQRhPdyLVfqQBhhD9Cp8QVsDFnjqKS6blFRoRRW6mK2zgYZP?=
 =?iso-8859-1?Q?B6NBeI4DbYqPq3M5iYsbOloU0L8ssqGuPZWQ3KM5R6Gr+uU72dQ4YQKXwH?=
 =?iso-8859-1?Q?hXVRlR+blJOHykKivkxmYuuf5J1BIRDp40QxeqACY5DWyLzHsLhbZXaxwU?=
 =?iso-8859-1?Q?PQ/Ei6cp+FHZZViV4boY2Qh0J4pbj/Lcq7Xe1eof8PJ1hpDpREzJutaivg?=
 =?iso-8859-1?Q?BVrmwAMWToLfRamEHFXD3IZ3gct1DNJE/gUzQJQ2nmM0o0ToS71HeQd6yP?=
 =?iso-8859-1?Q?mLF2opZ0oTdZqc95opvEWFNFQwSk1WzcG0FiOS2tZu23JdGo3agRUm/f/i?=
 =?iso-8859-1?Q?YVGQiJjJV9be7Fdq1LPFsnwxjjrKCmYOUrQdF99f6dReiV764mRQjVNssI?=
 =?iso-8859-1?Q?i7d1KKP0NgSWwTD87O48VNu1/mucqeAGxUkl9Rbq/Rq0ihcJMcNbXKDK3U?=
 =?iso-8859-1?Q?picL0l2SGj7D/6g1Mp5e6DEG16Nkg1J0jQ2DKV85AM5WA+PtnrbZGF40SW?=
 =?iso-8859-1?Q?KXPamagRMtnarglXGdLmDfUx9rZ8S4POTJhmG+z7L6V8ePU/hGArmnkOeu?=
 =?iso-8859-1?Q?hU8dQb0ZgVaTxqopl3npT+2Tpk+2z2eXrsbwLgWNWt0VvJS8FLp75KZkuH?=
 =?iso-8859-1?Q?cqJu+gGRYEqCOKXDblMmbqrvtNiiHlY1QggHx6XjGu6E8CPikWffcZrUPF?=
 =?iso-8859-1?Q?/w53dXzYXwNnwXeB3DnmCcwa47/SaidSzL71hKInBz0H0faxy6aWxYETsx?=
 =?iso-8859-1?Q?XZn+DupEvExA+SZWHigXPoHdUdDsyitJ6tj+j5KltZaYcjsBm0EkVCzIxt?=
 =?iso-8859-1?Q?nehtsAgtQ0NH3M5Hvkq2TAIpdBZhc/IIDlFUu7mb0Q2Wp33NBfAtdAKwG/?=
 =?iso-8859-1?Q?7whEdAoRz7BirTOk61tBb20h0iNdlMqiWPTqiJxo/NfvKuXss1JCHOG+K5?=
 =?iso-8859-1?Q?0oyH/QJKJuLecMtrR/2lOZBELcr6P7yGPKKDqyEIEjgvM42OFxBs1po7qx?=
 =?iso-8859-1?Q?VknIkqqioOHsrsdm2FhjgWtz4/zdGE+DfqaQSFAJb1tQR69FLEQ2NQWaaM?=
 =?iso-8859-1?Q?tJ65+uIbTAzGiwVFRK57PQog7Z31GiIyy8r0U+hjoH5riBSwwSr0qWwxTW?=
 =?iso-8859-1?Q?Id0joDF286ejNtwV9YREnFmG9Cwv8edCLdoFQzDzgkQvPbHOJ1cBVke4WG?=
 =?iso-8859-1?Q?gJISNwNHX//gvkV9OdtgOHzUAeUhBWcGqSowbybuZfpBosgvfrRl2b/lwo?=
 =?iso-8859-1?Q?koe1/HDVg18YzDiqnAOdoAEk3FK9tWQ3v2v5L2/P+tYLfhTcG8loqJHtj9?=
 =?iso-8859-1?Q?ZMb5ncemAbiWbdmjLNUgjJJQ9NigNUIzBrdqsa+R+/9K2ypfMRFHxl72t8?=
 =?iso-8859-1?Q?4elDTxzwjwriJJZpcROkGj8DmQs14FECmyybUwOK6BPgp5twPZmV6pLtKa?=
 =?iso-8859-1?Q?p1holXELvCn4h7eRaToU1bUIG8nKorYnt4z+qevR6888GuxsEECjCkVB3v?=
 =?iso-8859-1?Q?GGA82+AxgQcsuBYFWLXLo7E23krhWnt3MZPZ20Zu6840QlhgXIsaIieIk/?=
 =?iso-8859-1?Q?OLk206AzBlN2WgwXPrNCYoMrVeeVfTyBUe+khq1pRzfLcB/dptgDf0CA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xsePfVXfZgeAZaYSrBu/6UKJV1dyg5O9AQqifdgRVF5Npwo1nAzM0xtlCrqqqkXSrGGe7TlIHf5s8EM67hgwIlXTd4G5q9VYGZYAMbLL2f+LSzYCjjBPBpaDhfv66zc840PCHs+QBFTWhe/zZ23ZLXubjut4IE3zDUflQoYR0V1x8f55XZtc+0GSdTfzK88T7frNr1DlWI0OWYfLBjjC0BcFYKyPt6ti/9z/QEYBHZdPib5dovIZMLDeCMlKtTzHpvZTjjurciIcULNm8Yh5D+on+QKl1WFhgCygDZ3X7CfS0O0gT60LEBW6WZkR14ZRPlkRtsF1L8jRhiMVmOjKFbGeJd6qwvFzFfmLiMgN3HSnEOJyis1YAgQ/xjGnGmxRofjB5oRC24ypQtk70yLsXhKO3Tus97Gii3CMQLS/RMBZ2CfP/nQQsCsVOw/20e5tF/CLwRx1sCbIRBxh4S0T+6sZi6wLU5RDUs2XrY0nGyd1HLkSQVFFydJH3IDDHkyTIGSvzbymPDGhsAppYSeVLOC12+NrBXl5XEdNn9/91DdEqfLvnXVWxmOzrWHgbNbfFDLXfwIn9kVpEEUf27hKinhiyHD4BWfuYN4mJHoay5I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1f6bef-5a76-4c8d-b815-08dddb68920e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:27:13.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce0SQ4WpBBoN488Z0i5yNfTH3luCA7hhCsiJMeeEIGZhQYi/7k5OGsMUloXHsJs2Qge6M1XMHdwJvB9MsS6/CSZUzsScmdVtffRma9PyE+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4544
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140166
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e3896 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DUroB-r42KcYmkJux0AA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: G568Zsb7UFgb2n_l18ovtMcEiEqsCG18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE2NiBTYWx0ZWRfX3dlBxYkzBD1U
 G2JXZH4jARJ1ZM/IdYGF8j7+q9LaxwIT37SAxit47vEhSacWScboZZzoP+BCA2qMLSnxllxWP5U
 qQJiYUDdoQhKH6LNXempxZTwQifMhIpw9+VmpMGw5tAWrjGGkHp1zadAhmTHYrE0qz9IiJA0VNB
 fwG4v22pTB2tn6fLttYPl1yaXOf5s1wFzkJabi8ToZGS2Eo1NRIryOshzhk2JUFjXg1NSOPNhqM
 D/VfiCAc0MZ3KYdry7SgC8BMyPqu5ciyY5gZ0qcly6Lkkx8xFjAkjYD9iYayFXhifD9Pon3eBpf
 /BAtz7Zol4JZOQ/wZHmu1Yxwnf9DXWNL14IVDLYocWixgAbUQ6sWBovHMF+lrt2r4xDsFn4exAJ
 3JIhLjry0cWII2TagTpbzqMUACBT3H/P+jDWPaxsuyWjd04FbVLg1PI0SHXaYnQr6z0xTbD/
X-Proofpoint-GUID: G568Zsb7UFgb2n_l18ovtMcEiEqsCG18

On Thu, Aug 14, 2025 at 12:47:25PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> FWIW, with every patch I wonder:  "Are there any test issues?" (Like, should
> we test something here?  Were we?  Etc.)  I assume in this particular case,
> problems were revealed by patch "Fix various memory leaks related to stapsdt
> and usdt probes" on tests
>     test/unittest/usdt/tst.pidargmap.sh
>     test/unittest/usdt/tst.pidargs.sh
>     test/unittest/usdt/tst.pidprobes.sh
> The present patch is simply to remediate those revealed problems. To me,
> that sort of information is useful in a commit message.

I can add that in the future, though personally I don't find that as valuable
because anyone would have run a test prior to this patch and after the patch,
would notice that anyway.

But if it makes it easier to assess a patch, etc then I can add that in the
future.

> On 8/13/25 23:58, Kris Van Hees via DTrace-devel wrote:
> > Only USDT (regular and is-enabled) probes need populate_args().
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_prov_uprobe.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index c63d58383..605ae8397 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -994,8 +994,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
> >   		 */
> >   	}
> > -	if (populate_args(dtp, psp, upp) < 0)
> > -		goto fail;
> > +	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
> > +		if (populate_args(dtp, psp, upp) < 0)
> > +			goto fail;
> > +	}
> >   	return uprp;
