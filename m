Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B193253339
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169236; cv=fail; b=EcZrGPy6bPna+3bzHDi32aoJHw0eYulvhiv7TI46ieVM7eW11WqPv4tvvMnqvv8ETyjwHaLZ1O+Jfu/qgmkAHbDB+L6Tn/qN2j/lFR3gUGQWp08LFRsmQ20vv/+UkCZINxa17lk8r25FYJli/9wicf2lutsCZKzaLA8B4EECkGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169236; c=relaxed/simple;
	bh=QgUpE45PfbvbBo7zCmWfAeX5OktBo1UrgxgIhj9VoXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XRy+q9upNoBCJ3/elH3W4GC8RKCvCvAzLhYURc4ElAHULp+te/nGuqntplwI+Q65REU9x9sEgffpMGjtzODABPWbS+TxOxzyAeMZh2NVF5HOsWGC7pAi25tT+YSi4dhimpd781tPiSVHcy/vVj+FyoU2X8e0lO22L4Yb33txu5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AZOJKKED; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m5f3dYq2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AZOJKKED";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m5f3dYq2"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LJfiu8023715
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3zppvp+YrTQ4HvnHMS
	d3NWGwdeL8OYXnVQwiknGrhV0=; b=AZOJKKEDzjXbhJQ8NMnI58ExnRv0OySAE0
	+If5MKXX9bMdxQfEZi0vw1KvrzW0wf07AmZoXK0dQSNzxLUk8F9Hmwsm9rdDIWW/
	UTG+6IXG5LtXraqjuqopPMN5Ec+ZuninFLZ13Cgdj9Zv1W/jCNJIb7M3WpqlTQUc
	pcwYcFf8vxM4YlC3la/097WkSQ3M9i76KQXMnZ3pMiIEl8HaaDIvbOVHBzVA8b9Z
	BiY3beVa4mw8gqQtu+2XiEyLAOE+MyEyFQvlnJ4uDLfjIOR3RneRqXhvkpHwlcf+
	4tYRu0CC5DfLVcSWw594Z5k1uYkUVDiRqAqlMhQ//eEfQWomLkXQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w02yq20y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:20:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51LIjtVj025182
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:20:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44w091521y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jko7bp5e/W809fUQjRnNpKOuOFRcDDeuWtXCDU1SBSsCTdxYtcRvMNKJOaTxd3Q/DmMYwn1h10WLctwIZR83rN8IlfMHKJQXgLN5o6SM9y2HOS4KlJcblJmRWJuadO9qUpHGrafJJtbHRjaCEea0Jh+Poy0+BEmV895ZX1vGCBPhhvI6D/rlDvQc/IPFML6QdzxllR3Agl9pzBICekjH5zvhku3K3zRrQsAfiXBK6oTtrLw9JoiB/JF9cpw68TTXMqPUI4sevPbgzhf4xYNHANR9Q/f6mOOvAZ8m/7xT0CNYQLRnb2fibFxrxCOqqkAksIJobGN6e/QeSMqK6VlExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zppvp+YrTQ4HvnHMSd3NWGwdeL8OYXnVQwiknGrhV0=;
 b=Jd+SdEG2tUwlsvKfoAvAP4K9noWtw9J+pOvqJN9/Qi5DnyoDtsLoVGYG70qWck/Xn02STuSu3pD8VedMLX3H4sy3Z6DLsP/4qiZyihgzxKpE5V1LtIC+MPwH4ufU2pWALDSg79USrvH3bamUcXO1Q2tJcluIFQzAVSxlbvKTxb/xkatMchi7oYua7jq9Ff+1P+NZ0Hgjju9dNq2tRmuOKa+vQ8RhwbY2bCIPnfBVZfQhw/OTeEpoAWb2ZmJqd+kH3unP7DL+NWCyM/CpCJBhQkpC9C88dZ1kY+YquZXeQZZtMLxqak5GOch7vECHgtCF0jGnRDw8ZHgOnS0zEeO3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zppvp+YrTQ4HvnHMSd3NWGwdeL8OYXnVQwiknGrhV0=;
 b=m5f3dYq29yl9lLCMdQmiGd+LTYX3qYjmusuBFULbEkeLH5gwCl0P0m9n7bgxzIS1qm2eOGrf5johnw4p6LUtk4MftLNhwfQl5YlkVOHQENLWOkCjVP0nqETFrINZE/HLgsAk1MqFwxETC3AnwV7W0sKqJC8r91MleovtaD9Bsow=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB7978.namprd10.prod.outlook.com (2603:10b6:8:1aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 20:20:29 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 20:20:29 +0000
Date: Fri, 21 Feb 2025 15:20:27 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Use DT_TRAMP_SP_SLOT() for BPF stack
 scratch space in trampoline
Message-ID: <Z7jgC2xdXjT3L8Y3@oracle.com>
References: <20250221200924.4445-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221200924.4445-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e16073d-607b-4eae-f688-08dd52b52f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XjDtXaUPl5F7ZGiN/lGs8XRpvqy0nVNVxB/bVEEHDgWrM01HCh3lJ4bWHpMl?=
 =?us-ascii?Q?3vSqNblEhNn/92qHIPNnsgjBinRa7aVSmocqujxGEDEMPOITWqlyxM/SpUmw?=
 =?us-ascii?Q?FUrz5UHwHCYQJVFueO2E0/H2ULqkNbH/0Eq2VthCHCkPMdLECszCLXg6WLnd?=
 =?us-ascii?Q?CdmSvIDcNWt8anyRdhBiZu0uyvdaThB7GUbfytDqO2iWHLTR98TgX7CEIQ6F?=
 =?us-ascii?Q?kR3sMJafOtQWrSNmOYCCTFlDZHONlzJ1t2NRD0pxZQIEbbNewl8VgZQpQE5C?=
 =?us-ascii?Q?C1lLDoMNjSnPbhs+vwxkgGm958XF3QPcKKB8ruEZ5zrQmaqoyvWoDDriw1xI?=
 =?us-ascii?Q?ymwNSBApxSEjSyicjSz81/TvnWG1TB95u+YuBhEgUCdwUa/nSarco4XDlw+h?=
 =?us-ascii?Q?uVFMYY3vp5lyS8xDElp9h33pY4B+jgzus+FuqPUtXbyXvvSnLWyhnVth+hYa?=
 =?us-ascii?Q?IaRQjdSfUMNVEFDscvWjfw+FFWFzQ5WjWhkb7s6Hu/Fd4worjOG06vIrapTA?=
 =?us-ascii?Q?d4b+Xzv64dEvpCG07XHmscHBIgt+AEqjIxxvxj0j2QYE9OKODxtI5/84bKv8?=
 =?us-ascii?Q?cwadknYlWqshkpklj883EL8Qdf9SKjWDrRTtb8NCqJPZRigr/kN/jVYQ60HP?=
 =?us-ascii?Q?ejEtubWU6LdN1qEhbo+0YuiNCcYZGuoOsSyVD+LlDCOzTy1g8md0bAuTvAf+?=
 =?us-ascii?Q?MqsrnoYy/QvDAVLVMUbpNIEsxq9F016gkmayU0qTLKrRaCMQaY7P/JgEmkwm?=
 =?us-ascii?Q?LbEfZQg5GwWskWRiJPiTGNplg/xBUXl6t+oox3whSKRGZ+4xfsdgZoO2xkW/?=
 =?us-ascii?Q?ks3Ix0cBJFS0FA1ppiGrxvHlokmshl0dMDEDodMb+E/Hh6Bucs0JiL5CaSz4?=
 =?us-ascii?Q?+oXFZnedo8vahA/MbAQ/bXFX2UnCdAfMAGrsPrxXDBlksP9yG+LRl/5y3sya?=
 =?us-ascii?Q?cD5JDj5TRa5GFUUo5uHVQmfAh/6ySifH+KLLSBYSM0JbMbrWekf9xK8a0op7?=
 =?us-ascii?Q?ywxXFETZlMLqmI066id62kveeSx90fLFmJ602pi+CtXTepigqRwnopkPMOLG?=
 =?us-ascii?Q?j0CaaBLHzEN+3TWeIPnKxV44/n7yDTKMBjqM01ug0hpIEyfK7PWw7NtQzGHt?=
 =?us-ascii?Q?MFCPas179YBEZtHpGQsaAX8p+i5NZSQas1vLVPm6I5a6Hl1hFaSC3fy3pit2?=
 =?us-ascii?Q?qY0o4Q9C0ICFpoHQnkzht41DVAEQrHBzX/At2lW4WqhrwKDMLM/0ythMhyqC?=
 =?us-ascii?Q?zn5MQxs7XLCnbEsunp194FXZzcYU5wF1ajeWB2QdTgSwA/mPjFwHBiy3q4mr?=
 =?us-ascii?Q?+rV2fVZe00VIwTamuL+V3DZzl70bdw1lUya1O05L7j4k2BiMRbXLN9ZFYUtI?=
 =?us-ascii?Q?N460ic+mDuOPPDH1omacDntnJ7yx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UosD7qgegFIy0h9gF6T/GRSMXgqYuQtO+j6HSfq3GJjKTODp7D8lKEkE5fZ?=
 =?us-ascii?Q?HrT3pHv5oI973sF7xSRSM79GmS4BN5Qv1cqteBnulmjwM6aQLj68cq/a/zK8?=
 =?us-ascii?Q?SS4iLYOSbFZowVAZe2UYow5fE+a2p0OmJst0Uee42RrToi0xu6sye7K47XVA?=
 =?us-ascii?Q?/aiZa0moAtE0mhmQj4cSEVczP3lX3V7VDDsGOFQkZFfR7Z9SIIFVNYROone8?=
 =?us-ascii?Q?AQKc50BJyjRZDLdM7+AH7fhti/yk/A4Dm/3g/Y9MIj14+odZrvHvr5F73TWO?=
 =?us-ascii?Q?FgGxy3FOwakVjgXV20+YFRg300yriHofu8HRaPwDLOhkmL3qfpfsDQxGsHlp?=
 =?us-ascii?Q?DqPx0akBuyfE9Tk7QUWLwbCIONNkHIIurGtwVYDJSTvrMX4vStTy8UfHpcOY?=
 =?us-ascii?Q?wUNfDAuHhVyalThbi/GPGAM59xzLTWDWX/2Hp3SyJfM3W4RA6/0FdfBMmaRh?=
 =?us-ascii?Q?IpHYYSywuSbIaZLgfLCpURFF6hfHqZPZN2bcY0pTZVCKQOo4hnhynFxK1fro?=
 =?us-ascii?Q?GxJM4xW35SJdCA7pNnlaEcZ690ABUXU0CFeBlbvhHgHxJscwJOxO3+T61GGL?=
 =?us-ascii?Q?oOPUQ4WX8sWhbCZ2g939pc4hLNgqClQLwcAbP3ttyvMbI0z3DEjQPEk9D6iG?=
 =?us-ascii?Q?ylK/otFebBWcC8HN89S7va0bpyRD70PsqbG93Zo4xlugYVEgGhycUomN73S0?=
 =?us-ascii?Q?p5IC5/oDq5yt++5kimZ7BPQ7pHA7gMrj0doltzZT5t6Tv7NGebo54BkAEIRD?=
 =?us-ascii?Q?keVGxcGmXkD0jdtuIsvs9C54/YfhD/Hh4Zt+aRvQSupfUBnhLHuZLsnPGR9y?=
 =?us-ascii?Q?J7LnXNvzx+A56e/UvyU39xJI/JFVyZ7Kk9knyPgbtEJUqwE31UYsTw2KG1Ng?=
 =?us-ascii?Q?JqKq1jila28SuIKX5vxUQ00O6HLgv9mWuMgnbayqEctgT5LqW7Qt/f2kGv5j?=
 =?us-ascii?Q?NOVeAulkX+v+bFlaTC+/rFrbrg93+bLDy2dXsNR7UG+dS69cuxW3enZN+U63?=
 =?us-ascii?Q?/7CoCmSPxpHNkhlge88xvbiAa0ZhUijzexgDYBt9GRps4Zq0gm0f0l6IQpHy?=
 =?us-ascii?Q?OUloLYit7S9A6zlUa/Tv5QHuGcIIZVHlqWfwiVbXQRGnyoQck6j6ga5iTSpp?=
 =?us-ascii?Q?eFbboDclosoDVVCgvyJ4fI9zhduSeSM/x9kYk7f3bcVhG+nvqZxPp7XCgQlT?=
 =?us-ascii?Q?OT4k7KMfYYYSOvNttZiqcC/Oxw7bW7mGsFZ91jXhDPCjcKfuJdRl8qXs83w/?=
 =?us-ascii?Q?g3+5lNvLlA+6jr4CIJISfbOpk9uieNeoS7cprmKlASkQ99JVoIyrIgcwsauo?=
 =?us-ascii?Q?Z9hbXjQ8h/U4u9CiS5lDsreMkU3qewM40THUPwnE3/p+eC2a5l3g1je62WJU?=
 =?us-ascii?Q?7LTerGAAkmDRpbcA1ubTw5zSvUF7XXq52VEQHQaR/+4W2rhCFP93oCLrVB+T?=
 =?us-ascii?Q?90W08Q8gbFz/5KNwU3L+XLGgDHa/nQCbwGRyIriOshTKySLuyxmV5UFY15PL?=
 =?us-ascii?Q?PyFcD/lt15l744pxEFNSD5JD+sVRxCZ0wWkTwO6hNZKDzoYsj9QwxraszeeW?=
 =?us-ascii?Q?4tN/hLXSeyhJM+rkjlTSDcsYhlQ6Il3k8jmYEPqrPXhBAqjw5iONPlbRjqOW?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FxM/B4oBb8qTeFlKEADlH2cmfWTyPg90mBuw/T8Wd4pzbcBe2RxPphhnVa973N56prjD8tQP3qrEhB14HqSDkqXgagZGB/H2rSYIgSg1UCFC5e8qqEVQEsui/OI4735uheJP/HOyHIFFaCb2xKHRUJXHE4KH+MUA9Q9C1N4Ue/IZTpNES8oNzE+fEUp/nRARdYprpCSmsomFc3ncR29Cr3WqUJmQIfBG0HndSlzdNF/D4yRuDJEWamxtcDZezXjiGPBqItpcq6dV1BjgTw4MqHe060oabT6/lfcCrQLVDgkR7tAmkyLjmFnQUjLLbkQMITIv/AXyN5ImTT0leKwh3H/LFfoWO2bYYEAQz7OEqIGxMDms90YsBUIQqdB1MBCVpV9dcSlpw0pZgjJDI75ok4ucWzmyyI3YHAnHraEtO6ocED3mvDjzxNaGHDm6cZQjYB7e5+L39uue8gpM5vdberiUwUja8iUQ8NS7JFVmo4Qv5xJJQuPpqHr0TMB4rHORc9Ux3fN4T9242uuJJSZPtPCwzXsWrzmrumRiKYlup+5vdI09uUDenGPOLxkME+EVd0VwwNxildCb70i/bITjSS7a1NBUn/O1z6hS8Ae3sUQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e16073d-607b-4eae-f688-08dd52b52f7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 20:20:29.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOLP4oNAhZ4jeGpBvkee+UdcNVPydAWYvy02yc+o8LPb0VtWyMsS7HdIUDeuuPfPugqKGzAVazGtTZ4RspI0PCmwqiqnlpdK87SV8y19PC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502210139
X-Proofpoint-ORIG-GUID: EkGkI4fY-G08Z5f0i1c2Ium7A_LnyNjq
X-Proofpoint-GUID: EkGkI4fY-G08Z5f0i1c2Ium7A_LnyNjq

On Fri, Feb 21, 2025 at 03:09:24PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> We might as well get this code right, even if this "fix" is
> arguably irrelevant for two reasons:
> 
> *)  The offset just so happens to be -96 before and after the
>     change anyhow, just by coincidence.
> 
> *)  The fix is on a code path that is not currently in use.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 846f0fe2e..cc64a3a13 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -594,11 +594,11 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
>  		/* test just a single byte */
>  		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, 1));
>  
> -		/* safe to write to FP+DT_STK_SP_BASE, which becomes the clause stack */
> +		/* write to scratch space */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SP_BASE));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  
> -		/* bpf_probe_read_kernel(%fp + DT_STK_SP, 1, PC) */
> +		/* bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT(0), 1, PC) */
>  		dt_regset_xalloc(drp, BPF_REG_0);
>  		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
>  
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
