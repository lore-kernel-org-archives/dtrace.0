Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912721537A9
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621161; cv=fail; b=KyPsIQt+RHrfBVhMbakmu8/Y4LDrz+On2w/l8o3BvmBREy5jS2ce5Kd2JtgIDpMF68NO8rC05qHB3Ye+O2JbjnrZk8MQpcWPs+tCAcaRbXlTsExX1IzTKCneCD6/ljtfFcxBjMK+cU35u/82dmO3mCua8eI1VVucXIoFOMvu0ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621161; c=relaxed/simple;
	bh=JUBwFZ+iVgu5OMgNzvJ+GNhloDLeNVcWx8RVRAwwfqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GQUcYLxR+kMv7BRWJGxby8vzM3P7I1phF7aWhcgc3+r+VSLr3L2Ru3k91EHaZ0cmQlTt+Mxz3+2G7zATVzucOYNmidJkowUZrObqRh44ry+hDqufwIbd97w9MFARNgLCmraLL0oOg91uXd6kvVQz9uOPdjVyeTXZtCJXvVboTec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N/wq8JUr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mmW38T24; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N/wq8JUr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mmW38T24"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtUMd002987
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=y0G1jB6OoSrGn+1
	NKJavpXeuHSA5Cu7yh2RQT8nyxAE=; b=N/wq8JUrixus6Q0Pc+aK2zA21a3Yyhy
	DO1GoBTGDC2dTXUGwO894r/C+rM96nymwodXbgsx0WUNl7qXx6l1Dh9nftURu/it
	PQge1yDevPcJDQ1MLC82Jk/KV5nLnL0bcBGSxISklASoiXH/Cy3aDWb/yCmZNfx+
	CO0VG1J134C7ZOnIq5FI4ey7ps9TsB6xDCJfjAVb9+xEjEd9XXX7UyviuLMrKR1Y
	sRGObET9rHwRsEnsIC8wenI3GsGS3sxitRA6MJsaytYByEUI37O80Z2CDZHc5IU9
	X241Qc340k6l+6Mn+jAzHxuVVWMUyKSisJWGomkXBrGteZwB8qDnYYw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8hu5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:52:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472HAGUi001824
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:52:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp1xpb1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpH4W09PaVfbmV6vw/VS346vEFyUmEztMMfbLI1jhsFoaQX10Cp3Yj5DeTw397WZfSMDIp+X/cuuCI8xsBHUGZ4bkXWwsRUjDYggzMmFdRi6KZ/LYCA0gg3L7rgIewhEblZbbSb/egE5v70n5T41LWheJuAk9bmlfH8GnOBrWVMswc2zfmZoikA7nFodBGVzdIPBNMUTJMmYYTuxJCrNAOGkLByWr6Dax3O1bO9X1ChXubsawOQxE7fH+dD5aXFZJCtcMgDYZAumnsv+DjqMh3Bn9CtibsBIZd460enjFpPSV4wXdibZMoaBgQFTaWAU9EUjT9OXGtbeaWZ/3HgxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0G1jB6OoSrGn+1NKJavpXeuHSA5Cu7yh2RQT8nyxAE=;
 b=YvQs5XyOixK3SWFjCWsN/oULXrWeFYgBU2o7WfRpYuSu2EISlNgL6J6CYOXUf2abaPgqfRFdvQw5yXae6JRUb6HycsU++GIZhgr/OUEraL6K8QrUQU9Ns4LfOXsw/cIJVQPjLGl6G7X/WrjiarHWiUQ15f+oUayHQvOTHMacAv1XIru/OB2fEqg1hkuRmJkWwrXnTnnNqZu58YmlDXUzWbCmghEzs1U1g1ExbOHjM5P6bu84gMuvnxpSqAWAbfBmD96322YiyfTU6m/3Dm1UnbwbS2oeBKNUluOEV/KDoLciIpTOLgowAuNJdqOrVBHAc307v8W+O1aXn2UQC1TLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0G1jB6OoSrGn+1NKJavpXeuHSA5Cu7yh2RQT8nyxAE=;
 b=mmW38T2430/GeN3VFOWnnx4BGGkL8Tk+IOcxipbK1JuJWqH7ICfW9iJSgquB6rNFZaMZTmFA1+6HC1KrEtknBTVujn8HTojThGsFcOMZPocR1cRyCVs2aZVqJU8K3CUfr68hby7AKc94x8aAzMSGx1UNsXXa4SvHLN+hYXjOpZU=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by PH7PR10MB6460.namprd10.prod.outlook.com (2603:10b6:510:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 17:52:34 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 17:52:34 +0000
Date: Fri, 2 Aug 2024 13:52:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] bpf, fbt: do not try to get a return value for void
 function return pronbes
Message-ID: <Zq0c39p6dgF6rsDK@oracle.com>
References: <PH8PR10MB629267A7B790147418169E8DC2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
 <4b35d162-6850-1c2c-66c6-3066a6e058e0@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b35d162-6850-1c2c-66c6-3066a6e058e0@oracle.com>
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|PH7PR10MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e437f8c-401e-4014-7bf2-08dcb31be356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SyCB+HkaSqmCIgHYLB2KrAs8lnija6kf2KlzqGFJPmClzLrr+RY01VaR38st?=
 =?us-ascii?Q?PQuG7Yz8GahEUF8DoR1wCzhTjD/XPZ21kt2wJAxCK75eok50otKYYN2L4ifp?=
 =?us-ascii?Q?UxYZfsjbK3cVnCqyII+LrcUOijdyuIQqWB+hpz2RB0C0a12kH/hkXujCnRql?=
 =?us-ascii?Q?KrLZ3uOzrkafuKLzaEg9iS6htj0Ueb70NpCsRBnnJRZHYIVYvB0LdooRNeLV?=
 =?us-ascii?Q?9r1fOtaodsEETPFJXWMFKAOBEpJcA7UQh43zZ+NDWaVC5c6601pDVYIQIIhW?=
 =?us-ascii?Q?5nI8qQ6JJQ6+1G1rIfSyCGSTI5eZVHW5u0jDYreNBVrr/y27wM7MHgohbhHx?=
 =?us-ascii?Q?txpuKJ0t5dfrtO9ST+Hn4MWfv1X1Lu/zVjpbSCOwDFYmdDLRFyOXa4NTkXe1?=
 =?us-ascii?Q?z01eAYL32nn5yP5KBPOcjMEdNI1AZTYl54Q+Ctj5TqvR6RuqruPzSBSXB+2g?=
 =?us-ascii?Q?u/fkl9EM05whByM3XrfhEJWfKCgv9wH+Iigm1nBJBUXJWkiZ3AdgJxOJV53O?=
 =?us-ascii?Q?851E8gKJX5M2HjY1az2PbvF+JfNfzOM0CPJrW375Ksc7sgXfGxpCnUs3LW/1?=
 =?us-ascii?Q?M8I76dyoYyy+kvehddUPKBp6LkDCm87ykJ/xVzRGPRv8umFiAk33bU9LYlGU?=
 =?us-ascii?Q?l4itVOvuXIKJe4z+qnDWE+kiqbpTI55Apc1mAALSqR/WaO18/3VzlW0grn2u?=
 =?us-ascii?Q?z9MSMfP3Jwbk32dLW6hkTgsgC90f8aiAfuHfxk7OpbroMPKLRan1Ez2nxpxh?=
 =?us-ascii?Q?dSov63S2JV1w1Mz1a9alfmyuy17kowFsPArMDgNPnnW9s8Wm39DHJtFDiA4b?=
 =?us-ascii?Q?H/VXrMdITmRoR9dNdG5zw1i7/OmGCsv8qEJE2sep18nBST4Y/d70d2FVPns6?=
 =?us-ascii?Q?Kr6PYKoqOw/rlyJrNZMvhr3MINbVZxOmGoPj5bSbMrCBqyt8ppwQHywEp8Z2?=
 =?us-ascii?Q?ksusGSUDCfvP/U1yaApuPcbtjhFJjo3mSc2usqMJgHnvQ4ZK7dBl4RgB9VRb?=
 =?us-ascii?Q?uJ/1xMeHLWEVcEsqZPAdeB7PJXxOdWlXTzO/3vFqiu+6xwPRErXIqVrmB5ib?=
 =?us-ascii?Q?WhR+SUeFvqO+hcQmIHYL9Z3kwLEmX44z0BA3a3RT7O+FUSyfe4A/1Aw18/Ne?=
 =?us-ascii?Q?JvufDZvA9ZLQ+b9DAQ3VpY4zOmXYdQeXJBLziOkul+JDDVtSxD5XQ3s7msr7?=
 =?us-ascii?Q?EidlJFOHB684QbeNg2ZL/jUXWXFkjdyX1v2pW4xXsfwMn2NhB7zPhgAh48gj?=
 =?us-ascii?Q?yi8FW3vyB3tVRkSELFLn/QXUOvseZYPEMBeUAtbWWMEUKzPpTOu+Tr6QwgKu?=
 =?us-ascii?Q?WjjuKckupXOmJsK3wKg1Klz+KDnVPHZIPlh/+T8sKmTHniSQGK7omJXJKUs2?=
 =?us-ascii?Q?5U/Gk3w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CmytXzOlwrMycIi4aWJjILoD85GgyLnu+cxoaWr0ViiqItzBV7njikzbRBpu?=
 =?us-ascii?Q?9qdAZ5BZ6eWPIQiTDvW+Bg2htjxu/zrCMllCOwpfZylRQg6DpL35OxtIgfw8?=
 =?us-ascii?Q?tK4yetndO8gnqowFqlgr1TpQKAyJHylNeELdnhdDhMrO3FsVocrtyWH5fRLh?=
 =?us-ascii?Q?LP79yxL2NZJk5byspPw1htppW8H6/iqXC8Gyrutn3aK5sE2v5LZcxx6YN4VQ?=
 =?us-ascii?Q?jY79dUxV5tve/KUc4+P8OgQ0ebKyj3F18hQJWMAwvLTdjQ5lAvAeEjbord7x?=
 =?us-ascii?Q?QDQu55fgJ41Kb3iZpGMAp/bBlnzF4YLoqY/QJO+d2bRpHYNNTIRWVXCkayij?=
 =?us-ascii?Q?5nqui2hZ6fcUQe2VWLe0+Fnk8BpGyZnDAXO0/AJFD9s+DwpjpStYyq/5dAEZ?=
 =?us-ascii?Q?X2i6uZFOMDn4Cy+ZSSqKjyzPRGx1IvwUQmatRTjw59/IL2ZQVR1V1x1S2Wm3?=
 =?us-ascii?Q?ziFPWgEq+c8TNtClGy4fDnE68802J4ieH1Ot/H3GImWJFt0HOT0x9L3hUOVn?=
 =?us-ascii?Q?bvVpfPchttpgPe5LOQjcXIjXPuSdMut9w+vJgf9glDM0z/1Bmp/es3j906lL?=
 =?us-ascii?Q?C8ZoTpcR1ySST/WIwrjNz+E93zkFNXPfow5J+UZ/NmvzhsHzNgmf1kSYRys4?=
 =?us-ascii?Q?9BzNuRLB33kK3ZkE1IV70XhLuTAS7dTvGgY2L4DyNYweEQUjXcveZp1I4sxi?=
 =?us-ascii?Q?pb1VluotS45c92deYiy3sioT4Qt6+xGsV2f34RSmALzKl6BZVHgSVx11wY9B?=
 =?us-ascii?Q?4mSpagoBkgmgiFB+EIG7FW3j1yEMW2iuqj16yWWExr1OrefB/6v2X1PbxThQ?=
 =?us-ascii?Q?a/CIoU3kEqsXkijDWhEzpUbQYadoOqlY/wUoya98mBcSUZuHtE/22AxqKxXK?=
 =?us-ascii?Q?hCpU1EAciLchUuYkLD/JeLeUKByGIjLhUQUrVLOXML399YVGX5tb97Bwua8R?=
 =?us-ascii?Q?/ydsatdg5dYLZhdrSzjLqwBMi7aPyUCazerAksohUr+WfjiYoUihEwG5Nj8G?=
 =?us-ascii?Q?MnTcqAgjpGRasRccEltkz2S6YKYfoK25dYYhxr8IiZByasyQtzuivR76OatK?=
 =?us-ascii?Q?i3De0W/CzO0OhHVxt8/e8RZgg7y2TOnQgF5CD7MKOu3rgsJBQX/XopPDMOEM?=
 =?us-ascii?Q?py201lgF/S3HS7W+QudEmOo5qSn2Htrbjao/3rMViOveMz3VBOYed+5hcRPh?=
 =?us-ascii?Q?Z2prbq4LedSgbWtZFI2zL+xvyFVvIhHtZcuWsschJaXYYaOmNntlCsPVEbax?=
 =?us-ascii?Q?ADwuaZcX34kLHXiPBhHMffi0/LlP2vu7kPtahefbW3/UDcuE5Bo05gOsCSys?=
 =?us-ascii?Q?W0Jnw0JI0dHouKaVs4T9OkF/7G5z2GWcrUAzi5t1PGI8tU+bqjCGt3uZsBbi?=
 =?us-ascii?Q?zxcvQzXDvhAAlVar5T4xoVvpbBmoyG5hrDCiT9i0VYYEpTog/yDFYV2J4MzL?=
 =?us-ascii?Q?+3OyENftEsB80hfC0nFhWatUBYSBARgSAUDBI/SsZoQEd8K3DovH4MudPpAp?=
 =?us-ascii?Q?cV8B8EjTPnjyT6sUGHS+PRGbUBJCTUewbZ4v7w2cmnFuXm00HQ0aKnrgxVzH?=
 =?us-ascii?Q?vQl56wHzG+8ttpmaIxBjQPhMepsrvy45WLM8EFrqfJO0UZA40DvfU7V+/3n2?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Re43hHCFtKSPLHXGxozJJQDgrrYytCRSKLtuxx8YwqKoVvCYnGoGLb3J6iCx/Yq26mo9zCemOfVxas9Ar3HMGo9geo9sYI29jm7cwAixbXlcL5coH03+gI9BcoueRtmjaWw4XgxWnuWBQEI1uGy5Dol0YenTD0LPu8lN/XCMUEK+srIVcIm967UuvZnPGPZwcgpJibmy4E7LPpBzC8L1CyxvcZUhCu+qzfUp9tTS4yzkGnB+0/ZSAKaxDFxu7l1fuAc1+Pdx6U8Vlv288eoVB97VaAOvptb653/qQcVsTTzSp1R0OpUu0TM3kkU6baPQlla2MVp8Pw1VxXq7w/Su0CT/6Rqz/pE06B0b+sGb0HKDLjzEdwlq7XowUAYVkW30eitB6JCiGqiQJIgk9rU9d5Xy8pkp60RtF4LtsWwCBkCAIxesbGKBqUlVm479I7X4ckKVVA1gUlwabwG71a4c6dBii+43Iq2XEC/HX23NXDJMSVA86JzsusQMl5Eu0/JEFi2dBm6YqgldzsHkSZpPlaSk19DqD/hR4ogTchJoIldZEV4cmqwQT7IT35Orv4TUJLBCTphw7XVBDvulxbWx5Q8WwLlQeDDHyM6tdoit/Z4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e437f8c-401e-4014-7bf2-08dcb31be356
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 17:52:34.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1wMtHGYtiLEw+w0uCki8caj+c5Bxu4tCCr+3nOjzGskhDGU7F/+AjIzmeCMbYNDPtPLuFHv+uG8Pm78WvqkWzeoDEO5A8hfUU4E1qM9KzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_13,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408020123
X-Proofpoint-ORIG-GUID: 3nkmSI0OQPFx9ygSI6mjvqVHSy7vr2gP
X-Proofpoint-GUID: 3nkmSI0OQPFx9ygSI6mjvqVHSy7vr2gP

On Fri, Aug 02, 2024 at 01:45:46PM -0400, Eugene Loh wrote:
> Not a real careful review, since I'm not that familiar with the BTF stuff,
> but:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> I assume the new tests already pass on kprobes even without the new fixes.
> 
> Might the tests be (theoretically) a little more stringent with .r files?

Hm, yes, good point.  On that for v4.

> On 8/2/24 12:35, Kris Van Hees wrote:
> 
> > We were trying to access a return value for void functions, causing BPF
> > verifier failures.  We can determine the return type when getting the
> > probe info, and set the return probe argc value accordingly.  This then
> > drives the code generation in the trampoline.
> > 
> > Reported-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_btf.c                            | 16 +++++++++++++
> >   libdtrace/dt_btf.h                            |  2 ++
> >   libdtrace/dt_prov_fbt.c                       | 21 +++++++++-------
> >   .../fbtprovider/err.D_ARGS_IDX.void-void.d    | 24 +++++++++++++++++++
> >   .../fbtprovider/err.D_ARGS_IDX.void.d         | 24 +++++++++++++++++++
> >   5 files changed, 78 insertions(+), 9 deletions(-)
> >   create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
> >   create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
> > 
> > diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> > index 77366df6..e905580f 100644
> > --- a/libdtrace/dt_btf.c
> > +++ b/libdtrace/dt_btf.c
> > @@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> >   	return -1;
> >   }
> > +
> > +int
> > +dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> > +{
> > +	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
> > +
> > +	/* For functions, move on to the function prototype. */
> > +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
> > +		type = dt_btf_type_by_id(dtp, btf, type->type);
> > +
> > +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
> > +	    type->type == 0)
> > +		return 1;
> > +
> > +	return 0;
> > +}
> > diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> > index a7cee464..e05b30d0 100644
> > --- a/libdtrace/dt_btf.h
> > +++ b/libdtrace/dt_btf.h
> > @@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
> >   				       const char *, uint32_t);
> >   extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> >   			    uint32_t id);
> > +extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> > +			       uint32_t id);
> >   extern int dt_btf_get_module_ids(dtrace_hdl_t *);
> >   extern int dt_btf_module_fd(const dt_module_t *);
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 461d5e35..80c3db20 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> >   		/*
> > +		 * Only try to retrieve a return value if we know we can.
> > +		 *
> >   		 * The return value is provided by the fexit probe as an
> >   		 * argument slot past the last function argument.  We can get
> >   		 * the number of function arguments using the BTF id that has
> >   		 * been stored as the tracepoint event id.
> >   		 */
> >   		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> > -		if (dmp != NULL) {
> > +		if (dmp && prp->argc == 2) {
> >   			int32_t	btf_id = dt_tp_get_event_id(prp);
> >   			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> > @@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   	dt_tp_set_event_id(prp, btf_id);
> >   	if (strcmp(desc->prb, "return") == 0) {
> > -		argc = 2;
> > +		/* Void function return probes only provide 1 argument. */
> > +		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
> > +
> >   		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
> >   		if (argv == NULL)
> >   			return dt_set_errno(dtp, EDT_NOMEM);
> > @@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   		argv[0].native = strdup("uint64_t");
> >   		argv[0].xlate = NULL;
> > -		/*
> > -		 * The return type is a generic uint64_t.  For void functions
> > -		 * the value of arg1 and argv[1] is undefined.
> > -		 */
> > -		argv[1].mapping = 1;
> > -		argv[1].native = strdup("uint64_t");
> > -		argv[1].xlate = NULL;
> > +		if (argc == 2) {
> > +			/* The return type is a generic uint64_t. */
> > +			argv[1].mapping = 1;
> > +			argv[1].native = strdup("uint64_t");
> > +			argv[1].xlate = NULL;
> > +		}
> >   		goto done;
> >   	}
> > diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
> > new file mode 100644
> > index 00000000..4bdf36cb
> > --- /dev/null
> > +++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +/*
> > + * This should fail compilation due to accessing args[1] (not args[0]) for a
> > + * void function without any arguuments.
> > + */
> > +fbt:vmlinux:oops_enter:return
> > +{
> > +	trace(args[0]);
> > +	trace(args[1]);
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
> > new file mode 100644
> > index 00000000..516d733a
> > --- /dev/null
> > +++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +/*
> > + * This should fail compilation due to accessing args[1] (not args[0]) for a
> > + * void function with arguments.
> > + */
> > +fbt:vmlinux:exit_creds:return
> > +{
> > +	trace(args[0]);
> > +	trace(args[1]);
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
