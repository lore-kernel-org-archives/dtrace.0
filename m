Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A222154B
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124831; cv=fail; b=Tbv72vGISyRfQYtpDASPM8S2YpKFVxsJ72JQLPzwv54qUwC8ygpv1l7N2SzkFD2tKcw7EVM6PU2xsgBR1PMCC8KzsB1CxE3EHLyDrt249ReZktC3zGCNs1qDqNecMGu6EiZ2HqeDGjENYmxAa9YTYzHlvnyfQzMo02D2FazjFhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124831; c=relaxed/simple;
	bh=ILUsZXfJ9BCfFnQJLGArHTVHBHMSQKCFAiMu8rtwY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VIKPW7QzzxfuYiHzkVuZNHh2ytsBZJwCRBmH7cIH8MxMXYUfOc49EdyLNllaxz1trNBpzLHf4enBDvF15z9BrTxT2EjM5AddGEEnnhjPVJiWPjuROnV0N8RwpNqLIrHx1Pm+x8vS6ZI/gXq4eFaFGbzvoDeJ01BW4VU8AP+/9vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LpSynsKW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NgWueRXA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LpSynsKW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NgWueRXA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3Edu22694751
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2aZGmDUNG++sXduN7p
	eCvph3C6E6qhq84ck5t93+QIc=; b=LpSynsKWj94bN3opLM2bmY3cZxTXoJ8FIz
	F+2XtWaGB+2B265owkO7mYoruSRakHowgmGjgkRms5LaEbTbmGrgAHliag2gV7Xd
	ps2pngnE+dc7ARZqPOUQxos1qJeXpHc+G4sFjCabeA/eSWTwaopxoTRJxSpH49+5
	cHnRan0i6knuvaiuiggiPu4PJL8zfUZh5UyFnjhw42mt6lTYbkEDc9LQOF3iP8OA
	VK07y8wQRs6x/JIFQczKY0wtRQ8jV7/EZDstVLB6rEGYtDQTU4L7Zm0hAD2TgvwF
	vBXHEtUSrgHY4Udqq9ids+zjxunr8PgPFopJDhni9ow9TG68rXAQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r290j0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:13:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ4AWZN013940
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:13:47 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qthg6xs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:13:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhfYL6AAAtqzNWm85UltBIFMyRJAUHqVg/LK6fjLoQLbj1H1CSECBpPQdf97stefdUf+KxBbN05ssvumhOvQYyqiHU2iCAYHZY3r2u5lmd0jQ+p0mE1sJ8JoQ591u1wGYyH53ElGfyLmFJw4Z7PHlRTG+tHZL59IhFJU3TdKvswhNetLBcYSz2Kk/+23F/HdQBlpapjMuo4/wZ2OF6Xtgy/G6ZcO8qMvq/GAxI4+ZPw+RmcdMQo31pXFZfuVmXNJXL293SHCJEkkcOX+GPcOoiifp+xwwUGyXFoeypw+vtlj7Q0KnCz/RpvuDPhkjtNM4spT2WYpawLx2sNffAOf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aZGmDUNG++sXduN7peCvph3C6E6qhq84ck5t93+QIc=;
 b=i0o9G0rNZwsNxgRicryH60A2UCvFMDJjUnQfLScp0ZOBA+M1m8WYxdFC2N/i43+62xJkhPlWRanvGhObLSi8vLVLuoOoL/F0lUUsXyhPsR+QkDQRiawkNsXzv0jNn+w3RueUhUX5+x6XFz7jzwPyIo2dkRcTdlqpB/dwBV9GcYuiqqv7Kth8aCXtXaaN4krOyX7+zOkq7koBAnZyJUHx2xd4UfSwFVCyHJWuinbZK1KPDYARBYUrAa4RDKV2UVo4mxcrmC8WLPFPvPzn3Y+8hSbc1mjMJzAI6Dbo69jLmo1znrD9v/EsV9/6jGlxkokNKYMl969D4WQI9SPVRPnrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aZGmDUNG++sXduN7peCvph3C6E6qhq84ck5t93+QIc=;
 b=NgWueRXAABV+qEXcvuqySkboaZd2+Gqi9PeW9SAsz2AjnOXtXiTqmfNOxtpU/B4dCyrKK/bpg5Y3hSTiVJbJfwE4S58uhet+/+KTbB9WBWOeODFafE/AnqdnYLZzcv3iLVYD8CqDZ47gQPoGz0zGKAs4Hgtqw2OO+AeUahXazhs=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV8PR10MB7989.namprd10.prod.outlook.com (2603:10b6:408:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:13:44 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 06:13:43 +0000
Date: Fri, 19 Dec 2025 01:13:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] doc: Update the sdt provider documentation
Message-ID: <aUTtFURaYQ+SVlxH@oracle.com>
References: <20251208221401.5603-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208221401.5603-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV8PR10MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0be553-0483-49de-20ef-08de3ec5c2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qpBLNUW8Ra5nj9SW8upbKOpiAPu4YAk2sQ4yi4Ml7SEpicQPvYYqI7WPP9y5?=
 =?us-ascii?Q?vH0aVlSjrrBU6f9wEdKfafziPH8PTz2QKELJC57UrmemmiVst0cDMp7PX4yn?=
 =?us-ascii?Q?GDZxKzJzUZCUBXzOrvQIIaGfTmCuv18gSU/YLx5XwvDxTiRmqH8BkmyPkgQN?=
 =?us-ascii?Q?uJBmwpLoUHwUIYbsfbHvxXRvslsm/SJ1it8oQzcptCtyswGFsxTC5C2zS8lH?=
 =?us-ascii?Q?zdhJHyIMx9NyibdXpX66rNNTvbfWuc6nH4F99C+t1wXWdWEagl9DSst8oKkd?=
 =?us-ascii?Q?Nz6I+lN2EHaPcjPUkdEemMONUaVtSe0RpeH7XW/+nEOsdN6ubswsX2FuKXan?=
 =?us-ascii?Q?YC8hvJ1U0ufF271y45aOLs9Z7DQMPUYCgA93Hc30TGlT+H9aBsZC4BafTHzo?=
 =?us-ascii?Q?NkIq76bXTbg48QE7Z55DaSUKlMLe6DEP4KY1m0m4Yq8pcIddVdJUQQUnn4Q+?=
 =?us-ascii?Q?1we1ua4ac0UDv2V6AmN1r0ugLeEJnHbxTttD/tc0yKWL2B+B+FsWfHrr1RPC?=
 =?us-ascii?Q?Pj1tg9jsnMj6FBga+G9JGa2epSI1AN8yJqiAOIekFlR0iTmIHWlkdvDjekRB?=
 =?us-ascii?Q?1L2shJAwzagblkbTei5bKmCXkf+XWy5IDCnErltw3xRPvPGzVoQZR/9umNae?=
 =?us-ascii?Q?8ovmFtK0aZShCbZACUqSd58BlE9lX8G3Iyi5OxF13Y/YA8aePVULmrTQZJA/?=
 =?us-ascii?Q?F6tZyBt94AZdLtmSbJCG9Pe8n+j/SBkZsZD5Q2etnchGUs3SDEItPe7aUWJP?=
 =?us-ascii?Q?c/JVGSQqx0iVMV8EOz1M4C2d1mav+Q0MKOkyd4tNlhmZ8toX7Ov9FP8LgY3e?=
 =?us-ascii?Q?EZd0eaCrh1k4DOWCJiilz2UaPWBol8/X+2WzgNjAcXiFLPFv51TeJ5RnFYXB?=
 =?us-ascii?Q?rz1rmnX5W9Gxbd//jeCvk2nKHJ1oyGxg5rMOPVTnVlx9Gcexe6nJ/EhsHerY?=
 =?us-ascii?Q?MJhUwJItYOwadS4awKk9o8dI49eIlsk72eCTbJowhey66S3hCC60sBwnz86v?=
 =?us-ascii?Q?bX1ALNJLobG+a1lC7utRhTF+qPRSJNJp+g3esDJXX01arBuNZoYBva1VWp+y?=
 =?us-ascii?Q?KJHzJHGd2Tbl6msJsK+X+G/Xcf/vvlIA/iw1JzXQQC+S6Y/EGhl+bN9MB1MU?=
 =?us-ascii?Q?NMyQFHFEvFScw63E1hTskI6nEc6J6pyQir2nDiqPAHrudetd5kQg6q3JjhxX?=
 =?us-ascii?Q?uGNyPP6ivz7vSVxNQwi5klsfonYtBWwOmWhXxkeH3wSNnyHlOKw50ns4VMOx?=
 =?us-ascii?Q?z4yAZf/mIlG+GeStx7p0FYiqYuAzzpl6lYXmpzqQ6bQTo9OMh2HHGE2a9ciQ?=
 =?us-ascii?Q?OnteUmCYP9e1fe+Z+8sD1Ig7BJsNYvXXzbU45Y29r738hJVLmexNUyYrF5jI?=
 =?us-ascii?Q?3ErRDGa+mUK9Ok4v3+qO9u1mYE8OBCcnJsPPBUAi74o5q7YFbjStY16vj6JH?=
 =?us-ascii?Q?ixM+jCg2rKg+94F1BMU9hfNNwtaPdM/dvS6EqGqwoL5kquAOWn/8rw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TwFQF0C6IV5geFeHvFTqRDgvltV97pN7sryaWmLEFgRWQvSlK+/565E9152e?=
 =?us-ascii?Q?NBa6NCwcs65xe4hBD3wxkCq+IrwND3ENILYcyuaezYYISYe86sIRMt0yMTBT?=
 =?us-ascii?Q?iiyyYfD96HRll8dhDVmKgkLiVHsGS1YvPOl3st5KAvqXWb7VzYCogNgGgm1b?=
 =?us-ascii?Q?YfemErNckNBBU7csiSXr1l+fJH5L/TwxzJ8sQY84P2RfCdO7jghbanA2MB8y?=
 =?us-ascii?Q?sIuB6yFUp2q17pYnys4TsxPJDo7Rm7ohhwYO/C2tng31gjlb8pfOSslMJJZg?=
 =?us-ascii?Q?vbHoASXTyryrYDU/50UQuhHMIFFqZESbRnM6pPDgze5xbI24sUi/qbcS+DMh?=
 =?us-ascii?Q?bYdGi03nvdk/1lbwm9Vh+aR3nvyOx/1cOifzHwlC2DurL7BfhanzGTLwiCEe?=
 =?us-ascii?Q?ANK38JryhjHC6CvLUS+hCxoay/0m0D1VDqwK8L/j3CcHb0UZgjn4TQ2K81EA?=
 =?us-ascii?Q?+rPweHPa90Ryc+QpHR4YXpsJYXVk5kRx9rVwSDDE0Wmlk1ECmBlwqVrmifEH?=
 =?us-ascii?Q?Id8ewVGTKTdRF/Sp1DS5+NCCfOGp12HtoSnddtOKDdAUqLNeHOmqX+fHYSal?=
 =?us-ascii?Q?qhYErplkdvFaR6e6CIZkXbl6pVPIBLRT17vp4yV6yd/sT/VRaYVl2aTmX7jq?=
 =?us-ascii?Q?48kj/H6xxT/Or5jzxQLDatex28wTmeoxU/AzXlmDSielQJwrzXJB2B4nT3Aw?=
 =?us-ascii?Q?L0YuYh2ihL9uhEpj85FD8lAIYInGLfA9bP4XbNgUOsxD5mzuukj1kXgm915+?=
 =?us-ascii?Q?kLT6jmgijXJs4aM9vIz7rpBLJlAFZXW61JjUA+OMTkwPPwYFeSgODtVQXZzF?=
 =?us-ascii?Q?Ls/WooDTvX6rm1TYciLA1+rYm5SxOJFQkpwZEqu42RkTQywU8L2OI0Kh2t1P?=
 =?us-ascii?Q?Kpehgqqx9ERcwdAoz0t0CXeeno//7K9al5GeGpgifhhQiYkTMyQWof6Nzfdn?=
 =?us-ascii?Q?w28kcBmzvpckw6qc6XWaqhjTr20BLYBfqdruHEMVlIgWw4zAH90lBYTW5T+R?=
 =?us-ascii?Q?iDzFbt5o2S9LiZlmXDuhlTwfGPM6D2UmCVFFnDS7LpVsM8YSeIb8zzwpOgKg?=
 =?us-ascii?Q?HwOk2I3h6SLnlI73Rp2kHKxeY+QN22LqjLm2rfCtw5ckWiPMitKHC3H6EpFK?=
 =?us-ascii?Q?F7jscqeGxTpLvdLy8KaBIvFh6DipjoWjBeB4vzZVFOLVtGfclGHsal1NoIrs?=
 =?us-ascii?Q?4c6ZRWzy+dEWwqjatV/03A190t4dg0pNS9oloOInrFRPMo6MnIc15Qh8rjwu?=
 =?us-ascii?Q?RBHnCR+H5km4yejrcXb6J3gDmr9j/P5N0WroKxR+DgjF73xxxVuq3Kcm4sXn?=
 =?us-ascii?Q?Q3J4FqI4NvRk+1h/9lK4LxVXfHYGxYH/IDSvHdp2q0R0EYfYtVsr1UG4JwwA?=
 =?us-ascii?Q?RKh+N5YJO2ylpCbDp3B0KUeRloCvBNSrqOLo20wzNnUWZmrt9saPlYPBprey?=
 =?us-ascii?Q?+j6VfWfPQNgHtEbwr6T/afk+JpNgl3aeLlLf+vtWsVhZv2OkluUMuNH9qsz8?=
 =?us-ascii?Q?l2V/kaFTqRUdmAUwd9cPTxJp0JKa2wbcCQxO8KEG0b32Ht4EjP7ykavQXEeJ?=
 =?us-ascii?Q?lq8nVGWW94GQAF/nOe4Nyt7S+zqnws/0ZBveqZYvenqGPiYbkP2HLKqrXAaT?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yu69GspjhjS5ceXaDsV+LYSkndYUFAViL+VDbyKB4B9r+9glA3KTqUSioZGj/hdq9/XSItIU5X8Gj4ah/uMsrhUHdqow4nKHuFPutbSdENPMvd/Dzl7ss6eiPuixXsNwGPWnp7cAjwc0EmJGK552AXW2UgBZC9TI2zLVH3PX5dRZp1BPHjrl3wUR/5p9ozi/hnZ79w/gZszaDdNwYnDDtsc4FEtu+1aPJihMAJ/TEd3iYXMgOh7Ig3LC4ga6dIGQn5b2RJVbAovRCsW2CMUWCfM9k9cgtcW/SILkxL53HNMSASVEPB+KGPDNbM6NCpeis96UheZyBmcEvZKtXT+NrWsM70wyDl9P4HoaaD5fv1V3/0/NHsuegaMKShXfnXwBf1Bn8pLeSqMtfsTCiXzl89N45jPLgI+ntbcM3v/4cWbx5ABkkWoQV+lIjnuoLdETw9P8fj7B9eCqsbxkwEpUFuje6AcqQHYI7M4oa3tVd5kvg3b1i7RBd4ry8O4pqoB3ao4qbGS1Du9JqtqzAuckbkHgBRFf+VmKA/TMBlfTGUjdoitagYTJIuUnyfSIH/UeAJzT79Po6+XMhe0VHjS58eGc0C1NaaxLTXwYTwL4vnQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0be553-0483-49de-20ef-08de3ec5c2fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:13:43.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiDF6j9Hb06cvprd/9CaaTPHMD0yyJvK+ZbstaewVb4fma3by0XuQtB0lixmNMiY4xjtt0Ab2hcg2IMfoMhtlhBL2id6beHIsnkRMg4zC0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512190049
X-Proofpoint-ORIG-GUID: S7QoJB7s7rQkMz54l3U2RTBrvdCKQA2z
X-Proofpoint-GUID: S7QoJB7s7rQkMz54l3U2RTBrvdCKQA2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0OSBTYWx0ZWRfX4uhupc40DLQx
 emxJ9gQoFcwgzrFN9XsDDT/xjteXAd7U2oFmIPbPW6yLCby7uy5etQyocBJcHBbmssshMPw88sj
 2gvGtfx+qCdQb/Lp59YqaneDX6UqupMCt9w0VGvFbZHvDnTopgN883acgRYt3S2yZNyxwBMhINZ
 OpHCWyhdVjmrrBhZenKKgtvpVPtdElaAJyfO3O1Kefj5ZYLrfvNBYrarx14uZYlczqneT/iQJOP
 HyhTlcaWUu1glbfrpkvtKgigxcVuHUwvJb0XzUmPrEzfshY3Xt3p4PVPuIiqVP6OjzCA/lWXW6G
 FhnKD/NN1O0kN6k2T6I/1bF7q0jMCac1jk/DBz+vkA4qKJ4JGJ4TelLweHBXsCknmHihsUeBEgk
 8oDoAHT2nXbaYMheIfmsTijIedpu86gdVBvNjmGEsCbnqHwUzadir3wKVLaW8to8t4lQEVcsipg
 Gr1eFzsMpjxXRNQa2wjQGv8sNDqgXz0lOyNlycYQ=
X-Authority-Analysis: v=2.4 cv=efkwvrEH c=1 sm=1 tr=0 ts=6944ed1c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=9AdMxfjQAAAA:20 a=yPCof4ZbAAAA:8 a=rGfEaqrcWjzacY6KiiMA:9 a=CjuIK1q_8ugA:10
 a=bA3UWDv6hWIuX7UZL3qL:22 cc=ntf awl=host:12109

On Mon, Dec 08, 2025 at 05:14:01PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The documentation had been describing the legacy provider, in which sdt
> probes were DTrace-specific instrumentation points in the kernel to
> support other providers.  In the current implementation, the sdt
> provider simply exposes Linux kernel tracepoints.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/userguide/index.md                        |  3 --
>  .../reference/dtrace_providers_rawtp.md       |  8 ++-
>  .../reference/dtrace_providers_sdt.md         | 53 ++++++++-----------
>  3 files changed, 29 insertions(+), 35 deletions(-)
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index 3e057d4de..7d6b1caec 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -255,9 +255,6 @@
>          -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
>          -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
>      -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
> -        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
> -            -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
> -            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
>          -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
>      -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
>          -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
> diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
> index 67cb0bedc..aa98f9c43 100644
> --- a/doc/userguide/reference/dtrace_providers_rawtp.md
> +++ b/doc/userguide/reference/dtrace_providers_rawtp.md
> @@ -1,7 +1,13 @@
>  
>  # Rawtp Provider <a id="dt_ref_rawtp_prov">
>  
> -The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
> +The `rawtp` provider gives DTrace users access to the tracepoints exposed by the kernel tracing system.
> +
> +In contrast with the [sdt](../reference/dtrace_providers_sdt.md) provider,
> +however, the `rawtp` provider delivers the raw arguments that the kernel
> +provides to the tracepoint.
> +For more information on kernel tracepoints, see
> +<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
>  
>  To see what raw tracepoints are available on a system, use:
>  
> diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
> index b4490401a..fc512484d 100644
> --- a/doc/userguide/reference/dtrace_providers_sdt.md
> +++ b/doc/userguide/reference/dtrace_providers_sdt.md
> @@ -1,46 +1,37 @@
>  
>  # SDT Provider <a id="dt_ref_sdt_prov">
>  
> -The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
> +The Statically Defined Tracing \(SDT\) provider \(`sdt`\) is for
> +tracing markers that have been added manually to the kernel source code.
>  
> -The SDT mechanism enables programmers to consciously choose locations of interest to users of DTrace and to convey some semantic knowledge about each location through the probe name.
> +Historically, DTrace has used SDT instrumentation of the
> +kernel source code to provide a number of other providers,
> +such as `io`, `lockstat`, `ip`, `tcp`, and `udp`.
> +With DTrace on Linux, however, DTrace is a user-space tool,
> +avoiding modifications of the kernel source code,
> +implementating those other providers on top of pre-existing probes.
>  
> -Importantly, SDT can act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `lockstat`, `proc`, and `sched`.
> +Therefore, the SDT provider now simply exposes kernel *tracepoints*,
> +introduced by various kernel developers at semantically meaningful points of execution,
> +making them available as DTrace probes.
>  
> -Both the name stability and the data stability of the probes are Private, which reflects the kernel's implementation and should not be interpreted as a commitment to preserve these interfaces.
> +Probe arguments are converted from raw arguments provided by the kernel
> +to a format specified by the tracepoint definition in the kernel source
> +code and described in
> +`/sys/kernel/debug/tracing/events/`*subsystem*/*tracepoint*/`format`.
>  
> -**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> -
> -## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
> -
> -If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
> -
> -DTrace also provides a mechanism for application developers to define user-space static probes.
> -
> -### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
> -
> -The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
> +To access the raw arguments,
> +use the [rawtp](../reference/dtrace_providers_rawtp.md) provider.
>  
> -The module name and function name of an SDT-based probe correspond to the kernel module name and function name where the probe is declared. DTrace includes the kernel module name and function name as part of the tuple used to identify the probe in the probe description, so you don't need to explicitly include this information when devising the probe name. You can still specify the module and function name when referring to the probe in a DTrace program to prevent namespace collisions. Use the `dtrace -l -m *mymodule*` command to list the probes that *mymodule* has installed and the full names that are seen by DTrace users.
> +For more information on kernel tracepoints, see
> +<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
>  
> -The name of the probe depends on the name that's provided in the `DTRACE_PROBE` macro. If the name doesn't contain two consecutive underscores \(`__`\), the name of the probe is as written in the macro. If the name contains two consecutive underscores, the probe name converts the consecutive underscores to a single dash \(`-`\). For example, if a `DTRACE_PROBE` macro specifies `transaction__start`, the SDT probe is named `transaction-start`. This substitution enables C code to provide macro names that aren't valid C identifiers without specifying a string.
> -
> -SDT can also act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `proc`, and `sched`, which don't have dedicated modules of their own. For example, `kernel/exit.c` contains calls to the `DTRACE_PROC` macro, which are defined as follows in `<linux/sdt.h>`:
> -
> -```
> -# define DTRACE_PROC(name) \
> -         DTRACE_PROBE(__proc_##name);
> -```
> -
> -Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
> -
> -### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
> -
> -The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
>  ## sdt Stability <a id="dt_ref_sdtstab_prov">
>  
> -The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
> +The `sdt` provider uses DTrace's stability mechanism to describe its stabilities.
> +These values are listed in the following table.
>  
>  | Element   | Name Stability | Data Stability | Dependency Class |
>  | :---      | :---           | :---           | :---             |
> -- 
> 2.47.3
> 
