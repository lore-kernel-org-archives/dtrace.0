Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA81D88DC
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840397; cv=fail; b=D95OGle2YXkUkr7EeaRuTVB6Gm/BK69Se+fLx47wBWLLFULx1JvMPJLwy/dyChxrTImlXLEDfkHykfw0zLCudJoMUFM/FPeth5Q0/Ds0qq56PK72YTVmSP4Ukk58o44LmeRwGUkyZXcGNgxCHl1Q2KXl2UFWH4jPCuuX7/NrSak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840397; c=relaxed/simple;
	bh=jPA/tDOrAxO9O7hQG/CjQjZLpYexZxdSY23Rp1/v5DM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cf7YNMNMLYezLyX//O2+4CBCAEIosVFTpyeR7SMdJ1PZ4RmtGglFCgjTunirdQishFatmdHVBLcnkocqkq+v/o3GI/RTwIdtyF81LSDbaf2ueoNVtS+fHeANQdXRWhF+n+8KqCiYWHLM0CqY7403MJ3uCU0ZoRT39OWNXwydbKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FLtBYH4b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T8001EUB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FLtBYH4b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T8001EUB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfZVI007063
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QOwpPxQPZTZj9LarEMr/2kPFyHTNp2N5hZzWUIIqG7g=; b=
	FLtBYH4bTLYtgI/N1wveUECIJ1rbhvjbE72nZ9yVUex0NpKBb4CqrXEQ4kNkWC78
	bo/b/JZJdVx7z2EklezS7CJJyOegLKGSzgS4PQt/AOzMwLQaF1C8pTScahLrFuXN
	7PzEsJj/MVNVJirhRVBCoPumc2q88ASdX/xTa0EQJUvd0wggMYT8zKETQH5sG/hl
	o74eog3Fjw6FMhxY5OQ+uURMvQa/JmQolQD21uyvu7ojHHEf0hoFi7YnVG+4wvEK
	bccsa75NQ1F9W00rBKXdZIkdSiVdlHRZCXT1ynB0j4tn3iJoC7myw9pNih4VzeSp
	HAougONr40E2YII8sCA0kw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpspe1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5J2jti036113
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdyhn8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+hi95OoQCybgeC7CTvxyVuB0sQyb9Ki4XYYtDISyPJTcKVmYJAHFqO0Q/WluwJuzixVCPrGR5XdK87olDohklteQuyrV43DcRME5KRmJFQE0tVPotajnfugM5WQmDTK0EtBRJqm5g4n5+okaq5exd+QIhhhvrvqVzYg7X+cDEtovJ2R/O7OcTKMDs6zV286vAHnMIJVXwxd16XqMAzMKqtaCmblITPDzuuIpKGI1F+PqH+fmcw6jJqgtHVmiHv0gIkQUorKjr5bhuOOlJ4PJxJPdCAKA8k0PSlNbErsj0CcZ57THURw/NOBH2MpQ4NNSwqWlsQMm8nVOF0tT/MtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOwpPxQPZTZj9LarEMr/2kPFyHTNp2N5hZzWUIIqG7g=;
 b=aVC3dF2+Idd7JYb3mFwwlmdWMrNY3kJ0+mSAJmExjDV0q8fYajxvr/hVV60C6cxi26aG5R9UGNI2bVxgnCkcf+nft7JWl2Ff5J6/odGSENKOXVaEPhuShBblARYUTtLOYrXql6LHYnQlGDnhReDmVsib6W1jsdfBneV3aYy7SoPfg0ZkP7IEZNvbdS/m8kxVOntf6WgdXPH+ShaNU9nukaHF54TxH9P3OfnTfyy0B+vhlFs09d3ydoml102OOxky5YElUyfX6AZMeIqa9hJqP3wwQgTyrsVJfzmIJWMex0e0lkTl23Vio/WcLGJwBoY37D9ggpBaAg7aSlIEWR2QlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOwpPxQPZTZj9LarEMr/2kPFyHTNp2N5hZzWUIIqG7g=;
 b=T8001EUBTEUwyQUarZvTa8HIDuZh0zTT+nOolXOwetTFoWjqi83LhoIGtL/949hGuhDHjl6ZPMrDfmWyA+Rlz4B+9y4hghKYAP3wEkRO0emS34lLYANVGJiByhe2sAD5TJ7480A9x+9nMgC3sq2xahgZPdZupuqMn2NJ1ck/KZ8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:49 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 1/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Tue,  5 Nov 2024 20:59:37 +0000
Message-ID: <20241105205942.192409-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: c439bfbf-e40b-4151-9e18-08dcfddcc967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0qlYgrT0GTPEZSuOB6crCxA/YadzfC4tGrZcnpwd1Xf+mo/rJwAqy+NTDixh?=
 =?us-ascii?Q?KFDUh3FSobA6vB7yA95J7BlDH9VjXWizcca5mgD/B4vIOa/aCzsWhkjB/rmO?=
 =?us-ascii?Q?siZAfnEqQm2s/3/qp3UUrof9jU3a93ZdVPoSMpn3TiwadTccy1FaeY56Q97M?=
 =?us-ascii?Q?iqTAlibH9/mG2+JjjJsB7B2fjcyz3G3IHrKgwNVVdc4GHF4/o9gUZEzejX/4?=
 =?us-ascii?Q?i5Hz5xlptsxS3ANcS9gRO9Y9fo/FGJwaPV/ArX7JDKLrlDjFbAGBcy1i6/Tu?=
 =?us-ascii?Q?UhK1jcj7HFRISO+XJzeZ0REnxUSUj3WClBeEOBXRI13V3PUstgvBGOfpW0qS?=
 =?us-ascii?Q?anC2+Sw3mkuNbWqjaX/iFzqBLcB26+pFZWqBLBn3MgdgQB08Uho7JGX2hbKx?=
 =?us-ascii?Q?Dy44VzcNcIRPbB0W1oB0bLyxf/MS/itXgGY+cwjG4uPxzMnmFPTMFba7qc4T?=
 =?us-ascii?Q?C2kiVf2oRrY9SgOEoyRsgcFHG84b3KD1V1ATvFR4Y89fIdHka95smotatf90?=
 =?us-ascii?Q?s3zTbf6FDTbuiuMp05HvnnQIVA+LbtTyaxGrcdZWU/qnPMWz0G5qfyG7fD74?=
 =?us-ascii?Q?5c4mDqfg2OFM+Vrhk1Dy9X0+aSj8nhK6YuX0cPwZmSaOFkCzbiTiFer617fS?=
 =?us-ascii?Q?S+jtnObhehgUQdrT698AmbjjCyAprKc977Hm0a2nS3XEbLnyuTaewz9QvpY8?=
 =?us-ascii?Q?ewleFGdP88A0mtKoc3ADa8//w/fyuPZEYhiSbieuGdXA9UMdzQVIesoBNN0M?=
 =?us-ascii?Q?ULuexSufsdNgsfY4XPMvVwHvdspQ/QxQbjsYzQxUQVnjR2MV8Gk36I+hc/wa?=
 =?us-ascii?Q?si7xkBIZjITT6voffsP9gsrXWa6iqrKVE8ChDCRostsxx3NuMs+PP1IJa+Wz?=
 =?us-ascii?Q?nvl7hu+2vm5pruyRb/dYKG0aaerhRQK8CLKeh7s33GhH4mTp2kOzV7p4h8LV?=
 =?us-ascii?Q?OeRR9pwxLVhALHHrNCNPDxZxlB/kfyF9UESGgUVB9tk/RDD/prB6yUnX6uPf?=
 =?us-ascii?Q?pzVKPxWh05QXHo5Ymfv+gE5R8SU0iXkLt0AvtBq/oWbZu3JN0FTlCx15NCHA?=
 =?us-ascii?Q?cmV2fF6ZdECDaiSMqcv7NM7cJjdM0a4ytqDzNMMqDYLNSomRHls93aYoAueh?=
 =?us-ascii?Q?y1fhfLdaDOLpxaHZfYGURIEVE2+7xvaBYPKh661X59/Ube1+beF1QWy4iGT/?=
 =?us-ascii?Q?mYVYkAS4oekoPQ18VHMWBnmVk+j5kaLUvPL9jI3A1hpVFSACm/SzMtAkK156?=
 =?us-ascii?Q?NebIZsmyrPRM+/4QOAq4EwnzWJrOAW+yeMSolnm6cApsovb3QWdSkTck/mHB?=
 =?us-ascii?Q?kGTUyUBbqudQIOPPdSkTeO/Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?brZrTPoERnH5ZZ563ufybx4S9EpXyuWazCUkB1Wf8z5eXohsS0xm9pF2A0eJ?=
 =?us-ascii?Q?fHoyHtBpSp+9ozMl52mmGC78oNuR0AfuAyvqneRA3G9O2farP5G/dwtQJtSI?=
 =?us-ascii?Q?x2QBo3HvhFNpXi5iyoVhDxuQjTAPunPRl+Of5MOxRZxwMfwfGdwvP/Mz5LdU?=
 =?us-ascii?Q?+3DoQsPAIGceERj0dWCeHzr3QzeO/1y+bseSgsEeMGAMlPLMTiiRDxWbEogD?=
 =?us-ascii?Q?Q1lEPYPgHyGJIS4wugHwNluzwumum5i2y6EfhCOHn6Sf1DrhCFCvg9XxFD4o?=
 =?us-ascii?Q?NuxIjF3QmDbnHoOQuoUNlM9i5+515EcdIPROqx8uZJViC06tQTxiWbBizQvo?=
 =?us-ascii?Q?Ywgzz3Nh33v0BBioVY/tNQorO2Vsa9ZcINCYc8xRPwPgV4TsINtkTEkGzKMu?=
 =?us-ascii?Q?OgTcDXvt9Yxht3/d4qBFzkiadn0tfySCjUmu1sT+jvChuQXdJPbgCm0iF+aM?=
 =?us-ascii?Q?T+OuAKV0d/ouH2TmDDAUSQAz8KbQGyVXt3N0SdWZnzEb5k6OcmJDI2FnTc4/?=
 =?us-ascii?Q?EwQB4PSKWASFqpTOBDbyqZeuS3dHQ5oRGI/KZsk8DuF+HHhGH+PyLNMOB3ji?=
 =?us-ascii?Q?ayaDYlrpiJ+Gfcz56cLVxp3TQck/UAbUeKbEo4to6n3DbeXJt3+bstAwZwPs?=
 =?us-ascii?Q?eycal+anFRWlWqDj0oHXseAI21+zeUuaH2I8yNLg1mAZGGy/eIwbsNic7JgP?=
 =?us-ascii?Q?e14gN28vgTghMK/THRpYKv5I6bEcwKuApDz3vNL8hMOFK6FqlsY/UU6HOqqk?=
 =?us-ascii?Q?Y1TbfcJ+yxxCxyr5IXnD4AeHnbKC2G9TnT9fGfKrvO6sxRTErWajGKJCXYdX?=
 =?us-ascii?Q?D507O7MsVg3FE41bPxVb3aTHRTUdUB9NgEePasZaagic2+sADBr+D7K+/kJy?=
 =?us-ascii?Q?TccqDij4mSE89zVxiRSAJ0cCDNPv0m66Da+8/Sj5K8wAXBzwWdhqUY3xfyrV?=
 =?us-ascii?Q?Bl8CbzUbIOJn6jlkfqG1lWYsLaBkD+uQmEKk9//OEicns02l+3et47uABCvh?=
 =?us-ascii?Q?FEJw6bgqcNfqclxRZ9PkVIpI1Rn24DXRa5gpvh+pHgEdSfkiwDwpavwBAmmP?=
 =?us-ascii?Q?MKzVv9KrjkcqfyZZMyTQYtPfaiL05Ewdk02dj4RuUNUBktlkFe7shbOHPkjA?=
 =?us-ascii?Q?is63qyu19gHvTF4/EF2jVi0qHmzN2IFLwpCNpUOvtwi0Pc7nHS5L7xJfk17s?=
 =?us-ascii?Q?PG7A35Z5ydh4Cf5TxxFlIe6dlBnDyvIjzxrBx4MFhj1pIWPwaz8s7t5sHLhz?=
 =?us-ascii?Q?YM8OP1oSy0chAFr6vmNtKtMvelqQ0DYEMCbMjQuxRjwPjqkCHVYJqvobcPH/?=
 =?us-ascii?Q?LUCEd6XujbTq4xt3eNwtirAMzxLAD/+CdptDzSV7xmv/Nx8m6SrUODIiiMV+?=
 =?us-ascii?Q?q1vuamirn4/n9HWhH5ogyfEHTfdeM1BzhoZaH0xtFxZywo7PY0GoB2Hrd4ar?=
 =?us-ascii?Q?JXigCKlZddCJjkoY/c2Tq0ben85JiiPpvVTndeWlO5e0/SBMfGTpkWfZ+8Bt?=
 =?us-ascii?Q?EBLDzimNvW0gipKi8q0iT3na9g4yAJpQ0NyZfrIVcSzp/qCWwRExS1oa9tzw?=
 =?us-ascii?Q?YqID3oU5HSgENJw5n4zM4e/7JfMSu+TqY8qR3eFsxSn+KSOHAIJ9q+dAp1wx?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mX5Bda0n2+R8T+kg6lRX7hJrauQcAbMm/mJ9EIkVeMCaAYA9sC8g6YX+dSqc1HT2de1q6Fbg5mgeDnMmv5AWz38L6h1H2yMMNEWQfSUP0LB8C6OWK8G+PHQo6YZMRIGXMjXawAIFT/ig0N4b7OBEOErY+YF8dOWp4GoujThMQVsTuTImDssBCQgFHY2q3a39hEmEiSy4KsFqSvKy0jcTWBaK7RfnSoJxf9l1KbwSz3saQhLEQudiDvZKu72A5UCXUHmDnOeOfpsco7eQDjpDyyYGpbbDUst4lqTmjKfalOa4g8BiQGQNip3JtOpBxp8SX5+VEctYvqleTnM/qoilSyN8uIQ47jqmLtq+Vb6ZXxylvbYaHAVxz8oFzB1jzd5CVz3U7OhgbTYsUQepAdwyjKFtebU+c/mC1H9uvQUjTvwqDqr2Nl5ccRfA/OlVeh8Mnr/BVS4K5l5TC+uXUwh7mBk4ObZXljViWKgBpg77DcvrTBDBajCbTQQ8VoNFwsFLumf4WODZcXxlylPWGt7zjM2Z8hWtURCpDzzZFkKltCvwIF9W3Hc2aIatukEUGIk8NY634m9SI3D2SvajLfmTY+EuCjXnGpenR0pKM8mp9iw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c439bfbf-e40b-4151-9e18-08dcfddcc967
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:49.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nrhUlp0Mbx0i9QVmqMg/Lc4vYN8Jjdc5CUSZ6EjMDZD13b3xXZE5fQ6lb6JE/UKzrHK5kcxFIzMI1n2ZwlMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050162
X-Proofpoint-ORIG-GUID: uuZ5e-RdrW55GSQ2elZ5t0mmp72UwRlX
X-Proofpoint-GUID: uuZ5e-RdrW55GSQ2elZ5t0mmp72UwRlX

This change propagates native and xlated arg types and mapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg mapping
tables; to make life easier for consumers we emit them in a defined order
(documented in dof_parser.h), and add arg counts to the DIT_PROBE record
that precedes them indicating which will be present and how many args are in
them.  This means we retain the property that you can always tell which
records within a provider are coming next purely from records you already
have: there's no need to make decisions once the records turn up.  The DOF
stash hardly changes: all that happens is that the parsed data written to
each per-probe file gains some extra types of record (it can have
DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
DIT_PROBE record now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and arg mapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  15 +++--
 dtprobed/dtprobed.c    |  10 ++-
 include/dtrace/pid.h   |   7 ++
 libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  62 ++++++++++++++++-
 6 files changed, 258 insertions(+), 50 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..8bf465678217 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,10 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
+ *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
+ *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
+ *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_ARGS_NATIVE:
+		case DIT_ARGS_XLAT:
+		case DIT_ARGS_MAP:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
+			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index f4c6be1e045d..2ca39b26f88a 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
 			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+			if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..25bfacfdbfe2 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and mapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* mapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..1792a8bfcc84 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		}
 
 		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
-			   "%d is-enabled offsets\n", j,
+			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
 			   strtab + prov->dofpv_name, "",
 			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
-			   prb->dofpr_noffs, prb->dofpr_nenoffs);
+			   prb->dofpr_noffs, prb->dofpr_nenoffs,
+			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
 	}
 
 	return 0;
@@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+		len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
 	char		*ptr;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
@@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
-	}
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
 
-	memset(probe_msg, 0, probe_msg_size);
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+	msg->probe.nargc = dhpb->dthpb_nargc;
+	msg->probe.xargc = dhpb->dthpb_xargc;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+	dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
+	free(msg);
 
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (dhpb->dthpb_nargc > 0) {
+		size_t	nargs_size;
+
+		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_ARGS_NATIVE;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+
+		/* Then translated args. */
+
+		if (dhpb->dthpb_xargc > 0) {
+			size_t	xargs_size, map_size;
+
+			xargs_size = strings_len(dhpb->dthpb_xtypes,
+						 dhpb->dthpb_xargc);
+			msg_size = offsetof(dof_parsed_t, xargs.args) +
+				   xargs_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_XLAT;
+			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+			dof_parser_write_one(out, msg, msg_size);
+
+			free(msg);
+
+			/* Then the mapping table. */
+
+			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
+			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
+				   map_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_MAP;
+			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
+			dof_parser_write_one(out, msg, msg_size);
+			free(msg);
+		}
+	}
 
 	/*
 	 * Emit info on each tracepoint in turn.
@@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+	return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..8f42d00551e3 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_ARGS_NATIVE (1, optional)
+ *     DIT_ARGS_XLAT (1, optional)
+ *     DIT_ARGS_MAP (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_ARGS_NATIVE = 4,
+	DIT_ARGS_XLAT = 5,
+	DIT_ARGS_MAP = 6,
 } dof_parsed_info_t;
 
 /*
@@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,18 +71,58 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
+
 		struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Number of native arguments that follow (if > 0, a
+			 * DIT_ARGS_NATIVE will be received).
+			 */
+			size_t nargc;
+
+			/*
+			 * Number of xlated arguments that follow (if > 0, a
+			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
+			 */
+			size_t xargc;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
 		} probe;
 
+		/* V2+ only.  */
+		struct dpi_probe_args_native_info {
+			/*
+			 * Array of native args.  nargc in length.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_args_xlat_info {
+			/*
+			 * Array of translated args.  xargc in length.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.
+		 */
+		struct dpi_probe_args_map_info {
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 * xargc in length.
+			 */
+			int8_t argmap[1];
+		} argmap;
+
 		struct dpi_tracepoint_info {
 			/*
 			 * Offset of this tracepoint.
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 41a87955ec1b..a0b3d892fd23 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		ssize_t nargvlen = 0, xargvlen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +920,48 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+		if (probe->probe.nargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.xargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+			args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			argmap = args->argmap.argmap;
+
+			p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -956,7 +1001,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 				goto oom;
 			}
 
-			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_OFFSETS;
+			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_USDT;
 			psp.pps_prv = prv;
 			psp.pps_mod = mod;
 			psp.pps_fun = fun;
@@ -967,6 +1012,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = probe->probe.nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+			if (xargv) {
+				psp.pps_xargc = probe->probe.xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+			if (argmap)
+				psp.pps_argmap = argmap;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-- 
2.46.0.278.g36e3a12567

