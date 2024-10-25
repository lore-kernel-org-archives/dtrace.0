Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2553D97A
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824609; cv=fail; b=ligOjcXHlNPbitrF8rRUIRYXoe76oSeuIRTL0aSRl8zFleevL2F28nAhBREpDUzLz/VZ05/NJ8W+84FF5WvUUye1oXmHEkFyIfxAsO9bE0DZos/9ku5oYsuDndmGUnMg1YwM1dlFdTyvfbAPLBQyqNdiR70cx1h76yrHtg8kjCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824609; c=relaxed/simple;
	bh=IOllFtgPslLL+DgkD1aXABMZZIfrd7EzmebFtPtZPu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f1UwDnNVRJgaNz5lP3R8SCIbxhlMKZBMbru6eK5FYfiQpFrHND9AXpVSwwrKwArqYGuoyIISbzQoYi4HSbQRgc1cs5jKDoi6RLiRCvZkmBflTeD0t9UuJCaGm1rrpK72OXWlvxwQTwrc8KvlHrLhpErwuLEcLJXMkYZ4GF+6Bdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VWR+wCcz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0RDy7UpA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VWR+wCcz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0RDy7UpA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fgtG030112;
	Fri, 25 Oct 2024 02:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VV7bU12KBGOIfOndA/
	GlADW6v2trnYKQyFsrxKiqbxM=; b=VWR+wCczXArpY9hmDfpkRNLHRjSUNNJY8g
	sQMkP2Fh9ifI+MdeM2S/X8EXw/sCkQ1n/06a/sDIgPYlSW4ErZEnjOhfLkOWXcjV
	zTFSt5uqA4OVmaRWDDMHbom6W5SzFM/2UkijF2PKHwFR8EqR9cSOSoi6mRIRdrlw
	5BHOk4d9RTPbG4bLlFbofgWee4uy9/SfKoOR199SF8QE1u2qaxr3D7Yx6cWLUbSV
	E1HXMksQi7IkcpwGohy8govkECxb1rEJLGw7EneNmezQ9L3rH6AeYGT7dKBnzSBU
	HNGBU7FLRsIiuxP81UXw1jmAoD/3Ei9QWvbWBBqUM0AFIFRCEy0Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv116-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2JEa6018749;
	Fri, 25 Oct 2024 02:50:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmu43g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApJE/nWx2m7NAYj242eMUsnw9lAld4/z9ytf0PqWKF9VV+SkNavic+UC+9s+pm/+zXaUyDRCWA1WAKJI/JiSL0AKtddv1UgtRb5zHvCk/LCG0R8ZYVFKoJhoOaCMIhV7QcpyLjOE5LoVbrb8U1g777g0kLUKiec03vc2XcHGPDW6QzTo2DitBAZByfh7dUXiKgTThZfb30v4U9NZJu6s9CHR6Wa+0knyEHyZS9Gu9i1+VyRx2s5tg5qsE6nKRHX66UjZONJiJsf1uijFTAF2SIhzy//jq2LCuiIxJcHjgVsSCqPAjOL4FWtL6yn8OAxCvRC9T0f5EPvjwETS094ObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV7bU12KBGOIfOndA/GlADW6v2trnYKQyFsrxKiqbxM=;
 b=Vy5Oqv20LlJYhdB7AOiB2XiOdLkt2mxECBvZDmdH6eUjb7S5V9wzrTJ1Gsid1RixQKlSyKfO5Kmuh24DuEYyBerb4WxvlkzMpv8f7dNA1Nt+SINKcm/uZWumQPj/biuJb6vglvvbxuk+QlEeb4MyLQzgjs0QFfiktmrR6spNVE/2CWZChXhwBDgVQiDYzvZ1mOqI4D/apRKgPPgiFqK3iYC8sK4VhU94sgiE2r1HvEZYDN2kXgi/5yPi+LMGg6ujCjFpK9VJScRH9yZFZwRSwapg7VV5SYI1TyQmhtK5kqm4IwOCjTRq/Z2g079NdYajgF+ZqrRY9lkDPDkNDpCxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV7bU12KBGOIfOndA/GlADW6v2trnYKQyFsrxKiqbxM=;
 b=0RDy7UpAS8zbCnTz/gwwoaOo4foLVP8ZyARbf8QLhato3I38iD5CK/OkmOE4osmaGATwapTAF8no6ZOIjCW4xi6/vfTBOTyNqPHAvrz9faiv0+zlIyym8g+SWDSGn0GbbNQRNONEMO/GIgrB0nRT3s298SCpM/hNn1Ni0nuFq7E=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:49:59 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:49:58 +0000
Date: Thu, 24 Oct 2024 22:49:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 08/14] man: use \- for option dashes, not -
Message-ID: <ZxsHVKTPe_aqupFI@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-9-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-9-nick.alcock@oracle.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd9c1bc-9149-4d54-a962-08dcf49fb6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eVJYqgGo3AL9szJQmoXd0lf7wTdUYpHujvYabk+RAQ6iXkGhTsT65ixeFEWJ?=
 =?us-ascii?Q?TpmR+33x5ItnSebz978i+eTrWCWX41vfAtLqObgaIy1i7Thf3JpeBkqpDb9I?=
 =?us-ascii?Q?D0/SzUulxxx4wPpZwMY5w1kKI5dRtG53buz/n1nTATjwb6bBqdAfMQMPnhcy?=
 =?us-ascii?Q?VTVT7f4qA7H02VF4c0iO7qfmtWJe7fJabcgKCO7huD9+Xks2dNSUmob96Apy?=
 =?us-ascii?Q?AlDegiOeKfsIru7erTtkytTz0S3xsvIz2K++sMiI+sARi5GqibAXUjFxWdtz?=
 =?us-ascii?Q?71niFAEoH+efSmXYHg5AiWJHPqoGLkzuGN0+fG4HOo3zokpdg5KF36/PZCUK?=
 =?us-ascii?Q?LtPw4qgjUwUxXNc7nvk8zYkvYK3UaMAYN9CQ0TOKQg4n3e33TecG+Cl048Qq?=
 =?us-ascii?Q?nrntTybR+L7JJfwlSZ/7hRTu6KZrpZyAaO1EZcrJs62K5vxuvad4dJ8RVzJT?=
 =?us-ascii?Q?b6ln/SxCL7o72+mnAMJmGufnac3P3/bziBqR7SSm+vhVKavQpiAJ0Kg0O9It?=
 =?us-ascii?Q?ARKpIC0YidDSoRilmKJlrLoL3DYOuTd7shR+fdUojxYI9TYlBdfZmGPR5HmX?=
 =?us-ascii?Q?u46vy3goVlLW2U1qnohFFuF8W+z8iNzzCdoAK0RJve8jOjDssof31pSbsTDm?=
 =?us-ascii?Q?4lQHnm80votA+ew5uBFRRsaCwePsVGfA+Da6khYRA3GT3qTGwBq+gI8ZxOBh?=
 =?us-ascii?Q?fcuNBF0aF6rm+swpOg+x0UcYa2lZNUUJgmYbfRVXGq1L2hCFJIqTGR1xB9ps?=
 =?us-ascii?Q?vkxQcAUqhB0OgN8gGp8ZqxvuZO1+uXnz8INFrdsUwh0pR5scvhYSoTjFfHMs?=
 =?us-ascii?Q?3dLn0dfHq3fo5MCeaVToUy48DLhBQWk8DXr3XWwMh1g9756k7izuX+tVPzAs?=
 =?us-ascii?Q?bi//u2UMZddh+telxUDD0AJYtUXOKM/SOFGOUT2wiZa2wUgAoPf+E5yFvdNU?=
 =?us-ascii?Q?31TW8aGSagVMuteWFbU4wt1H077hjay/v4skwj2plRP484pPC5dT2tttkxVE?=
 =?us-ascii?Q?WA0PnRrsvZvaXtWJTors8xyoPxKWy6GyJVnoAhsNNfNWIUFIPb/tRwCRWyKZ?=
 =?us-ascii?Q?HOz1XpLvnhVJZl8/PybS8sNo2WFKdOW6PwBUNOPmvbEkHtr5hJMHqelP1HcQ?=
 =?us-ascii?Q?gzj6rRA9CcIRpmm9diDmp1lRr9AgvkS0RHMNwsSSdwmto8NSNvWYKXtkW0kO?=
 =?us-ascii?Q?j1/Np2b06V6eO0RC/8upPGsESarolx19RGuFOQMk+euMlgAPqcEFwO6LiPh7?=
 =?us-ascii?Q?JNy0xKtgVou+E5ap6eKZzZmr5Ee6hjVJ/TaWKrJCSpxu8xbdr7ndvN+85MkZ?=
 =?us-ascii?Q?R7sKTaqBs4pq62bRhUk++JU0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7DNWSm4R+7yxX5X4W+17LHONyRxtSY6BSwEhV1oebLL87KeUJ4qAyqeu4omT?=
 =?us-ascii?Q?PR/Jr0L6eO5bDO6/3kIjU7uK0fSSDy6GQCHPhW+tTZjVFD3ezsHlW9FY8mt9?=
 =?us-ascii?Q?xoHGW+d79Fat4ruYuLsHxX/0brj3JDtxcB3oEiSQ5Gyp6xCUE0QJeM4hmnFG?=
 =?us-ascii?Q?2K9XOWz+RFm+V7WaAWnWyYXTMJCIreX+t3wl/oXvTouyHjJrNqlEP2Dd6o5f?=
 =?us-ascii?Q?bHoMzvPbIa+lWjpY/fe7YtzIv5wbeiDBjVMnuiKan7dQgX6Cc/uexMIxlWNB?=
 =?us-ascii?Q?QZapjH+IEvEd3VFbzYu6+9kP+M/zgDN9euPhBntf1sOt5QmXop4CT2Ni678a?=
 =?us-ascii?Q?Q/gbRiqqjnknDFWkhFKabNC4NHj5Qc+RG+fjR8R3FKjXCD3iPV+hCaIoF9SL?=
 =?us-ascii?Q?fiT8lkxWmqK0O1/2X90O57f/4ZT4Bk34xAR3fcKZ+azTJptOQdPg5G5I5lj/?=
 =?us-ascii?Q?lIznuILhFQtMOaUNU5xgYjVtM/DiILRSS5a+50ffjRzyjsQ20l+V/u2J090W?=
 =?us-ascii?Q?Uvl7o2kERf1yAkImQtcSGUN0wY7XFLx2juzaLTUjTKgdDhhr5LAP0p0VwCp0?=
 =?us-ascii?Q?TxRhkCIzmeu3HA816zF73DTbPHJKrJMViEpISwrki8aL1V2NIBJvdoNV3Qmp?=
 =?us-ascii?Q?VhZoOIJf58/qgaDANFON1zzaT/VlutPfQsmrgWMhKcNH6hAPenYAhivmo+yu?=
 =?us-ascii?Q?eiItUv81IIoUw+3a1qhIBFMiHAdWD7nX9/Ye3Ycf0FkOpO65kpBG1PNTs3GS?=
 =?us-ascii?Q?FUyIlzaprMNTVP/2TUqiEmb+SRhGnsnHUe5c2irxPfyFZdUd6AFtcl9LmXni?=
 =?us-ascii?Q?hxEkASY36voDvcy+2c82MhTvw7K4ILzGNQKbJGDzy3Ja5fFZb6NWCkiZU2DS?=
 =?us-ascii?Q?SN8iMp58Odv4FybyEGUEBf8uoym0HhoW8Dk5Qg8bjIlxslI9EeK2fejnKi48?=
 =?us-ascii?Q?kEKDqimqn6HHhxlJ2yL11gVU6rY3FXxWqWrs4fbGZ/L17TtPV3b6DU/zb13/?=
 =?us-ascii?Q?pOdwu+U6FYyOtn8xhEwtSgWbFq36uRpuu/p4VLxMXIfYwWCPO12g5L6eZBcW?=
 =?us-ascii?Q?Gfvi0sSUX2DtPCwrTAWeCNS8b6+bNILzdcmD6Dcyk4T8OTJBivBHHR43ekRp?=
 =?us-ascii?Q?agdY8x6KHCh1KtyjA/dmrc1yPsEqSUsza6dxxh/HljKEEFwhPmHTMxsLFmgA?=
 =?us-ascii?Q?kjaP8WAVzM7l4o2rPClxL2T+DTiA/EST3XyHlSjj4E9G7VmO/t4KKrW141Xo?=
 =?us-ascii?Q?4UXQbVtzxvjO0waATk6+vFf6nSegHPw4kOEepULKqP0ziUl5Nxn+0qssWEqI?=
 =?us-ascii?Q?7jGMEZxdV/je3E5pcJ5gjV5+OZkiSEtxLT3QDfJnSsDZUUJfxqPcLB7uJS/D?=
 =?us-ascii?Q?Lc6gkBO5I2Sj6K6gA4qe7W6lUr6afQpFHiabZGRcLXrkcdXTU4Iz3VtuBlgE?=
 =?us-ascii?Q?xKXWlsObUV0h2377ROf2fbrAq7Mvd+yxJKa6lbu4eGBKkfz6xx80elnA5gKd?=
 =?us-ascii?Q?BQvcwu9wSyZtqRx7A9AjoprohBsC2AY+uJwtsJ0JsRklBz1x3hzXyySmzj5l?=
 =?us-ascii?Q?6LLBb3oQTFwo37lU6U48LclmJWbx/r1zvbpPvwzR31yZlXJZ20Qd9q4bNYVm?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lWiXafmAWseHbHB6hnZUUfDvF7XbDbIjG0Us8ZIWzkiDPPqRoV08kdhrGsi+hb6oUcNP/CjdQhZqqgR298R6cd1EI3ZwmOWRZ8nvLCBKqAE5U0QIFUcF5SfzdlPjScuRV//L7ul0VzzhZYWb/SWp7IkUw2Bot7G2eLk+MmSJrP1WeJGhz7Wa8njCRVbFC0OakcID4ZgUyWT8wL0m5ZRLrFrytGnKuO7QZXDU2CGtcWzaDuEBpUyQR+c9TxrUIgb1dbidOaErOXga06aCaPMiraZb66+x/Y+uRl1JGzcT9OxzBpM/nv8yXqZ+GkvJ8GQvZWT5BZ96/TDz/Td1j8+f2iTcKl2Xa6bFwP2NFt9oS4c7Kuq5TjinfVFTNC1pNcyxvm4ALLbv7SwrvjAI8Yr8NpEtwFLvRhH8FO+swSqC6U2pkf1YZPCirJiItqVhhMQ3jjVvrlcBJ4tNT1ZnRbSxBXGAQUrPd0SKGl3zeMY4OuihAqfW38RIFQ/+prshpFWHwSDeu96h7cJ28Jd1dW6i2IPykSe8D0aGV2wmBmsQYkvcpyPtrpsnDef+zVbuPP7bMBWHJDcHeRmKjpVsoAiVMSdJkPNqCd2oCugcbAq7PZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd9c1bc-9149-4d54-a962-08dcf49fb6af
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:49:58.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scvLp7he8WQJbAnw8FqlAiLNln6laS4RADL4X6CMLVphQnBUVdS4iUfmRDleBvoS29o/38q0NdOhrWIPsSN0TtUj3WuthxtciM7xUPqVJIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250019
X-Proofpoint-GUID: SCQbA3dqg_R5toWr95TPmIH44lCBNL6t
X-Proofpoint-ORIG-GUID: SCQbA3dqg_R5toWr95TPmIH44lCBNL6t

On Thu, Oct 24, 2024 at 12:37:52PM +0100, Nick Alcock wrote:
> - is a line-breaking hyphen, almost always wrong for options.  (Its use
> prevents the option from working when pasted into some terminal
> emulators.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 116 +++++++++++++++++++++++++--------------------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 940ddfc65d1a..a53632949e72 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -57,119 +57,119 @@ Options that generate program stability reports
>  Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
>  .RE
>  .LP
> -You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
> +You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
>  .SH OPTIONS
>  .LP
> -The arguments accepted by the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, and \fB-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell. 
> +The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
>  .LP
>  The following options are supported:
>  .TP
> -\fB\fB-b\fR \fIbufsz\fR\fR
> +\fB\fB\-b\fR \fIbufsz\fR\fR
>  Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
>  .TP
> -\fB\fB-c\fR \fIcmd\fR\fR
> -Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
> +\fB\fB\-c\fR \fIcmd\fR\fR
> +Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
>  .TP
> -\fB\fB-C\fR\fR
> -Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB-D\fR, \fB-U\fR, \fB-I\fR, and \fB-H\fR options. You can select the degree of C standard conformance if you use the \fB-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB-X\fR.
> +\fB\fB\-C\fR\fR
> +Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
>  .TP
> -\fB\fB-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
> -Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB-D\fR option to each \fBcpp\fR invocation.
> +\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
> +Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
>  .TP
> -\fB\fB-e\fR\fR
> +\fB\fB\-e\fR\fR
>  Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
>  .TP
> -\fB\fB-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
> -Specify function name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-f\fR option on the command line at a time.
> +\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
> +Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
>  .TP
> -\fB\fB-F\fR\fR
> +\fB\fB\-F\fR\fR
>  Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
>  .TP
> -\fB\fB-G\fR\fR
> -Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
> +\fB\fB\-G\fR\fR
> +Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
>  .TP
> -\fB\fB-H\fR\fR
> -Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
> +\fB\fB\-H\fR\fR
> +Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
>  .TP
> -\fB\fB-h\fR\fR
> -Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB-G\fR option. If the \fB-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
> +\fB\fB\-h\fR\fR
> +Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
>  .TP
> -\fB\fB-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
> -Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB-l\fR. The \fB-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-i\fR option at a time.
> +\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
> +Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
>  .TP
> -\fB\fB-I\fR \fIpath\fR\fR
> -Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
> +\fB\fB\-I\fR \fIpath\fR\fR
> +Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
>  .TP
> -\fB\fB-L\fR \fIpath\fR\fR
> +\fB\fB\-L\fR \fIpath\fR\fR
>  Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
>  .TP
> -\fB\fB-l\fR\fR
> -List probes instead of enabling them. If the \fB-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, \fB-i\fR, and \fB-s\fR options. If none of these options are specified, this option lists all probes.
> +\fB\fB\-l\fR\fR
> +List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
>  .TP
> -\fB\fB-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
> -Specify module name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB-m\fR argument can be suffixed with an optional D probe clause. More than one \fB-m\fR option can be specified on the command line at a time.
> +\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
> +Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
>  .TP
> -\fB\fB-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
> -Specify probe name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB-n\fR argument can be suffixed with an optional D probe clause. More than one \fB-n\fR option can be specified on the command line at a time.
> +\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
> +Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
>  .TP
> -\fB\fB-o\fR \fIoutput\fR\fR
> -Specify the \fIoutput\fR file for the \fB-G\fR, \fB-h\fR, and \fB-l\fR options, or for the traced data itself. If the \fB-G\fR option is present and the \fB-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
> +\fB\fB\-o\fR \fIoutput\fR\fR
> +Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
>  .TP
> -\fB\fB-p\fR \fIpid\fR\fR
> -Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
> +\fB\fB\-p\fR \fIpid\fR\fR
> +Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
>  .TP
> -\fB\fB-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
> -Specify provider name to trace or list (\fB-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-P\fR option on the command line at a time.
> +\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
> +Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
>  .TP
> -\fB\fB-q\fR\fR
> +\fB\fB\-q\fR\fR
>  Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
>  .TP
> -\fB\fB-s\fR\fR
> -Compile the specified D program source file. If the \fB-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB-e\fR, \fB-l\fR, or \fB-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
> +\fB\fB\-s\fR\fR
> +Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
>  .TP
> -\fB\fB-S\fR\fR
> +\fB\fB\-S\fR\fR
>  Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
>  .TP
> -\fB\fB-U\fR \fIname\fR\fR
> +\fB\fB\-U\fR \fIname\fR\fR
>  Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
>  .TP
> -\fB\fB-v\fR\fR
> -Set verbose mode. If the \fB-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
> +\fB\fB\-v\fR\fR
> +Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
>  .TP
> -\fB\fB-V\fR\fR
> -Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
> +\fB\fB\-V\fR\fR
> +Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
>  .TP
> -\fB\fB-w\fR\fR
> -Permit destructive actions in D programs specified using the \fB-s\fR, \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options. If the \fB-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
> +\fB\fB\-w\fR\fR
> +Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
>  .TP
> -\fB\fB-x\fR \fIarg\fR [\fI=val\fR]\fR
> +\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
>  Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
>  .TP
> -\fB\fB-Z\fR\fR
> -Permit probe descriptions that match zero probes. If the \fB-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB-s\fR option) or on the command line (\fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options) contain descriptions that do not match any known probes.
> -
> +\fB\fB\-Z\fR\fR
> +Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
> +.
>  .SH OPERANDS
>  .LP
> -You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
> -
> +You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
> +.
>  .SH EXIT STATUS
>  .LP
>  The following exit values are returned:
>  .TP
>  .B 0
>  Successful completion. 
> -
> +.IP
>  For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
>  .TP
>  .B 1
>  An error occurred.
> -
> +.IP
>  For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
>  .TP
>  .B 2
>  Invalid command line options or arguments were specified.
>  .\" .RE
> -
> +.
>  .SH "ENVIRONMENT VARIABLES"
>  .LP
>  The following environment variables are consulted:
> @@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
>  .IP DTRACE_OPT_*
>  Set a given DTrace option.
>  
> -Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
> +Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
>  
>  .SH SEE ALSO
>  .BR cpp (1),
> @@ -190,4 +190,4 @@ Options set this way are overridden both by options specified via \fB-x\fR on th
>  
>  .SH USAGE
>  .LP
> -When using the \fB-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if , for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
> +When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
> -- 
> 2.46.0.278.g36e3a12567
> 
