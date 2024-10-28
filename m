Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E41D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150346; cv=fail; b=BhvzsriReeXaKNKqorCcyK1ZYgxD69sC29JNlNPOQXd69V/ViX7zLT7m8zgX/PsoJcK1lXX8woZTvnmuy0qsYW+PDS3NGnJbIufMzUJk0imTf7XPVO9dEuyCRXTNNrJqBDvfkDROLEh3L1+47JclGZT+xj8/bU/ZdvFm5m2Oeas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150346; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LgLRTRlg/u7uc7VJp6U6BxsQAavkMPIJZsnpf6lT4l/SDAvveIFtPYsstWVySiFXKwqabxtbz3INm1T0VpvRkRODB10tP9zDvR2cFXoUlXHu27CI6ocp7ZwbvJVLJzn3ucRlDgcnXgOJVwhki6wgW8sPNIrrn/n+atSaYY0UJfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vw8DCF+2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RBRacNpK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vw8DCF+2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RBRacNpK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaMq024336
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	Vw8DCF+2FZT6bZmA3ZtENfTa/perhnRoqvqD1TiOAGTkbWg2gti7m/ZXRf+dyOBC
	B9OPkU4HvAOhjPJsSMTqkixPbBp4uqirn6+rT1sU6CLRfGs0r+l042Ya2qB/Nf8X
	YfNUXEQE4oYBTxObDQQxl+RHMCBGlZCew998iU7/otAZt6PrBnbT+VaIfevG4GZR
	MpZ9os3gQCt0VeVOu6Ao0PJDGilZZ3wI658n7bV/rFiOkIcOnpgj4HBubWicgncG
	av++KuLqTHsu658gbqg/sLmXIWbMm0N5Eo3zY/I5525DmlU4SxcBt0FvKxYTzhB1
	wG6mKgpcYztj39TSzrKWiw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqby8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKuNJA035542
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6kev9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw9oQ0aXTaF1kgwrGKNiAjpFk+j5F6SU0ItRpHmXq7HfFJD68hNjflHWS3h/hMhtm3JlLiarBBG4R30KZiVpaxXRSHp9KpPolUMrQaUwTMh1QOGSG3vSKI8O189VdG9CUOUpOgkZe567XvWXz0YAmfXTN7ZxTgoi2MT26lEVM/po1fmMZ7A/zjzhVVpvjqHoKxCydK6g0IKNPocQCqz69dqmAX0yV9QpCar3hejkZLCxAzRx1/U3qOesLEBpVYWnnCHMSCLuULmC6fHQmiuME5MAY4Q9CHm6E+44iJ7dcL5CPfdm7/YAomKK6InQnESYSIm8PP7bZoFsnZNw4SP/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=kZofI0kq/M8viqmn9KCrIDE+Mv0Jmr07fNcdIybgK0qFiuHPYj1gIkQCpAh8tgJJcAisBFLJS/ZLeByEqsyy6g+hX4J8W8SkaaJHhbqUcxK+aDb9QqjnvyhgQ6hIS5u8y7Ee1X7Ka3gWWoWyNl9FBh0XK/V/K1pxR573ePOqdFe7v3GnhJBlEAK5C6nBbinqSOBZ9IOhVkVSRFIuLwuF0YLJX7gYUTWhv3isbrT69OwMAQKNmqWiq8Qk9R2A7SFeTBIIm1Xk5TbH632G0Tajo7j1eiEVNAQs1ineMblQ1/xQkQU09QcAVgM2xUnbEJ2eZQDQyM9uyWcBNxfArdcTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=RBRacNpKhoPv92sxP7x8TuYLrbRCrBYISydH7Y1kqlY+U4xZq4NNI4baBhm5FeroLgTpjt08zcg0F7rp1bMZD2tk2ALQWWO7RxDXRswSphnAnia6eN9Fad9fBgF5tywEjqVHSk6RNI18VJ6qjcduxrqCBFT8MpoR5l17vK+chso=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:59 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 3/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Mon, 28 Oct 2024 21:18:46 +0000
Message-ID: <20241028211849.458862-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9986e054-4041-4a50-205d-08dcf79623c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?stxpoNHS53JzHYz1ZOyEb8CxIXzlSB6MCqh/g58KNc68UF07Hvuv4jf7t8e+?=
 =?us-ascii?Q?4mUawmvvny9mo50L2vwab99nZO5te78oDUMgXsc1t370Ozeyg8sZP5ZLy7nJ?=
 =?us-ascii?Q?YZ72xa3ViIbO6glYv/tycm/tGRr+CpYFpPy/z8EQ7V6aKWLPMvZ6hoXH8oZU?=
 =?us-ascii?Q?bI1eR59Qp5CT2DnAMDDK4GwPEOdqBqNMOTmp/cKPl/qVvnrAamMnK34hjOKZ?=
 =?us-ascii?Q?LxM24hWDxPC7Uqq+vXzkULV1uqhVGYJcHEwNlik8DFAGIqH9WTH/IbniU+T7?=
 =?us-ascii?Q?lNuAZ0zk4vciO2y9INqX/W77nBSD3JN99lHIhxqUEgz/lPTkUfyY6KX2Hosn?=
 =?us-ascii?Q?atEOFGVuTaTnhysubKlBGQUdSevpViL4FeW6E5COTjssAoutd7Fk9euFNe/I?=
 =?us-ascii?Q?6mLKdxw31NJ5JaI7FuQGzwgnIG0NWAiZXpx/kcK/NxdzmC/ocxFXWjyvaIqa?=
 =?us-ascii?Q?jBFmeE33SRyj4LKJknwuvKXfYU20+3fdkfQJzwA2z0EZTqrO8XDnJU/SoWOG?=
 =?us-ascii?Q?tSUzvJURB+BbYTo1Kd37rp1/rLcNOZsEULM/TyzRU7Oa7nKqYZslrV4YwqoB?=
 =?us-ascii?Q?ITK1VJ9oF4lThmZT3vaXarnOWhC6H0Q+MTKcGmglYMkRmPR+ktKYXhCSNhVd?=
 =?us-ascii?Q?GtpnajB5FdEfMJl/bVTZoF8LeRG5LDE6wt+2894mtyio3fG6ucvSUuWkuHP3?=
 =?us-ascii?Q?oDbwaUbE8Kvaz+dAPapN13Y7wzvVVVbrsMCPap5okep8Cx0nSEn5F2+pL0cO?=
 =?us-ascii?Q?nr5qmeTek+N49FMAdQvnZjxPBNurAK6YDFvyAAf4QOWJiQgsIdwLiOu679tI?=
 =?us-ascii?Q?z+uiL0jjjZSmY/0WpiSNVsN+TmwfMqiWp8eekKLVezuleYCApmnC+Zk+HEHD?=
 =?us-ascii?Q?4xcvPS2iPkD8Kynh0Ua+hRpjOcks8ilvBKZrZCpAhiApjEU8sgoeZjnSFLcT?=
 =?us-ascii?Q?9Z/MEr4OqhITUsIX012E7RAd8AYNqyKnhaCxQMv0/zebSCgThCBH+MOCkwOF?=
 =?us-ascii?Q?y3+SyGu8ZG781v2DWMQEYhAW+WtZ6EDA0IAG2U5SULo6cEy+xUiqhBCtG2vF?=
 =?us-ascii?Q?tJQ1sUYY6aBrlD3Uvf4/SslsCFJacUloOaFfTFPBvn9delotWh/51yoL4+L0?=
 =?us-ascii?Q?xZWKLbLq/mSnO7gcoCjM1DbnptFII/76NmTKBt9N5Ef4EfiLkYQimJ+ROrmr?=
 =?us-ascii?Q?c8qao0/aRofL8I+2udO2zSHLATJjECzlapU3fH78LNaO8EBKE38+wsvzRUeo?=
 =?us-ascii?Q?6ADDrFew1bQ95SwsDOvVQkSaj+P13H3dfZDFtIgUfD6knpptEShhxbiXSr2i?=
 =?us-ascii?Q?i4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wNobT3phULLyeAhtBiLRwKw3AO37SaGvqg0DptIpSN8vpbn/fx6WIv2Gd1pU?=
 =?us-ascii?Q?dgsMwXoY1Z66Uh+uPE+b57Jzfb9mY5DR9RHkcDKke4e0dXQTF7Pqx7pe8HLX?=
 =?us-ascii?Q?ETx0yNbwglQtYUhd18b7owC8iiQDRymo2x9SedssztFJifPp7Ilr29G9rqqm?=
 =?us-ascii?Q?fj5cUHc8zUc3XaPP9Q8qtKmG9iHZEfDmVlyxvqZeG6TmqA3CCnOfv03ztlTm?=
 =?us-ascii?Q?IpYQ0r0LLKzlsRZsRh1Kb75NFbnqywcZc+rx2ikGFkXsdMkgO7t1Z38ZeOOI?=
 =?us-ascii?Q?JGOtiidO3hrGVL2THtLWER95XmbyrCo2JdahhksaZJ9nP/5poy/wUQC+bKVH?=
 =?us-ascii?Q?25bBuLYNmh3rBVEHEAY7ibEoYMR18AXREvEss/ibSnDyVURRjEN3GJ++cT6R?=
 =?us-ascii?Q?2aFeKIqjJ2FgmHpbfvmVArkKRjLMfgjSXO8yq+tAVPKUN5eGo5eQohRWXw/e?=
 =?us-ascii?Q?knV295ylaHhmQ3CK+UynwZ0nHQXOKvGeHMRS2BgLG2ejKaIYwsyk2HNbwI3F?=
 =?us-ascii?Q?ykVc1QtkygcTx2qmrS47hOPMxKdrQwnGTiNSOADCw5h1WioMI7o48Thu0EwD?=
 =?us-ascii?Q?9Of/EhL0xx+qgRuj6SvrWOkoONQlfcUMk+QSUxogR/CoBi2MTuTd+7zc8U00?=
 =?us-ascii?Q?S5DIih/J6tw8LXta99wtynas3lw9WN9N5Eca9O+lBLofOQIDFeHJiNumFp9o?=
 =?us-ascii?Q?7925VUYtSDWH7XbCGvbQ2OEX08+3Nuy/oXVUyWRh6qNX25fDfdOwBVLEWNZd?=
 =?us-ascii?Q?m+iW6y1HIV/QL1sfdckSefb4R+x9Oyu7DiZeRY9613ysSJwqyaCHrMfLuBpP?=
 =?us-ascii?Q?ZeQXDTpWQ5FtVouIUOm1QX25eFc47BcVmPx5+USJcC0yHUFG7akjW0cEyxO2?=
 =?us-ascii?Q?EWuZ6T09TyaqXuORKPpB2SlEZIJoEpg07edg7ep5r69pcncwTOwK4+EuwCW9?=
 =?us-ascii?Q?3cfOAZhJQn1xI0HHD4mcu2en6Qyc9TB3G7T5Md6E5tyVJoVWjijHpjEKeZ5E?=
 =?us-ascii?Q?7ly5TBVeU/Q897JDhuHO+ZeJRsQhxw2CZyMk7lupsiD6UM9Tc3AnWghN31SS?=
 =?us-ascii?Q?9F8BUEwLkldvZNotzUMWxXbtY+6hULZqVqErlvpqXbQCrv9C6tCLSABZhIHq?=
 =?us-ascii?Q?8wKspQ7Jsl1H8wUfism2EQiMrUfVgpPmRnvmThs5zxZcACpdr6J56IhZLeLD?=
 =?us-ascii?Q?XmLjABYuRx/rEGZU6kyGiQTbDEZdMxFVH8OBlTHHjZzU336N7A155arwhMuv?=
 =?us-ascii?Q?b4pQD5oUi7WhF1RKpl5MZ0uqiYMabTa6RPqAFfzEQ9r47R+q3lPVmCSysDNi?=
 =?us-ascii?Q?UN4Ed71a+pstYmAhnnQYI70zVI0knAUyMQaspIm2M5RzWDZnNDHuNfnN5URR?=
 =?us-ascii?Q?BaWJ269m/Oj8wXSRo0sAHG8ql1jOzqzPM+UI9V6DBe6BStk2DUHJ4oTUrzwC?=
 =?us-ascii?Q?botlv6AYfotbnE2GSSBBNCUBK1Q33WRYuUl3I7dNCJha3UQ3dbpFoHnGCNhU?=
 =?us-ascii?Q?4gF7LOtPC5Rza6wI4vIqkhojJIme/HBGA3LV2tDSTEuWVFsdu3aXXzUCoO2v?=
 =?us-ascii?Q?aDUWx+aZ8jHL+EVDB/ql+0rH5Csh2eFfG7Cjh8d3+9d9DnjYH5yQStEkl4LS?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y+YL47jcK4Uoz14ofwRh9PTjctVT6aso1R2F2fyA6b0+qm+TMyn7FygYKU0KeUFZndCcHk10Q+Fm0h8y2jgiOaV8I3Fe7qXjTI0lRFiCOVgdoABBqenlDpJV6aKr465Q5UfH/LNDn1kwjdZhYSPbDK8i1b3XsJEMhVa3arjPHnSj5SHnUbulbKaOa7/W6o64kltSBZkn/kuh1vsF1BmN8YsgeXPzAZx6YqBHo+hQnIdVc6hV2h38mKsvqOi6tNqn0/yce7wC+5Y8s2wdXt0DzCB3qNN+SK3PnEXOYcn0scE8bY0iQSm78vzdgbaW5FL5E5HvTmhy7n8Bx/RV5GrpIMfqhMS3Cbl43/qExy0Pov6yfXMahVqA1I05729qJjW2LKznP6nLTvsHPa/RNNaf8h60GvaoiCdSr/p+JTY9H9w/5L6qGuJqftCp+VdftknwNQBRKpkZARv1F9A7iUu+aORnUp+JZfkPpgZ7Iy06LlJFvJoExN5oqPR3PrGuemL3GYY7G8HUIb7zycE8HXVyh3e9A3x/mm2yPfTcePC/pVz9ZnX5jDKu5GHb9Q2UOpP+B3y6gC8LuuMWzaX9gYeEWmK8nmFHVexd5XFhUFRHRqw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9986e054-4041-4a50-205d-08dcf79623c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:59.8064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QcI0mjz4bzyCh+c6Da95ihcHobk2nQHWm31P3X/J7A8VI3tm1XJWIWx8KOJam6ibdF354mKVQLsy65yUgsG8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=885
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: Vt1MlcBdBiMGT48FXkAS9Oc_-ILMuTcu
X-Proofpoint-ORIG-GUID: Vt1MlcBdBiMGT48FXkAS9Oc_-ILMuTcu

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

