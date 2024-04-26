Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7051448DA
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714131069; cv=fail; b=SNPVzPCZCkabfbA05+ia+aM+tMdSxw/uFGNXVfQOq2Au1Iy8mvfL9cABgRyilAb1FhUlWmPf6Q340oumZd5ZZpJNgdHMPvYwMUX/BWrvYOiYQl4dvZzfIfOoK09B9ajSpJeZYyrF2yK+LuihRIDpQEdMUZdkt5TzgSirUyxqA7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714131069; c=relaxed/simple;
	bh=oF9Brl/YPvfF5tK5Gi4NSQG/+lyMAX2Xp1QP12fkuZo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=XAyKJ8gRVtUXbu/jD68y4qH5IgurRCqmgewtOAxl/yRlyP7cbR9XR7bjjF/qlAlfypC5roo2OQKiyZcs51gI1DodKTHkuzX7kUWkiVC4sJ4cJMnC0NKz8ZWheqMkhWMEqzBh2MelZWMYRB7VCzC3BWwU704tlCDeL8AsZcLnA2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gm6JkRP8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SIFkWGlQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gm6JkRP8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SIFkWGlQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8TkdO008311
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=bXr6oIbdTrLPrT1fhHVeIRwMSfa8CsqLS0amBjOIybQ=;
 b=Gm6JkRP8eBJ5QBFRUHYygG86JatSb8i/5cXedEsXQwPyuTFiNAdQztvkjF20jKVFsOwD
 Ds1ooRU02gARAJTS7nTUbhlhGWXZtKHUxrGwIsCIhk+/hjFb8dDIUjSyb4Kt46+SCMfb
 j4oH/CtU1o4ipoVYi5iv050UAB/6Rq2SfwYBQpKPXLKhPPynO8UWcqkrD4R6vR8ZTcXt
 MSVhqx9uOhOwsjDZkrGG4jSPK1u4xY2Gng+wJXliKbUx3ZS70c5R4/Fy8LXjevSTb5Yl
 zo93/V27AALC+7cbnXEsUJrJG7qewDFHofbpoSXWUpunAQxeOFcQ9PTGQRennZeLjITd Cg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5kbwnfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:31:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43QA0OUB001731
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:31:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45ca3wk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni9uQc9kIdWElAkVuWXw+nUhe0wX7Z6YCH/6SkjueB7W2QywrYDPYFKvtuW/HgsJLNbV0DiwrIMbelrelTv/SVz2tJ5X3/1+mU66J62W8/MUHBsRvC3S14NkX/vXayrdgMT6GFPrrTYXcPE2De3d+zWAiT2INbYh9Olbd05FsQeqg6Juc4m1qc0aV6NwCfmHnbYzcHX/4Ot6pn1s8nxrSc6G3l3L99DVDTAampKOUaRVsOoomY/Ge7B2myOTRvFLCBci+ybmqwTEWbb72G0FTqHQuoEUm1K4z6jmkGPLyjYkzkiXrXIszsnsWLrpWrcFO25duiauzZj93ipeNvGH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXr6oIbdTrLPrT1fhHVeIRwMSfa8CsqLS0amBjOIybQ=;
 b=a0fkoJgA3bHZYQ0Nlmt+KxIwYaw45p+1C4vdRFVkJmYOcCPIYSdMPsuM7iL6mNzFnvHwqjGJ/v9zVrKxKy87Aiwr84vvqYJ6/XBRcjcaqoM5tAqoPB47fbRG0zpYemS/LkZXWPvkTMyUClNWiLxSgeKi+Y6E+o81sdSx+LElBssqLYOBxf3bPQ/gxzbnQ9Q5NnMm21mBpGvzyq1k3Qgj0NHnEJOqaSG8ROL3O8FI1jw2qgnOb+FRkMxMzb9DIfhSBSFWw2TWGdxA5UV4Cs/oCZY6TdGEZ/9QDYpDwGU6YY1xF1gObwrDrsSVjeNGdzqs8zB3zt+hN9iHlit4gRK00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXr6oIbdTrLPrT1fhHVeIRwMSfa8CsqLS0amBjOIybQ=;
 b=SIFkWGlQJOcvqwEbln7v8yX/aOMhKfRWoKd1ApWHPdUYwrTRbRQqf4GaEYxmCnkQLhr7PkoGRkXRy2ayY1StDPHlmV3jM2KUuxPQJqC1iUmqkqd576sRrXL+xfGzM9WEfuDS4zQRY0z19Idb8VMANP/4PP6zMCW0tB/nnc2yDVc=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by LV3PR10MB7748.namprd10.prod.outlook.com (2603:10b6:408:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 11:30:57 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751%7]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 11:30:55 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] libcommon: disable _FORTIFY_SOURCE
References: <20240425164057.420580-1-nick.alcock@oracle.com>
	<673c27a1-c879-0c38-643f-bd117c476009@oracle.com>
Emacs: freely redistributable; void where prohibited by law.
Date: Fri, 26 Apr 2024 12:30:51 +0100
In-Reply-To: <673c27a1-c879-0c38-643f-bd117c476009@oracle.com> (Eugene Loh's
	message of "Thu, 25 Apr 2024 12:55:51 -0400")
Message-ID: <875xw4mkd0.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::6) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|LV3PR10MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: f367dc1d-7697-48b3-109e-08dc65e4561c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n7mvMsnmEWI0f4483qT+EZpgf22ktge5ocwy+vmDpoxMNVCOaaSF3uS/3BSo?=
 =?us-ascii?Q?fmxVHlLkKhbNLwQ3qAZoIrEchleUggw91HKuNluX/G5IYxNXQ9BHdbSlPL4M?=
 =?us-ascii?Q?+LJu3xxBxfz4/IcDF0r/4OWdgdkTCa5KKpDTKVLPk8f2z3C2E302n6yehvjB?=
 =?us-ascii?Q?3A/6NNhn6H8AisWs/KHcRFGPg6XHunOsW4Dhd2teGWdhIedT6jTwuNQ7BAuH?=
 =?us-ascii?Q?C3rJJVRmw05BnznEN0qp4xGDMESSHND8qnDkAioxaPn/Nu0kXTbuhxaHyyZU?=
 =?us-ascii?Q?fT28VBMn/xvH+gspMxxjctwFZC1AlN+1YhAZT6/FRgk+EUYkqTd8s8ztdrI4?=
 =?us-ascii?Q?11PEdkXM1X5YhSvfl1x32ydySPHSmjWYv+TBhqo4Rg3IscFqOaxl+T+1iYIQ?=
 =?us-ascii?Q?7ck2d4jejeXbuy8dGvdO9iJqHZFftQvLej9bRpg8USZa24xIHPGw32J5NEDF?=
 =?us-ascii?Q?sl0/iForFXs9eeaaXitJSpHAXtLHnTV/e4hI7dQqCNF4QaTMnKQbIELXybIK?=
 =?us-ascii?Q?NqyTYqvEJkszGtQ/G2J8hxISlGVV3YPSfDk4F1PQ311xhiKYc6iEhYrjwFJc?=
 =?us-ascii?Q?c/geVxKXtzNvmNbikQzV2P8yWRM3jAGCFB2/moIraODJ24WVjzJuGRDIV5H3?=
 =?us-ascii?Q?DS3Trd0VSdOrnP0wcDQt9HZfan/kYJnDGl9BzPYR2o+mjh+Blb9CqbXrgNIi?=
 =?us-ascii?Q?kPw8swj4wHE8cFEHlvLk+aSOITbd8Mw1OWeGPzy7t7w0zRS4DFyXe3Qur4m5?=
 =?us-ascii?Q?DREu3dNjU2Li4748OfB1TrHXkDTSTfOJQkMwM1bc4U/rqBiGoqS3eF40wa9K?=
 =?us-ascii?Q?hx/LLnpSyPyu7RjATD6yGj/i5vjRuGRg9enjEygg1jISZTHyvdDOCqO1LWWC?=
 =?us-ascii?Q?12MvxmqaO56CTpw2zf/iionaEvcT9NQGAISwdlg0R0Whm8az5t3GpU3N7kx/?=
 =?us-ascii?Q?grtkAgoFyuKlO4Ui1m1/COrK/V1I1Mz0c3N5B2pBTyP1MM4WeF491DbJn/SU?=
 =?us-ascii?Q?boZ9acGFhgXn85Mf0bV0ZCxnoSn4T7Uo+fjU88CMEgjC1jImB8N6ph3JFX1p?=
 =?us-ascii?Q?2XEiLkyqDQFEYiIDFz+aPi++HMqxJdYfWSGWFyCY0Cp4LRIppJ7RWL9FbCeH?=
 =?us-ascii?Q?5K/yO/RFQEC7rRqTyaw3r1qkAtxLTUmn5j5ABEGcvvfG3iowXlrENi/Uoopb?=
 =?us-ascii?Q?vyAQHarwlo4xviD2l05KnOV4zQvqpHsh44isNdnHG014eLxhLC2HRZu6SK2Q?=
 =?us-ascii?Q?4XzZMAx7rXK/HxnJDvbPB5zTENmxDpIMNsB7JdiLGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jT/T/MvMcbqSmrh32yQDdzJW81T2F1OfHXb+GvJkRPicMymaF1JlQgumZxcS?=
 =?us-ascii?Q?7QNmbBuZ989RzlPvDFtlOveBn/XVir5Jnf5E28wfNUVhNc3OjIMTHLzwL3ic?=
 =?us-ascii?Q?DHu5Hw2o+8fr4AQRUTdYPJClzzMJEoBKGuKQltj1Yq27UQtz/zSCEunkyfHK?=
 =?us-ascii?Q?nWZL1rcEPWcgdECTUhnEWA9RufXzcSykkNBT+Z1xw2km8sKIsWBPicMuMEJz?=
 =?us-ascii?Q?1EcH+VETC0SnAXg4HeQ1hPfmAMpSM98bXK6kygSmT9WmHf7estsSspBzGzfl?=
 =?us-ascii?Q?fFxP046zFyvs2VvLq20xhffb7/rnSI6qbm+Tmc4i2p4LMUu1Bn54Sj2+BZlt?=
 =?us-ascii?Q?osQSX8ml9WYVAhGCOgyhyzxTEAbNQ+qVgMFr3ODQDa4pWKkYtLDHZsvJrxuh?=
 =?us-ascii?Q?XocOnMD3WtvLBHo+J0GMZJa4Z0Wpvlw9AxtpZyPyjQ9AxE08o1EuL0IVb/fU?=
 =?us-ascii?Q?VIHZF1jK9XQh/zx3mKJgOSJ2p4ggrdH2NqKoVaqsmdvV3xvseq2p3MnQHLV6?=
 =?us-ascii?Q?lUSFDJhPnDkXa2dlmvSK70usb9YKF/PQBgfA5SKAMmpeDvzrrCNCXvjsGGdr?=
 =?us-ascii?Q?odBs+CYUsXgor6b6gh6gDB35oH7T6+bYhEYl9wYmnee83uCSgQi3YQMBgUkT?=
 =?us-ascii?Q?K4ir8tN6UtCMY6Fw8YTj4GALDb4XC8uvaLm2HjoTTLPkYyspjQ3OLZAM9CV1?=
 =?us-ascii?Q?v+KxYrAYfAmzCrpmAEKX3HfuumvjZez5mVjx81jde006lHnNcspqVJSt0Xw/?=
 =?us-ascii?Q?NfT5tiw5a9/jQROwK/5qWJXOH7HYJbwPM0quny2Buae314yUDxAVqBY0cV3E?=
 =?us-ascii?Q?dyQogIQxrU5DWH7CSsqgppVEMmu/6x47mQX5gFrBMBx6YjxPuqnXkFjduYTX?=
 =?us-ascii?Q?TcrEqueUmOx7EoNwujyPOemSUq48PRJGgSoK2oqTJ2gk2BzveuMdqi8bKkHE?=
 =?us-ascii?Q?Se9okpBS8lp017vMxP1unbOl4cyPOJ3uKlcE//EZoQWcRiViOzhwyfpEN2k8?=
 =?us-ascii?Q?uFsLuRysA+ATRbtyoJyiuKDW75N4O+NHZFhUeqIloGkKMVBEO7lWGZ7lGSuq?=
 =?us-ascii?Q?G3ytToFHbvCp019l/CA2Uf/saBqdPN2u3gctGEq8FLIvCSKuh3sFfOEgWbDk?=
 =?us-ascii?Q?Ew7epy8YpOPUpV3qmjBNjbvmICs53XoXQcnZwxYhgvu3MEZtrOT9hmk0dGM9?=
 =?us-ascii?Q?MzUFiauib234sQqGxVMsXXR9rnHbmeIgdZfn3/ikOrEJnxc3ze7dLDqrE0Du?=
 =?us-ascii?Q?cvoJERXylkzUs5QOP5QZ0uyDzcX+axLs3mdQHP4gXaInFstiYKlrXiFU09dY?=
 =?us-ascii?Q?H+JJHMJNNFiW4CYcuUMaU54ckvUyJDMzj4C4a3dS+w6C6FNwnqm7Sg8wOzCK?=
 =?us-ascii?Q?x7fY25ycmekjGgXmgowZ/cG9FyrGDbz//rbk/ISTUpbc1nDqGUPZC8OFKFbO?=
 =?us-ascii?Q?C5KhyMMyhHiRFKUob9m7vNMizkRSqGN7+jJzaP0qg+/ZMmIwyXJ9tSH3vydg?=
 =?us-ascii?Q?1AcWLEGFisEdjXvxRXxMSuzXbsdj5VvC5P0fVy/hh4KR5B/IV6yqyB07BSSG?=
 =?us-ascii?Q?pjggi3hIjEVQ99i1vVEuBWGB26sAPWgyYRwBkoHZOMkJSiPo8jO01bue+lNJ?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4EqWV0XxFnCbdMCKNVKJ6ViCLeUFK+NSP6to/x43PSRZYEQTfxQcKHQ1GS5XnLx4bA0TAvjq/cErmj80q4cVuH2hKLW11U2Lb5mssLyfDl8vcp8A0qq+Dl52kp+aOyo7iIGGD2/z8aRsMfcGKPdWhbYzowp7qEUT0Rqv9Umw19Z/oVsV9KxPAlFzwFiOcsmq1/3FfSj876eEKe8Zv9Ihcr27ZeSlTvfb3NhAoBt1TkuQequsunqu+j2rAUFYXOgp6mbMjThTZuD1LRRtmOqstpVHaKWdiJ89xwKEQOZfK/LIyZr+ZfBnyMhvs5wziuG9QZSTV5k2uWpOpohqDObAi8FyfgA72EhrnGhzxUqqhRy2wR1a8VwWlcST4I7hUqSX4GAyI2nhGorzV41mezWFP/BICLilweapjtflwLJPYBsUSwG2QfcQ6shDPvv222KHq5xTkWhFxVWEJWA20vNSLNflN2kBuH6r/ihiYnc0u8eim4rwsNyoK9me0htXnE9EYxzS5X/gGz/N5Cbk5ZAiMDvWK8a2cQzjSbp1pf9CGyzxaqyd7DamNTUUcNrf+RyWoPEjij6VhHZlO61PLrJ5hoE5uHtDVnu4mhpDZknwEs0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f367dc1d-7697-48b3-109e-08dc65e4561c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:30:55.3828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH1OVnzObAhjA3MkAzDDuazjiqbmGJHGHugFv7cs47jm5tx8LddAzZUW3M8g6f+R3jAoTGO9i2E9uELbepOCnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260076
X-Proofpoint-GUID: v6ZLUtjQkah8Ghz9VmNsU40QK4pEjObU
X-Proofpoint-ORIG-GUID: v6ZLUtjQkah8Ghz9VmNsU40QK4pEjObU

On 25 Apr 2024, Eugene Loh uttered the following:

> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> but "This" (the opening word in the commit message) is a little ambiguous.

How? There's only one possible referent, _FORTIFY_SOURCE. (The subject
line is part of the commit log too!)

> On 4/25/24 12:40, Nick Alcock wrote:
>> This is incompatible with the dynamic-length-string trick we pull in
>> the DOF parser (which is in any case seccomp-jailed).
>>
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> ---
>>   libcommon/Build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libcommon/Build b/libcommon/Build
>> index 50aa4ed88f8c3..fd54dc044f9af 100644
>> --- a/libcommon/Build
>> +++ b/libcommon/Build
>> @@ -8,6 +8,6 @@ LIBS += libcommon
>>     libcommon_TARGET = libcommon
>>   libcommon_DIR := $(current-dir)
>> -libcommon_CPPFLAGS := -Ilibcommon -Ilibproc
>> +libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
>>   libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
>>   libcommon_LIBSOURCES = libcommon
>>
>> base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
>> prerequisite-patch-id: 27ade1c234620c8ed86991c2311a7887e935e1c0

-- 
NULL && (void)
