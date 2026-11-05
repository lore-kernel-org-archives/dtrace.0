Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900022;
	b=WaF+2MF8ksPr/KIt9XlWhPFDl8PLZSPD1i7UP07VhL5r0LYS9gRXR6+esvI9lIK6hbY2
	 kjegcE56/DZQWL7ypfUl3p88u96tZqg+1UKlnBylzpqkycTYlEWNdc/1dbgTsgVZw7RMt
	 gwmh/qu2ebm+YkEmKsjB0N2L2D15Gu5owIoW7l0AZ7ZIBNAwpZne5j1bIl8LckVMTHU6E
	 W/SOJJmBIYQS1DyyT+5TElRCHS8lhT+/oEMYp0mk/isRhrpDy5ZNbfLMv8JAEmiT4lJyL
	 6YqHJHblm7tuSQSCpTx7SmUNTLvt67SCZGj8eiSkX0M46oP7gxevTD8WyKGtmbFbXzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc;
	bh=p3ooEqQIPaZoFAAoCkE4LOsdDZu1WYxD/kUi5sWUTic=;
	b=V2zkwCTnaW2mn1bp+LSR2WtBiza3E5nxNwnWKFmrP187Td2/XGv+If61c1bN+uuWKuN+
	 3PF//+h1TIYcBeOrqc+yUcUxJ1L5OeGsn/7iPMztpx25kICS1cmzg4ssQbznJL57SIBGs
	 wTFdeq6yL9qRatRuvyg4wLk7ltArXpdRlBxopu7OwCa6B3G9YP+JGmlA4/ysdEekp4dPv
	 YJQjHC3KRA4QR8MgKfisaq3xY31p1rkr01wrntlDPTaQhMOLj5JFm/GhKSOWEFnO3UoAj
	 vF8CO2mdM6bH/kpBdy34lYlByURr+MNln+S/d3I/tzSSg5OOP1TvXpdqXTbaqwN+GGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jBmuT707;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WhhGrs3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34570606A326
	for <dtrace@lists.linux.dev>; Thu,  5 Nov 2026 17:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34570606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jBmuT707;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WhhGrs3W
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DICcX1083886;
	Thu, 5 Nov 2026 17:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p3ooEqQIPaZoFAAoCk
	E4LOsdDZu1WYxD/kUi5sWUTic=; b=jBmuT707ev7/TsPUkqBB1QBEy+C5XwGbWH
	HzZ9SMVf2gu5uJBsS4g/eYlrFZ76Cc6NWKUkKWLLiZvZoVA2m9v0xuKfKK4Z3g2M
	SpKVKMYQoyVi6w4CH4HEC9rmdHJlLfEFK7Rwh8vofJoI+gbgKj1n7nxJC1Tb0UC3
	jYNaFh9ZN2OeVm5eKhR7qaPZfGVTLmSs4ASWqEhhFB/S00q3uc3Rv5bV+p2tsyEl
	WAin9/AIfTlYPTC3rANitco7yDkacj5o58JGgi4nx+fuFi1L9N48RuLww4Rsk99u
	yTUrYlPNod9ntzIcyTex9oMg+kCgVpN3bItOtXwBCJ1v+PAWo7RQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hn7438yyt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 05 Nov 2026 17:33:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5GP2iY1072111;
	Thu, 5 Nov 2026 17:33:07 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hrwa5tstx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Thu, 05 Nov 2026 17:33:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIWqQuax7XM5H0jwk+Tu42o2t/jRcZ19dnREa6p3yjJKPJdC4t5Q8GQ8YS0Dr9ZXgDo/T6OpBQn/NDOa4kIz6O0yXWvLA2R7vQysN+1fLgdW6mUcaf/+fmt/vQZEdxIOsFsylZxjkUW/nEabnxSEc8cW9WyEiQu1vg2Sul5S1BAqgenVBMB0/LDH63VDxWpBdu1l+Q42Y2dOQBuC8MeqSiFRvoJbHtT3OccKBl7NjyKghCP7f6KzoojtQfVfhEWMh7Y/UyeTCM9LCl1N5KUXAQuHng3o0ZBoWE6LTSYqwbR5WrZ14gc3m9BHr6NoiS1Qefiglg7II9X94rSGjdoQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3ooEqQIPaZoFAAoCkE4LOsdDZu1WYxD/kUi5sWUTic=;
 b=jqptddkazHMPG6ZQT3yRcBOD1wal4xwTXgmwXcoOV5nDodmtvMQP3IzbFG0VaJtmdexiKHPYAAQeORq3z9thGOIRo6qnb9DQqHrBwCVjrv7NarASOnhzuehqxQRy0932qpOWKFHQfPWmGbUA5i6tOS12uryqVLQWxyeZEN0Zw21acLVZz8tNqHdo3HdprS9c0ZdRoODoG48jcKVWWZqrhBXRnfabKpXUBYDGGiMdkdC5sj5CoW6aNwZxT6/MO1+uHQ0Ld1M+bqSqt2Kred5hT5O5hYaM5ss5cHukzju6d0YwQEvLeV8KbJ0VwIrNd89w+uqSjDGUMwGFjOB+BmIYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3ooEqQIPaZoFAAoCkE4LOsdDZu1WYxD/kUi5sWUTic=;
 b=WhhGrs3WAtB4A4IkOSl8KBWh+vedqL+OrF7clAawstCaRbQGH06DR1ZmQKPdcGjX1p5bxHGNluvXazJoKGWustw36eVjlKFylXKr819ARxC5vTcUPL0885p1CpTq7FNxV9OAEN5r138ephLTaZ0+Ncs+3A5AKNYm9hR4fJPh/g4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SN7PR10MB6384.namprd10.prod.outlook.com (2603:10b6:806:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 17:33:00 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:33:00 +0000
Date: Thu, 5 Nov 2026 12:32:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 02/20] libdtrace: retain module metadata across
 incremental discovery
Message-ID: <auy9ycnMQuLGDW4V@oracle.com>
References: <10c34e1100164e736b99534a57e74cfa@oracle.com>
 <878q37usm6.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q37usm6.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SN7PR10MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: dde46072-bea0-4b84-0b5d-08df3b62d6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|261028144727099003|261021135927099003|261022075727099003|56012099006|4143699003|261026121527099003|261026140227099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	DzUVIe+rf4dc8P+N/Ho1x8/i4xyUqC0HKRpfbqSS6E9q1SLrJhIsoLl20ADMOnUHTIeQMPniC86efF0/o1EIMt3FqSs+2XDplf+EGTs5MMe1p56yRsbmPl3vhq/V6AG/yA0o2HmDqGac6Bb2fgAEzRGDlxJqLnP3MtnAxecpjGXjFvX+a3VQW9n0ylYXu01Ei/Wl/cHgQzphdZ9/eHKck3sxEYOPT52CDG/ID5n30iH6PJFcKPbZxNVGblZ1wJpmVFCCXatDkVEh8zelWsEC+PiN2gTO/xLuZi9gKTRuBUdogMkUQyxdkY2gflxUUz+bzV/rhkppGjHrCIIqUSMiDcFM7lQ8XUGWOKJcIDDU3S+kODDUV64co7HloXzMnIX1MtgnFVTBfY+egdYMURL3rkO5JJnjvz+KGkhfVn+d1HJk65EeupiQ98SoxC+xJWFYnsghp/iJWBrQNVO0j61m3yxz7kImv7ezxW33kw0UF+Q/FVr+w8QH3qHp98bRVibfKjxGzbSeNSxceDjeRl5IG02QKz1YA3oo2rQx+NxRLxNwwsW/Bo5z1IbvHuVnjTJ1cEeLF+lTfeEIlfF4+xsbrttxNy55fDghB6I9RK3XE3F0Ofgjb72hxRP3CgakwHmOnEfEFTmkfAXYgPzlFMYIHv+vXRYZmeboSpRvtXP/pt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(261028144727099003)(261021135927099003)(261022075727099003)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IyUTHSpVIezxADHSKaiZrj46hVN7FJhFnfhEP3prjcUUuqFraKiZwobNr+tc?=
 =?us-ascii?Q?iLBCraaaHf21wS+jY/qNX30nv8Uu1kFYDwW60hd0EIt+XJyMaEt4JR89AhDN?=
 =?us-ascii?Q?KhJ7izbPDsJz6i3nYB2+mQDDlWbgPpGrutWmyrjFAo5R1y/1F0LaPrmf0ZiO?=
 =?us-ascii?Q?P4tlYK7bkKavmI/jzBu3DjFiBqaz8IdKueC+Uh264KD5qyFgs0rv8vK/BEX4?=
 =?us-ascii?Q?Oyo+PZkJ0Iq+fApeSIWU06Vip62/bLq2bt349EicSNzyPe9R4kSxlR4Y2ptO?=
 =?us-ascii?Q?AVsp7HTW8b3ItNzsqtH3TGrlIZXfLGiDbziuvTxMbrWKKrEAOr8uie5/HnBN?=
 =?us-ascii?Q?vU0l1trFk0mj2hpoKGDY6OGOV13mfgOLydMYL04DYDlgxAh5pU9wn80yhHYd?=
 =?us-ascii?Q?0JWDzvVSQYn6HdNRYIuD4ywMWe15KY/0hMuxtGtca04c+VaWoGwypqbUlZtW?=
 =?us-ascii?Q?S69vmitpjcap5ekoLIKekSxNeQClzeP6nCQ6OcaxdvrOnryy70l/gKL1nHHG?=
 =?us-ascii?Q?TgjCWb57fGZdwUOwDr8TJ9YYHoBa0skDtFlRP4vfgVrTlyNvQaW82GDJpMZN?=
 =?us-ascii?Q?cLN3Bu7zOk5I/0eMkXr1rQYVgbDGwnw9lRIN3YjtI5uXWfMFXqsLiSo6yJ+l?=
 =?us-ascii?Q?+iHYA77nUqDsksiIfVyNcti9uNQHkkvV31O31zmZRjHtg0pryjFqyZlAYvXI?=
 =?us-ascii?Q?RWSlKrk6tj7MR6gwhZ1IcuUTnnoGHLJJlr69H06D+u4i5JSy38cBExhZv/7b?=
 =?us-ascii?Q?Zozjkv4TQ6+5kPpjnK6FVOH9smZ0xZuEuXVXqw9rZH5i+zYMr3c1PTBItyzn?=
 =?us-ascii?Q?dTAx0dMsWCVAbsH5VBnRVsGvRX8KYk1EGnYGCDNgo75TQVxEZ9VGIIl4DfMh?=
 =?us-ascii?Q?kCyCvbVV+hfZv7VjdRtpLvCr0yzwIPxm7U/kDqPEPqnjeaQkVvB8ZVy778a2?=
 =?us-ascii?Q?p6SmW2T+2eX3JBqoYJ24GMmXvWau/OvUSJwTtXD9A78z8QWCdbFAABpgiNJ5?=
 =?us-ascii?Q?wwHGV8xRb9hS2HN77EVWo2wPxroqreo2mogTBfdajhLeONAs1RviUG0bxh85?=
 =?us-ascii?Q?eY8Hrz7Vjs+OOWk1cpu0rlH8PNgiP0wFP+VTra/wNThCZVhs50T6Ka6b9uIg?=
 =?us-ascii?Q?+D2q7J/5vdjE+IyPqjFnHH3M62vpbmmjmcpmgWNXy0T8S5CNkbsnZDzLkqfn?=
 =?us-ascii?Q?piY4yq1jmaMYQIPYp96L4oOfzgTqBb9yJtz7p365Gm3tVIyWKnsda+nWuH/K?=
 =?us-ascii?Q?FXRA0m12LYfNIioQwXa19yhHD9XovQ0xPo4UNh+uR5eTtjKWzLz4pziQJ63t?=
 =?us-ascii?Q?vipmfp1iwKlYS28+qdx1I8OU28W6775xqTfoOGclQvDcTmz7RCPNqjvR+j0N?=
 =?us-ascii?Q?5fbq6fl7ADz3WFUerQiAhscJI9cct+zvcut1ufdrNoLqeOI8J4p01lcc+9+I?=
 =?us-ascii?Q?e094/iOCrIYCNZq33sL2APuzp4ksGklz2OLRuxntwRUmQsVEnmm4gA96wwsh?=
 =?us-ascii?Q?e7ngqhyQohzyJtX++87ZGk7qq/YMfkxr4SAMNl8a8Syg8QltXnvkFrBz4oJI?=
 =?us-ascii?Q?XEemB/9zz/n/ZSaSoyC8kNTMN5/A0+e2ajAw22A3Gy+eYgoFXQXtIp3rpvej?=
 =?us-ascii?Q?3tDIboyFEoWEPKWzFNC8drnwynjQKG9CZv7aj987Ijg2vyulnX24Iyw811nL?=
 =?us-ascii?Q?S+3G8y3nakkVL/dVd5Kyv7qwAx+OAg1yBl3g0/HlKtjt1VVftwBjZGfVCdt4?=
 =?us-ascii?Q?LQ7COBviLA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	lSMhGwWAExr5/EvL0EXQ+tQCDju+S2Bh/CEIJ36QjYimyLJjAOFn13rHGU+peujHgbZwtn6tzdw6biOFCJHixf6G/WkQ3xc5ncEpA4sS+REntqHoRfvderz0Bxm5UwVC+07VVUzChQSUMlkw0h8PWJqGQaiyf5eK3bl8bGKZ1tB7uFnOId9LQ+u+2+yIBpzveHI7mzpe3rN3mFIfj4whvJd/mive0C3MJLKPeXtK+iHQqUz0czOYlohkL8URzm7IVHq5ofMotVC83pnpVwf/6wveM0V2t4EcDdzxrJxkhfHjGbfmiWjSrjbJN05HStdpBCtXbjkDuLGi/goCRcgy4A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NtFNMbG8D8Tiz0MMDYiVQWxIlt6EPkYvDfjcsZDCqi18AWvz8hPl5jF1Uo/5hH74z2/iUfVf50zfomDtZxtf1H9eEl3/E1TI6q1NAPvKxsNz3V9pjafxHlk1baoELrK9f9PT6PeZ3m5ef/67oWPfIBiX8izlrbE5O1mHOQHhN2bPVwie7owDx/Us3V34mAmL9//HlhuMVnHJjMDRQwPVDtr8deQ3AQ3yRLXbNnL9prnlAiNn+BGVi1T0YMJkUNqsZNFTVb4fJ+23LY3qUZ/QpMtEiHe/z1zhoi2uuISBnUA3PhM5QAwc766hyu/5QUlSrDVhJTV61ZMLFQNiqTUFjR0Bgp8TC7O62NrG3BUB/LAmpyfJ/2b8wZUpnOZUyAo59SmMVYzu6CH4nAh+kPTVqauFM528/4cqEsJyjNw+QU+TltW7DGtB9L+BJxmzN8TvA04MwAeCr4+9kwxvqrffCe20vO+4oGanheIxmsVDIwA+JQAgPFHlHJ37LC1/s8k7o8ZvTpmLVVk9xL8b9iQKLaiNz0cH9TgL2RuSQIej6gDxLjXX6QcaVK9nsM6+8izqiN0FYPeZURRu3tfSkNM1G/kl29flsnQXwPcproefJdA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde46072-bea0-4b84-0b5d-08df3b62d6c6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:33:00.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anHRdvR65BDz/ykWr7w0ccGlouXerTJ1eI1NDZximURgR/P4mZ+Tw0krfmNQaPFVJ+P5OGx8T/z3v8g0Df6DqgB2qrGqhdVpJOFT/GAwg1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6384
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxlogscore=790 adultscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050069
X-Authority-Analysis: v=2.4 cv=OpXaWC/t c=1 sm=1 tr=0 ts=6aecbdd4 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=vbyJIY8eAAAA:8 a=aGp4MUoBzmTmc0UXWwAA:9 a=CjuIK1q_8ugA:10
 a=UXyj_mcEdvtx2GLQwyJ1:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12100
X-Proofpoint-GUID: qH_J0GWrrpJblCbUQdqtuhcXnEwnZ9UW
X-Proofpoint-ORIG-GUID: qH_J0GWrrpJblCbUQdqtuhcXnEwnZ9UW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OSBTYWx0ZWRfXzXR/5MT34XbT
 KhjfhNbfIlwd1niSej99sjjejLIZbtyhwydphWEo5qLi/P2nLYT//3mP8NiwjajzHarDF/C889t
 OXHRUD217S9OmB1KFHkDaLZqjeK5J2H/OkK0EBTje5upaAVmjPzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OSBTYWx0ZWRfX8TLDNclkoTbG
 gduH10O/8wmizJQrK6XysRDM51e4qxIqgLAjVd+Lw0G5Wwg1R5HlFPhVzD9TnPMThi4XEomp7cF
 0tDViCGv7qgWdUyEBlZlfkbXijR5dLLW5UZAQ+6mWE5ABFgX85j5ZPjykMuifskyKHcGvE6uO5o
 9BKbm2Q3x0eeFKClAqKlrv+d7lLwkjbwlisl5UfS0DnS0i8Wdyxlbr6rFJ5Vq8MkL+Pec3fOPpt
 rPCYXU5DXu2mZRBBW1/Ns89/LwDNdtPxhHeAHV8+rI7O32yz8o90U+jbkzIoMZs8t3kjANDjK6P
 g/vJt/QXsnR/HmvEp5TS5rUxJPIz+jeWzGTEMw3gnFJeDm+SL1iP1U8owI2Zj7rVengfg0Ph30F
 vI8WlYAPM0brma1W6vTS1Cqzxo6PavY8mUvNVZUKQ1/Tiw/xE/0Rkbt5yONE/8TpXBiJzfqivSE
 jQ3jGQKf2M5st8/XzAPsezbn7t0uq2p3/mN8N288=

On Thu, Nov 05, 2026 at 04:53:53PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees spake thusly:
> 
> > Stop unloading cached modules in dtrace_update(), including vmlinux. Keep
> > discovered symbol tables, ranges, types, and BTF IDs for the handle lifetime
> > while collecting newly loaded modules. Module disappearance or reloading no
> > longer replaces cached metadata.
> 
> Hm. Interesting. I considered doing this back in the day but more or
> less immediately hit problems with wanting to remove dtrace.ko and
> loading a modified one.

Since we no longer have a dtrace.ko, that is not an issue.

> I guess we don't care about replacement of modules with bugfixed ones
> any more? (What happens if someone does it?)

Well, is a module is unloaded and reloaded with a different content, then an
active tracing session already will face trouble because there is e.g. a
potential that addresses were put in the trace buffer based on the old version
of the module, but symbol resolution takes place in the consumer using the new
version, and thus you get wrong results.  Of ocurse, that would be (possibly)
of short duration - but either way, the system changing underneath us is just
not a case that we can really deal with.  That was something we could deal with
much better when dtrace had an important piece living in the kernel because we
could (in a pretty seamless way) re-enable probes based on the enablings that
were stored in the kernel.  Now we would have to react to a module unloading
and reloading from userspace which means there would be delays and all kinds of
side effects that would disrupt ongoing tracing anyway.

> > Separate failed ELF-load cleanup from module destruction, retaining the
> > existing handle ownership of shared CTF and BTF. Document the new lifetime
> > contract and cover incremental discovery with both kernel symbol formats.
> 
> (I don't really know what this series is for, or why you're doing this.
> Is the point of this incremental discovery? Or is it just that the
> compiler resolves these things to addresses, so having them change just
> causes trouble because the resolution is already done? If so, this seems
> reasonable -- one hopes that the verifier would trap cases where the
> addresses used now resolve to something else.)

Combination of all the above :)  The main purpose is remove complexity that is
no longer really beneficial to the operation of DTrace, and also to makes it
easier to simply and streamline the code that handles modules symbol and type
data - the extra complexity was lowering performance without really offering
much of a benefit.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nix@esperi.org.uk> # given the above
> 
> (I suspect there are more simplifications one could make, given this,
> but the below seems like it should work.)
> 
> --
> NULL && (void)
> 
