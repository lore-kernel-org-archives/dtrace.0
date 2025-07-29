Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C4F2110E
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753802361; cv=fail; b=NayNa+H3Ep0haDidV8KMoHwJ7a2+qC9RwRiIcQZrXWiybDi1D2F9DL3FkhRpgcNWfacK+Dq34FkNt3iTxEv91eU4cjEfboxVfLxCd3fM8aPLw8krQ8XtNH/utDhu0MUjQE9fhoMqiM3OBzeHkreXTHcGa7h51h4aUgyQ55y8Ncw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753802361; c=relaxed/simple;
	bh=Vfc0unbLnpitd9t9VTnIzPrsp6ePAziRsLK7SokPe/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tJrMHrKuPAQJ7CCqh399giCGP+EJMkQ9hbXtYQY+UTBAnQN9KK0JbIxc6kH9bpfHHJ5rBvx7/Qm/RdsmyEq9C1o5RZ68UC+uvYc3/XgsY6LlltW4NwSxcaHddexmohzL8EyeXOm25NTzRGoCwct/Lb60GUy/WXUG7zdvw0rIqPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IXuF6Gz1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bLrRvUaC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IXuF6Gz1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bLrRvUaC"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDu5KX013589
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 15:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Q07VQadZXVjsbJtxN2
	Kpkn5IlX5RA3QoXt4iKOHZG08=; b=IXuF6Gz1n63FGMa+rbaFqJ9zvjRvKmjaZT
	pFdaBfNShEqZhpXuyEK7ewZyAE6TyTPGfgNjE2e8iUio/OpXpYu/U24Y71qOnzyF
	pLNqpecsi9v9c8qDLW7BXzAPRWf202+Hxz258J1PCJtMTMhP/DfyyrC0vEC4o2jB
	5K32aWfoHOmywLmJ8wQ3uTdu5yxNGXefi7l+Be7pOoA7e3KbrjNjQDEvo6DyVrwR
	ZAKkAQ13v28nRA+tOcEFnBIaXo4B04UuQ6Ukytg3OSdbLf1eBYXZhedUwH0z3IT5
	Kr2EBzEdGRm+BFjL4cGeHqCnX8IT20rkE2x0g18WK9qqVFw7OJGA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5wqt9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 15:19:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56TEP72K034545
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 15:19:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfa9gy5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 15:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsaWtM+4H1oeBT/7H5sqH9O5hs+KxSN5jB1ocrDL2CUzr9UXej3SXOgyRAayvRKbtP2JKXsVbyJWgKlmXDgxg4Fkq8XKv2BhgvgGIpOO4NT+QJs71SGMQlIFHjcqKyUbol+5ykQ6BFnEHp0BTz+gCIW/Tt/LurC0x0rodqxhkMpmMdphWo07k8NJueMpnQIrvkhq/UDTb0al0dCuWUXmTNftZgZsK4xFBpxSiOl5k1f1IpDVHL9d4FDU8qLPioUba9yMEk06WS0i5U4eAlDt0vptPBE2iP1p6Pib/pObaIuTRMneJR/0Jb+0RIehFBxebk1fOqlnnKaBA0F5xtJFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q07VQadZXVjsbJtxN2Kpkn5IlX5RA3QoXt4iKOHZG08=;
 b=p43L7CTc+7ETyWx2PQO2m5DCq+3zF4JjgQq6uNBciCKcFeZBOLTNoP8qqLkU5Aa6M9Vjr8WG10fwjuRKep/09diSZUKbxNXzmSaZ7p7jwjy66DJpD1eNhnWp6VbAamvNzxMhZo1u+ulptUfQPyvUZekVIntNnVZUFe+fZLjMGORJrfykR71u4aqeV2Nw2/71/dtRmhz74sc6yfY6Y76ZkqvkB48veP9NhGWptBimWKcZaXtC2qjxxxbaJ8LWZcV29nWnzbgyntolmbo6DD80IHNT0bSSxEZb8bxOpoEsT0cMuc0Lm6YObSaVk2u8KoUS8btaQbFGeIw61Mw+m0J2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q07VQadZXVjsbJtxN2Kpkn5IlX5RA3QoXt4iKOHZG08=;
 b=bLrRvUaCXubgrGSwTTmFz4F2OtrGVVQq8o6j1IATMKASvAC8HoSO2t8nBP6DxLyFaOnJlgQmjSvclecHcBfucpQnO5HoGNM3LLKok3LuvYhaD7UG/KokpPr794WAFRdDQ+DvshRxU3kawq1hx5uZPVYsKOLk52sgNcO8sEROW2g=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV8PR10MB7750.namprd10.prod.outlook.com (2603:10b6:408:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 15:19:11 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 15:19:10 +0000
Date: Tue, 29 Jul 2025 11:19:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, eugene.loh@oracle.com,
        dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Message-ID: <aIjma55P4u2iEVx9@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <877c005or4.fsf@esperi.org.uk>
 <aIjXAIS6pP+51BMI@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIjXAIS6pP+51BMI@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV8PR10MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca8b0ee-c91e-498b-ad52-08ddceb344a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qOtTM1uztKAl52xLv1z68VQovR2Zcp87RF/uSotvAwZFPw+kETp2aZrbawS/?=
 =?us-ascii?Q?F3LxSAe8HZOts4b+qPnG4pVKBCE4Pyf3a/RPk1Y79+KatR3AN4lya4+OuzuB?=
 =?us-ascii?Q?zyuwlAPUxOTNLYpbN0AeExYsrV9YXYwmshUrpnhpp9WUFk3dqxD5O+bi/G2I?=
 =?us-ascii?Q?1jY4erWwK7lMYdDAAce52xO8dEiqaC1/Bz/sCF3a3Z4X8Z4K3NLOZDzbgVjA?=
 =?us-ascii?Q?pMwdXZC/+LKg659vJDJpb8TJxClX/4J/5fL6FNZpZGThA2rBrpGkuwYZIfJX?=
 =?us-ascii?Q?aqmvCdf6hl2ECwVNq+jae6OXCAhhTdUYRWue6Y1Y+cVydvJKGZrQs6uhfdmk?=
 =?us-ascii?Q?MpFyQK2LVUURpdJhQZsTJoQJ4W9bErz4jH0bEIywBX/ScljXW80mAFZFIeF8?=
 =?us-ascii?Q?cCPCZFhJMUhasDZsn8B2XrCdaYNIrUDYaSFAxpv/TO013Oby5l6vp2bcQRYX?=
 =?us-ascii?Q?7KMRGEZ7kS7sROHefH96hXjxJ3cFhBdpFcajlYAu7nGgfm3TiVLO3PnzSTDR?=
 =?us-ascii?Q?qQhA5LAEoRkv8XLo+F60RRI7Xzn8kqLeYUvlHB9xPJmzLdOgb4CuL+ACRvuC?=
 =?us-ascii?Q?Jp3PH6yC/m54+FtF2XnqBd4NuYno2tohcVp0/ubZAvUE7nspbS9a6QUca9Do?=
 =?us-ascii?Q?ZWYYq2RvCurb4z3BPxhDt/81cOihfjhVTzacMoNpREfeapLNiEtKQTIO2TYf?=
 =?us-ascii?Q?O68OJwjv2McQCbzSLH+5sxmwocgemutx/GLu7nC8Sk3+nkwvyQK8737Ktl9C?=
 =?us-ascii?Q?p4hMu/pPqUR5zvtRE5meYB4wmeCTc2RJRLbs/TKBpbyN9Nja1z735W9oUJKb?=
 =?us-ascii?Q?HsDKV/AAuWLV6SyBMawjEvtzG1yQ483eaOrFDU2TwLV/8qM+CWDTNQvPeE8Z?=
 =?us-ascii?Q?g31KDkHLKqhPnNVNlLLiD+HzMZPyMtgLqaJa4a+A54XWe4AAPGWn0JPpEbdc?=
 =?us-ascii?Q?6XFbMbU2tbxcSVEdrHUeNnv8TjQ17v7q63d3BaMOoTp9/UBgR76Sg0Xd+ehc?=
 =?us-ascii?Q?i04fpm+c3YluKKyE4kLsuCp/s2ossLhE/8P4eOwk7KCJqeLihOqVsC1yhviy?=
 =?us-ascii?Q?L76/5J1B8NavEk5E7PFBTiX774sAP1lk56GJyLtnoFJhaahdb7R6Ps3L8qzA?=
 =?us-ascii?Q?V/x9PE10KKeNM9B8UJk2QTFvshU9lseEEjuwT+4yES/NfjJ0I6wbSy8xrWSC?=
 =?us-ascii?Q?kRKno0T6OUijaOHYab0ylb6ITk7KT4tjSAqeXxIK0p36q8z9yUhAjFyjeVdX?=
 =?us-ascii?Q?NGFWhIFTLifhokzY4Ol6Zd/ZmYHZfZJei83Skrew8+jrJneOl2T381i73rOe?=
 =?us-ascii?Q?Jl5gQZzFo1i6Pa281I055jm2H+jV2L7XgXwB6Sufab/NeaWhFoCG0HDMIp0P?=
 =?us-ascii?Q?eDhzXPC9pLg58vo4OHopxQAyvb8Z+4tPnPGBT6c1Hqs0V3h6lhqgrN9iS029?=
 =?us-ascii?Q?h8gnPTeyMPo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O66A1//lVUDOplFcxRrx05uWeS+DdJkjbXGoLGgf3LRhIqoNontwdlk3hzII?=
 =?us-ascii?Q?NYUxivrTVfBZpE4ktjozndMH6De4IYoiQzerQMziroNj7CsjfiB2sVN0qPT2?=
 =?us-ascii?Q?UQhKw7xoZpg2otMOmRhTot3En8E4gc9U07qy90eQZIRN2aBWazCGCIuUw6hT?=
 =?us-ascii?Q?2EktVkUpSJhdXYw6adZ+M2of28NY131/t7sBEcS7s24mjjw6cVdt+708jGUO?=
 =?us-ascii?Q?YakYjNK8YWvDGnFtZA2bTaA+fvIHSretgnadPPaOCAPqoDQ81vY1yHMXcolC?=
 =?us-ascii?Q?QHXytOSQJEVhl69ja+YtmyOPf2gKTjkqlqU6MSiBuVk7OQ0c2BLb6dANJK2a?=
 =?us-ascii?Q?AOxo7vAL0wvwi5nItuItyNu7JUjjUls0ljaxyRc/1LCGsr4oF8u/qtb3Rc3X?=
 =?us-ascii?Q?NcjUng/GUMxisFLJ1CndFlAohpzg/03TcEHwV6ug0RMPKX2ey83ZqtLK2BgU?=
 =?us-ascii?Q?YfYPu7khgxW2DixuUxQ5ypGGvslZWgOaQwsc60TZWRFuiqBzWYAwfMqe/WOr?=
 =?us-ascii?Q?vvoLVAIg7gfqYtaAe95Ar/QCRlYPf6HA1MUKkBf7aNC9eV6Qh4rouQnFWFgt?=
 =?us-ascii?Q?IEyxF7Dvvq4CdLfrh9zX6vz7mxyqmREEAg+q+t8juwHCtGVJ/wWVHUhiK5oP?=
 =?us-ascii?Q?K9MRay2FIUkIot3Q9EDlNaz+UJINoUiD5b4nuZnrk9SQRLH1Qga9MeC2zjfk?=
 =?us-ascii?Q?psfIHt7RukPAA3SdNVi0MjaLlz7W7Slwycp/yLzaG57Je10PGIXYa30PyHrt?=
 =?us-ascii?Q?zygl/sXauJSrJrxjgYzbIl5otf8ftThSa3Chv3t54p48Jb3UWPDngYKzt8Ue?=
 =?us-ascii?Q?B6m0feUfNL95hDrfeYcSjwTD/uyIhlGsOBUh1VhBhJTTBPSJjj6V4Tx9Y8Os?=
 =?us-ascii?Q?nscjiiOatgS+07aFyYVQEdjV9jFgM4nhyFByFR2i7ngxia3/DMsBTTjaeeXo?=
 =?us-ascii?Q?N4MMnsHSABxYexixxlMQQbL4fWbYMDo7sHKMp4fpKe9Zn10jurNDBT5pmC88?=
 =?us-ascii?Q?mDrjdTLzKfU2mY6C5mwzoaPysOaFwqKOzKL6Ddp772XljlCUQ9kmVkDTRvn5?=
 =?us-ascii?Q?5gSlhgD89uP64G/0006myx5jkjUccnwdf/ROl5IAomtIFAvVtzNbk0DalhGi?=
 =?us-ascii?Q?aG45EZLfv+crvJq5bnzTctBYhaBDKX9j0KxC8WuQUGIEMEz/D9XdFzbKpU4P?=
 =?us-ascii?Q?fxtbYn2MFwKnjCJQXytaPthD2R/lQ5BXmNX8Mloi2V2T+HSsaP9EoG2c7IoL?=
 =?us-ascii?Q?qJN+eZdwG9SUbVMYr9ixW5gGfwyiDaC1cIQdNJXn/8eDLTrYGK0O8lXO61CU?=
 =?us-ascii?Q?xJvHosuEp1iCXoTlTUINxcjeZpv82Gw6xolwQ4Eu7bdKpIZszQe8y7hD0vt6?=
 =?us-ascii?Q?I5IyNDNkWiT3a6iayQSyhzy2fsqiqYa5QktwU/J/uNAcFxrR9Ry3xNoX1fUs?=
 =?us-ascii?Q?+9JcyyjR/DFTCJ3XnLjMLECAHIUpcv2B8jo4Aw6/V5jt1MMYfGGgIsEqDW1C?=
 =?us-ascii?Q?hMRqdTtYd6w2mP19g9Z/3MZJBl+JQV7By76+6o5soRkIuMt2E7f6+ZOsGHSc?=
 =?us-ascii?Q?3dis3Fsv7qjoVD0CCZHTlOglcCOu1oSy1hUWLkT4wsUT4BDWB/czTY7vc6Wx?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WfIz2RQJNb6NBbXQMNiY4xJX+4x/UcRaarg5Nsl9Q1NXfUYoTNs4yKxQxlvunynepHq9HpClmlur5VSjnvbBhPXZgcv/BQ+FE3MZrURv8qBjlpOCLZlOMqRo09eL7ghHTOwv2VRoS5WlG1KK/6DKKLEn/LjLb5pEKsd1NTT+9Fm6IrNFWvUfw/NYl5bC4hhWnAjz3llGRa+Bh7t8kbYPC3cWKrXkRmA5AQJmniwNE40zLpzZc/VaDedWHPVsFsrftOsb54SwbrJQNROOR3tWuRlL339b29JIK0XRKKbl2NSa18lNehNDGW1FJgOGxYNgHU4WcT2rogIU5UTpGU3Stv/MVdNvYrqdn+W2wdCaB+2YhkPknW8YSscIwt3ioXeIiN6KilR27SUjx0hxtLWnGG/0aMX7bsVi2BEQ3CxvFcVqbxbdVoao0eLz99dQ0yrlpX+ni6A4HLCSy2D43ZnOD5a2DW3WeEH5LLe7Hp1JDsfEdiK/2ZlMk+gpPNCXXH63nnWPMCioJ81q2q4ZQnEZ/LV9n+MRqqJTNfY41gFjVH2J3UEkVWBhoqHB2QdqCphwZQFJbo97Rk9f+y19xju3tl59c2UrdUz3RzVGP1YEegA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca8b0ee-c91e-498b-ad52-08ddceb344a3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 15:19:10.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwN3x7FM1oTbPtyEu5cbyJnDzW0TdiGauP9RF+Ut3wKJSss7fd4WADyAWlMy9XddNXH9C9KvZNCi+mmCVkx63cXscdwUsuVDTTby2lx9pnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7750
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507290117
X-Proofpoint-ORIG-GUID: lDXVXDpzdXuZW5yuLU7XKCYwuiFUUZYx
X-Authority-Analysis: v=2.4 cv=LdA86ifi c=1 sm=1 tr=0 ts=6888e674 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LDk4-kwkw9X4dY3C8zIA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNyBTYWx0ZWRfX3yg0QqXsyxHQ
 TVB4O59k2Yi06ZUCEMczPsfEEj4DD4v+9B+wELtZ1xWacnUa9bs7ybD3zSS+W26QqmNeKYDkvey
 u+TvELgf7SxWK3Ws4yjNzN7DUTa0/8ho8EfvkEOm18lT1BHt7rdinnxbpYGdiKVYAVEhXDngiaB
 FJHml3VKyIWCudmXXckH2nYHKA57ndQtoS9F+yfppKqan2sU/pg9IpxsHInwbq1lUrwZXQjQt5v
 bub1X8ZjTdxr4KTtbYy7TMgzEuNwBPZZMZtJqmtuqICy6J8OD8NkBsoCxA6HD5GJ0tQF8KFIAZA
 pfJFoDZY6Qmfdpswpd6vOCwneKe79hq7YHW9EIxo+I+T/4dRLxK5zRTBUqtzWiLsN31hjB1V5DZ
 VVd2IA5mAnudB4R2053ZSnCDXoMmSQrzvgGl7+C3EGZpbZPMwMqtkMRUZrPHRJVtms0ALl0/
X-Proofpoint-GUID: lDXVXDpzdXuZW5yuLU7XKCYwuiFUUZYx

On Tue, Jul 29, 2025 at 10:13:20AM -0400, Kris Van Hees wrote:
> On Tue, Jul 22, 2025 at 02:38:55PM +0100, Nick Alcock via DTrace-devel wrote:
> > On 28 Jun 2025, eugene loh said:
> > 
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > >
> > > Our luck with this test has been quite good, but it sometimes fails
> > > to show its last lines of output.  That is, we send a USR1 to the
> > > trigger processes to set off the final output and we immediately
> > > cat the output files.  If there is any delay in handling the signal,
> > > the last output will be missing.
> > >
> > > Have the processes terminate themselves when their last output is
> > > flushed; then wait for those processes.  Also, skip testing altogether if
> > > there is only a single processor to run the two, hard-spinning processes.
> > 
> > Yeah, much better design.
> > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> Unfortunately, without this patch the test PASSes for me.
> With this patch it FAILs with a time out.
> 
> Not sure what is going on, but this needs investigation before the patch can
> go in.

Actually, I am a bit off here...  it is still intermittent for me on Debian
and OL9.  So I am not sure what else is going wrong.
