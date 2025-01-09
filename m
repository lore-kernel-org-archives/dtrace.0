Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD9165F09
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446537; cv=fail; b=QeSxnJED9zwPK3m6E0dXQPk/BT0wHJoxDta0C7u62KbEoWJcUiGHrpOZxr/+XrgGNbrcBCVXCGjnvecxZk3rtwPiEwu1JEao/sGMBL6o89RAFl5TZOzJjWvi+1bCMvQDbmdldEh8CxljjOBJzT+PjsNOOM/vkJkvZonXsAloBqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446537; c=relaxed/simple;
	bh=xe43LVuMYxfmX3cuHhaHWfW09Nv8PjT7ltGKDplETgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g8k2G+C9TVSXc8uERgP4jAMbOq4s99zY4UH9sZo2WYHnXchPjbam+V7R0wjvbz1WlgWpxbz0EIEqtfyjJsS4X00XTbUFJ2uWmYrth3uQUpNgqDx9s4VgcMLAQfUnmtZE1CuG4dC5z98V+Gz5sx0iWhIutp9AHDPVULzXeHU35eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XGNYawky; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IPDd/O6k reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XGNYawky";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IPDd/O6k"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXliu019589
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 18:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=3EtisVxc93MDej5OiKUEGY/cxaJd3DS4CfPnKVC7kEY=; b=
	XGNYawkyWzd4TJjzVptoC3sYTj2YEKVoL4dYPzRT07sXQzrvFDxCvdI5r7cC9Ma6
	+bfkRlrvFhQauudBFDOxC0vgL2tcdrrwroNxoxWG7TW1Sbs1W7iu7b5PLz8BGaEQ
	lkH68tt40MhEepfscrfRtuFsgcF4R5MrQzz7iMp+v5VEK79h7y8t7dG2Mkjz67zt
	Y2y5aIMeWQFq4f5NID5E+E8fhkcx3wieDJ2/emhmu8zVSgkLwgc5mh21OLyGBGnL
	F6CKSeoXSKwfnL7RmIGIEcRKm1dr+Hp+WOol+rpnSC2lMxS4VQBGzmPFTXh6hGYs
	hps2CuGl7cvm+tThnVawaw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1c1ctb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 18:15:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509Ha9pp004808
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 18:15:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebedt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 18:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA6CfnTHMCjSvyqve3GMozNnjSwlzE1PuJV4w5h7RsBINRBVap03EDsNQLnErij/0webxht4vmDNN0UUGoBubnmvgi6xSiA+9P0CYM9fNvv1n1N/y9QuybxG/k7tJFsPalEYuBb4b3wcaWDb3/WgGNJiTYH/ekNXDNzbSmCt2Dgu/pZd9omqsUEOvDZukPRFdVIpuQ7t5fXD3RiRbPz+uTXecMBnbui4AFtbPjYyqz4PzuAkv9coVbgzm0K3zZU+x4IWqrO5rFbtTN5toluJdZBnX/h7XLHTbHRFPG1ObHyLDzhPi7O5z1TVv7eXqL2QoCAv8sB1j7kLV7KtvcNsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cTEm4IkB1vk73B6OUReK/1CZwMxLHlFWn31Eb2T4ng=;
 b=F2J+ayOYiupvGrhjgQkRC5gxWEhKVoveYNIOdOqTeGN+8KOM2e9puI2jOzwv+KjmzEB/GlMadukVX4Mau+Ut1/QOJsGxJKMO+jdpDoQkzcfkUOA9BrrgTBHv/K3fVDS+lMEPK2rTE4j4mMYlaKBbrEn/J60xjQHEaFY34gS6zGnh9yOSAFLAnvx+mdhGfpmuRzF6HhlHzDgex2yWWlp0EF+4qIlRAYYRPiSGk7lDhbxQU2SUQHczuQ+D6ROIpzqEqvQYNju4qOmEzsOGENES8U/poVJbrpo/eAnKvmJLBwbXqRTjPqBI2zwj3eA34vtWSJTMxb6W34+/CedDa+Tlwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cTEm4IkB1vk73B6OUReK/1CZwMxLHlFWn31Eb2T4ng=;
 b=IPDd/O6kQpXyWVaCrvgWrnpmk3K4Cq3li56Uf45ICb3bOOzs5dsHDscDVjFUWqBOcRSY8Ld3mM7Z9QQ6SQWzkEnewUMVvnIfhXGNsLAacHCyo0hLADvIO/tuYjh+GPS7JFDrPxoQrV3ba1PgKdeEyTPvkoFcMPeXDmvASP/uLPc=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by LV3PR10MB7820.namprd10.prod.outlook.com (2603:10b6:408:1b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 18:15:29 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 18:15:29 +0000
Date: Thu, 9 Jan 2025 13:15:27 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace mailing lists <dtrace@lists.linux.dev>,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] io: adjust io provider for NFS tracepoint variants
Message-ID: <Z4ASPwJPQUeQwAad@oracle.com>
References: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
 <474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|LV3PR10MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: cea08b55-a43e-490f-67a2-08dd30d9996d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?W0G1KOszaPHZAKRbAWadE8UK3Io/mQxbSCJDl/R/r15fQpyESK/fijsJmr?=
 =?iso-8859-1?Q?pinmVRkEhUmf5buACzncNdz8YGr7VepRXSJe+bedlnfi66eau1ydpqVjRV?=
 =?iso-8859-1?Q?JXkAy7iNSnelpnCLX0eSFRhKJJy+cTlptaHZkt0dAQvn6kkNO9t2V/PiP5?=
 =?iso-8859-1?Q?hBA992qKL0AjquqDqWn4NVVGNTf+mQDINNJtob27BEqdpmJwUtUaYeC7zl?=
 =?iso-8859-1?Q?hPqqnJSET4MufPZIYnFgAd0DDsmk4dUb486t9VFny1kbfGCkA9Ud8zF8WN?=
 =?iso-8859-1?Q?bGmXWRK95b9YAH/SKkex2njPnSQ6bVuKnjeq6WjrnC7nc83ArYVpys/dIL?=
 =?iso-8859-1?Q?Ltg4t7xNDk5LuKQMU8XrNxK0hMX2XGzcNYXcYqBWTLziildBLixwtDrOTL?=
 =?iso-8859-1?Q?9KWmsiJmnynfe+SmzYpLtvJLMXq47OMLkolOllCvsKc5WsT4Ad2y+z+dee?=
 =?iso-8859-1?Q?95zt83qjC7dAhGdxgnYACvhXHE7Xpil56lWnEtbhZUn8FFaOwwtEzxdLkT?=
 =?iso-8859-1?Q?kEycKkfkntMzyMbQhsHUshnqq1Hg8MUh5su+7mfS1eSqssXZLlxW58JTrX?=
 =?iso-8859-1?Q?5+QkAecKpmkO+lRDVDPvKhqUy2/U7EeKzRtm6/VMDkeFnhtTzDXkRTBLnf?=
 =?iso-8859-1?Q?FU56ywWswD1HZKh1vAV8z9gp9puWhNChRiu7aLiLnwhRIejo+P6u8MtYYD?=
 =?iso-8859-1?Q?xBoLBBskbSxXdYWtHyGfHgXLGYpPNt2u2Z3CQQWbc74Kk34fbiMm+ZUM6H?=
 =?iso-8859-1?Q?d5gYaocnS7U97KN0kkonoQwPcboDieg7n5U2HOXPhaf2jR5xoMNhAY4RPa?=
 =?iso-8859-1?Q?FkFvxG3ACWu+Q4oTMHSMKbsa5E8gitiLAtkA/7byev/qv4xwpq95kMaDvY?=
 =?iso-8859-1?Q?0aGR7LjTXBE5PY54n0CVNPk7dMJWk1f98F0SGuwDy4HiK0oFdz3uXAPTk4?=
 =?iso-8859-1?Q?IRpSL73h0slqW303ihMAnJETq4WIiVXsFUnPq4fkjGxhIEYU6Gmr/zQvAa?=
 =?iso-8859-1?Q?lJCRUxL4QVpALdPXnNoGg7URcrbK9kydEqazmnNkHFpHKpxORkq1bX0Il/?=
 =?iso-8859-1?Q?1HiP8RPAvrBfxH0ZB3IDWsAyBBzd0h3oAHUl+7mTxzgyNtsFBtO5iLdTel?=
 =?iso-8859-1?Q?rnM2Vc0Hr/UZQsu0DiYeIjmDfmu7SVy017ZW+q3CwNiMoOTmBG0JHCp+Zk?=
 =?iso-8859-1?Q?qmf9mZvOSQQUn83VSKsA7iwz9ZHDo+f0q92mXRNLzZbbBEqxf+xUjXnqdE?=
 =?iso-8859-1?Q?8birZr/Pjd+cMQoFgk8eYXPCshOlWixpO4Yb9Epy677Q9zL1lF9giX2ZmU?=
 =?iso-8859-1?Q?eMmYFbSB9o0B45Qh5Cs3F1UHjNTwZyztVX+bA39iqotM8X0/oSMPkbjfBR?=
 =?iso-8859-1?Q?FvdnesJrrKRY60YBbRok1yS9W29iBKwjk9+Ap7mzEBDL1CFScpx8orAMKC?=
 =?iso-8859-1?Q?gbVlOd8gPgHPeO5E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?R1njfwzL3BTb+doLCY01banWywPHa9zU1am81LGcxH9z6eL6nvltjXEZK0?=
 =?iso-8859-1?Q?/qC5l8IWu3LfmIgEBYnTNgnrsBqtJowZlVn8jpq2dKFzzdoLGP+K/d656V?=
 =?iso-8859-1?Q?swaGBVbF+WhvRJc4OSLdNXtqDIGUsVbI9i+sPH9RiceDf4e7+E63Mg/Inr?=
 =?iso-8859-1?Q?eMq0zxoVt096ZXWbsDhsA+Ckelq+W+eZpaGwxp1zZC7hge8cRk72zQ/Tgp?=
 =?iso-8859-1?Q?z9dBUBzj3xprmNZKMaoHm2s5sehifx7g8Z4OqOcpzvsV8UPaqwX+bkzkoa?=
 =?iso-8859-1?Q?uK4ixJwcc722vVkTFJZ/IZo7mFa5wIagzhphPRhDPLUWWAQ6sZkIcDs+YX?=
 =?iso-8859-1?Q?EWY5aUDOMj4c1rB+Ki32Y9vBnqVeBVijwJ0LD9tv3CUeEguhv/kS7E3lMp?=
 =?iso-8859-1?Q?cVi+o0+yhXrFny3KbMDmzmZkyiJViJd7blatyOKr0VmymUl9FvO8jhZ6G5?=
 =?iso-8859-1?Q?QXOQh827RASPO+Bv0U/qjX1Yv3ERch5pn5aKq1qe5oNaCE8Hw7gvlZc29H?=
 =?iso-8859-1?Q?O1DoTBvnVNuF+E30NUwxWHo4wcX1+gEHIo4wXruT6c2zLPuHrj0O1YI1fx?=
 =?iso-8859-1?Q?xsy2m9+v1UYNDsroDpW/UnmzCT8fLcplw5u5wc5zOF41+0yR1BVVIeCZRe?=
 =?iso-8859-1?Q?kGWL75ewhqrMtGkObghB/G53H/HkVTvpUzPV6G5K35CmcRmMizxXtEmCH9?=
 =?iso-8859-1?Q?28UFt9IcKpQWpiuk618RmoPLnD2dmPHLMcu5YptjBGkNCBQhPOeAb0IVlX?=
 =?iso-8859-1?Q?43oyIAz+ZO9S42Kuk0DkL5P0R0xH8FpCxt+yYHh4HLkYVX3xNIrKMX2YV7?=
 =?iso-8859-1?Q?XqsJHmRW0WcCy3Wj1ki/slR8SOBmiMuO4xp1eEYKFFBsYwjfAN0505Ozi7?=
 =?iso-8859-1?Q?Vljhl2IR0SoHhCK5ZKrJ/zQ9F+PmODTRrTOAQ13ct4M1rO9RNbFPlTjkEI?=
 =?iso-8859-1?Q?hc5u2jwy2/4xC92hrBGx7zHBlOGXzs7upbq0v/akMt0YYSJFIGoE2Dizrq?=
 =?iso-8859-1?Q?pA4JOfk2JFywweaVwrkag6n47VRiRpcFIFeOcnvhiC+EY5E2/PzzxAoAAR?=
 =?iso-8859-1?Q?QiuF6qyc4EK81yntzMxisZqBMZV6nIEdZy9OEieeJonERMHRCvXEzNBrPx?=
 =?iso-8859-1?Q?LTyxoTX/BCsC3LLwd6iVPrd1pLbNDnZ7iPcWTqCPIhk9cY0jmk9p0poi8p?=
 =?iso-8859-1?Q?NjXnCxz2oIcnvmP+++tEaROLm4b3huHdtII3YSl7Yk6RGnhv00Hv/Xa46T?=
 =?iso-8859-1?Q?wi+VLkkZ46qoabPwkwP9pC/tkLJ5cpL0/0bxbHDz7bvB0yMRqc3R0ShI83?=
 =?iso-8859-1?Q?XPMLnIxet9bj3ShI6vlIog+tkUdhaPoLzQk6ATT34ccIQhNjBWIMnv+/7V?=
 =?iso-8859-1?Q?o+MeMNL53qwOSJ3Oz7aLkB+hlx9xLIPLLDZAwN7YkhxF+RDCMNLokvRtws?=
 =?iso-8859-1?Q?3n0OIz4dTG0CUw8uhLz+wg+1b6iEi7eA76jVAVedZksph+nxjUrUkGcUxr?=
 =?iso-8859-1?Q?i43WU91tIDtKTDrMNAXJXCxWvVOp3rosBYMP1K1QFSTiIGudtaCgOY2tZt?=
 =?iso-8859-1?Q?DiyLnghBZzQF7pDfPODRVR0tHVi8pZg+G/KxLPEWKYg4mO5Qjh9jWbEYoK?=
 =?iso-8859-1?Q?Yc2L7k5UCE8b/lPAVA9oui1NvTXe9pmPX08KhbnM4aiBTxzFe8sElBwQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fGz0geW1OBFo9IdYIrdsqDefxfsP85+E/e3aAMgz8q1uektzSdrOnSxGVaceByzOOzQV/tnj/9nSSvkMOGl9KSwaZ7WgFD0msultoavtYWKcZlgKQUtHIBfusg/FuxpBarH2fwlH3lQu+lOHLD8hjlmVORmYFDkKlDmRvkEhPo1aSbt3BDhJuoJtmoQA64oDpFszGWJewzVGNvcVDZ7aBgrw3RDXC/+BvTPz3NK2C/Sm9mEysu4hanVz2zLR7sIXMTph2i++IKRJqYgllX69QsZCa7qLn2e1mfeN179fs8nmJkjbmniPT2Gypl3dWSCiXtVKbQuTPFYRwfe07BMGgGRuuGk85jayiJh6wSxDwjjqHc1sgNKp4RT91Eu0RSLMFGOCyi+MppTaSbJaog+CL3MZYHBpMgQmYX4M66NlwrPsOo8CUqp/4LNcae0JW/5bt9AgJPCgi9l/oCnXt4E8vmCFifi2AC4zLWlodMDcxqaBovxvU8nrpIwMwS79+aCbaOZRCCGeXNItXOVG0HUI0X2qwAFrFni2B63bQnoXrrwkHxItU5H5rpUm3YLRqlhPG5/LGjwEXTEa1OiRWfsNFOuL1p0HAbHWcv9Hvx8b79k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea08b55-a43e-490f-67a2-08dd30d9996d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 18:15:29.7641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VzyyPYinCesdzgQj7Y9OTN8fG5/Cgn9mO0hm3htG0wixGSVuMbzCLJDhlzNIMfME/HJO8E//cKgqKWgzarKW5H5J60OL6JfQ/yteqJdG1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7820
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_08,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090144
X-Proofpoint-ORIG-GUID: J_Wj6b2Vr8DnpZjsYeDPadBOUW2RjUko
X-Proofpoint-GUID: J_Wj6b2Vr8DnpZjsYeDPadBOUW2RjUko

On Wed, Jan 08, 2025 at 01:01:28AM -0500, Eugene Loh wrote:
> You already have a R-b, it seems the code is right (woo hoo! cool), and
> we're trying to get a release out the door.  But here are my "late to the
> party" comments.  Feel free to ignore.
> 
> The names v1 and v2 strike me as funny;  they just make up new numbers.  Not
> a big deal, but ideally the names might more closely reflect the actual
> version changes we're tracking.

The point of using v1 and v2 is really to reflect that there are two variants
of the tracepoints.  I deliberately did not associate them (through their name)
with specific kernel versions because that fails very quickly when people start
doing things like backports.  With the current naming, the implementation is
reflecting the 1st variant of the tracepoints vs the 2nd variant.  The logic
to use one vs the other is handled where that choice needs to be made.

This naming also allows for a future choice to perhaps differentiate based on
e.g. prototype of the tracepoint rather than a kernel version (again, that
would handle backported patches much more graceafully).

> Breaking the function out into a new "v1" version is some unneeded
> copy-and-paste code bloat, I think.  The function is kind of large and the
> only difference between v1 and v2 is I guess in the two, relatively short,
> "start" sections.  So, keeping this stuff as one function -- with extra
> logic in the two "start" sections -- might be more compact and clearer than
> having two rather similar functions.

The main point of the bloat is to make it very clear what we are doing here
and why.  There certainly is opportunity for refactoring the code, but this was
not the time for it.

> On 1/7/25 17:44, Kris Van Hees wrote:
> > Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
> > to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
> > pass just the NFS hdr.
> 
> Is the same true of write?  If so, then maybe say so and point out that what
> we're really doing is changing the handling of nfs "start" while leaving nfs
> "done" alone...  that would correspond more closely to what is happening in
> the code, which talks of start and done.

Yes, and the code handles that also.  So yes, should have mentioned write also.
Mea culpa.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_prov_io.c | 127 +++++++++++++++++++++++++++++++++++------
> >   1 file changed, 108 insertions(+), 19 deletions(-)
> > 
> > diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
> > @@ -155,12 +147,109 @@ static void deref_r3(dt_irlist_t *dlp, uint_t exitlbl, int addend, int width,
> > +/*
> > + * For NFS events, we have to construct a fake struct bio, which we have to
> > + * populate from the inode (arg0) and hdr->good_bytes (arg2) arguments the
> > + * underlying probe provides.
> > + */
> > +static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
> > +			   const char *prb, const char *uprb)
> > +{
> > +	int	off;
> > +	size_t	siz;
> > +
> > +	/*
> > +	 * Determine the various sizes and offsets we want.
> > +	 *
> > +	 *     // Access these fields relative to &bio.
> > +	 *     struct bio bio = {
> > +	 *         .bi_opf = ...,
> > +	 *         .bi_iter.bi_size = ...,      // struct bvec_iter bi_iter
> > +	 *         .bi_iter.bi_sector = ...,
> > +	 *         .bi_bdev = 0,		// -or- .bi_disk = 0
> > +	 *     };
> > +	 *
> > +	 *     // Access these fields relative to hdr.
> > +	 *     struct nfs_pgio_header *hdr;
> > +	 *     ... = hdr->res.count;            // struct nfs_pgio_res  res
> > +	 */
> > +
> > +	/*
> > +	 * Declare the -io-bio variable and store its address in %r6.
> > +	 */
> > +	dt_cg_tramp_decl_var(pcb, &v_bio);
> > +	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
> > +
> > +	/* Fill in bi_opf */
> > +	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
> > +	siz = bpf_ldst_size(siz, 1);
> > +	if (strstr(uprb, "read"))
> > +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
> > +	else
> > +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_WRITE));
> > +
> > +	/*
> > +	 * bio.bi_iter.bi_size = hdr->foo.count;
> 
> If "v1" is broken out, then this hdr->foo.count no longer makes sense. 
> Plus, the comment is more or less superseded by the following two comment
> lines.
> 
> Or, mimic how the comments are handled below for inode.

Yes, clean up will be needed.

> > +	 *
> > +	 * For the 'start' probe, count is arg2
> > +	 * For the 'done' probe, count is hdr->res.count (hdr in arg1)
> > +	 */
> > +	if (strcmp(prb, "start") == 0) {
> > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
> > +	} else {
> > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
> > +		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
> > +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> > +	}
> > +
> > +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> > +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
> > +	siz = bpf_ldst_size(siz, 1);
> > +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> > +
> > +	/*
> > +	 * bio.bi_iter.bi_sector = inode;
> > +	 */
> > +	if (strcmp(prb, "start") == 0) {
> > +		/* inode is arg0 */
> > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> > +	} else {
> > +		/* use hdr->inode, hdr is arg1 */
> > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > +
> > +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
> > +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
> > +	}
> > +
> > +	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
> > +	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
> > +	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> > +
> > +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> > +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
> > +	siz = bpf_ldst_size(siz, 1);
> > +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> > +
> > +	/*
> > +	 * bio.bi_bdev = 0;
> > +	 */
> > +	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
> > +	if (off == -1)
> > +		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
> > +	siz = bpf_ldst_size(siz, 1);
> > +	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
> > +
> > +	/* Store a pointer to the fake bio in arg0. */
> > +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> > +}
