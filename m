Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B632BAF3
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716562362; cv=fail; b=E9fXmOaP6dvQWZyS3I+Bd0mFg7UQ1MQHFnKA7dVn/BJhQ6M5QEqMHOqCdAw9Nub15sv6Gjt2R0PTEAeP7ZwON9mdKAzVDDyl/v4RLAse+S8606rjOvxpi/vYHwMCTjyCnkrChwGQm062q9YdHlE4byfjqMZWYQy0MV0y4q3ZqgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716562362; c=relaxed/simple;
	bh=aFdnq2p5i7+rOQ8ACsWVFITnY0MJzDS5U+LOyZYpSVA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QR3vrhlhsqIZxuvHAY6+2/u+z5R+4RHI7qF+e9wtAWSWw6sFYzEMQ+xfu7qSOw37QgOtsq9jxgqrftU/XzSXX+0jOdsNvqq0lxF7YoyuafmV/OvfghZ9Q8COauaNwdcyNKew6K0shneS1T/iOp4HsbnJdaz9mb0eTzN9xH7RJXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qik0qVuE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OnLkiIns; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qik0qVuE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OnLkiIns"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OCwMnE005530
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=zz/1mLbJMn19HSMuVBxgl506oiYOj+nJ0X7Y1gM53b8=;
 b=Qik0qVuE2aufzDaX0yJiCKucz/vwuJPof/9R75BVYq6AS9WH1a5Z+kymzVmQnX0S5day
 tDIc3amugGs9V4k1HgXuOJXErRQlYhEv3kgu9xraeBBmeXlnN66HXg8F7TGvjoHCzxXp
 PuHor1xeHO26bh8C2SDKMMzIrvaPAzpXe36sjmjRpFD624hc8FcgMwDRSY06GG2amKbf
 VCuKDJiI1zV5C9JI4wMqxpSTBuThb/SvDZq3HYcjMlCXtDhS5ChLc9pyf632XgC8ho+V
 L9pHjMGv/3oZ/MK8oWiRlhN07uLkEgjppxnA1rgLbIJop734ZyBJtH3qaPpoAN2VbMZQ NQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6k46cr1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 14:52:37 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44ODlJZo019499
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 14:52:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsc1qdd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 14:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIISckfMarizrz0h/9QRwpngan5MONRKHt4jjj6PEvpZFiLaWmf8orRcZCyLuHQ5TsOX+Qa37gMBBBvjCVVa6vH/BcrLyjiNH/awxFU/fYb5n66qWK4H9OA8Q2DXTd/7h9OgylxLzBqIiOcy+sEh0cUJcw/vQbvDNWTVex3W1jDCJYMIYxmFioFw3VzHdL+EdZv6gWwBFdjjDLrpTdTSBA32giwelnlEcIrYqJCfuzHKo1s3AK1QS+J1zSRr54Pb62u/Yl3TwyMggHEGeZyd+OmatmHf20xvjmAi2DgJrQWmWj9kgNJ5CjiWp8yx+o9hBv9Kfa6RLOMn4dmLRnM9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz/1mLbJMn19HSMuVBxgl506oiYOj+nJ0X7Y1gM53b8=;
 b=gwF3wtXAwtpXYSzAp7lzc5VRmXja4dj5ZiBkjdbGM1ldnD3mvhvxlZk/iVB0Q9uBHCFufUOjeECA3w+uYrQxlK3xq8aPk74p3FNAS6XFpsZMJhdK5yGASD6Vy2BNTMu5Ars9loAFjzpSLzeznDWHg0czHTFNESe6QC2Cfj/ohmoBdwDBeYmJrVZSzsN+beVb5jU1KC8uxcQ9IDL3/MeVGQydeC2loRieLy2T+ynifmUarOiyyP75iHlCeIaURu1apN2MQfx1Iec1RigM5nZLf6ylXj0FgHlHcNSUOQ4fG4g4SBFyo/rdv/S0ZXiZLvxFpW0Asli7bxj2mZhyGBCjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz/1mLbJMn19HSMuVBxgl506oiYOj+nJ0X7Y1gM53b8=;
 b=OnLkiInsx9bV/XqNPd1dlOC+VBguP48j2H7zTuOmfcey5BfMHu40sJXAAl5XZerTX7jPPA9BJyfayOOj3SzvB3p0EOsBhf+3RVCZ9PWtZBHnbOJjy8QnkjZ+4ryR18hLpKM0co3Rt0ndPNqfvmRm5dJw4WV0kjrutsh70QDufiA=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by MW5PR10MB5692.namprd10.prod.outlook.com (2603:10b6:303:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Fri, 24 May
 2024 14:52:35 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 14:52:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/2] build: install sdt*.h in
 /usr/lib64/dtrace/include/sys
References: <20240523214133.500082-1-nick.alcock@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Fri, 24 May 2024 15:52:31 +0100
In-Reply-To: <20240523214133.500082-1-nick.alcock@oracle.com> (Nick Alcock's
	message of "Thu, 23 May 2024 22:41:32 +0100")
Message-ID: <87r0drqn2o.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|MW5PR10MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 644262ea-cd17-47d8-647b-08dc7c0125b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yhfPxzptGwrdGVU+5H8vWu/0xPiZ55ResmAALcWZRp7ie6X4VYqkd0LdXzoU?=
 =?us-ascii?Q?kWjGImJC+jCTlAkd3eZ4f1fTLY4UY99daYKbbDWVuCd0XWC0wITBFHXlJBN6?=
 =?us-ascii?Q?osDydaA1uqz6EhJlPFZ0p5W10CHp05jCEpfWjpIeLf5Aft/34Itzcr324S89?=
 =?us-ascii?Q?SBldggEDL1OuXarqgIlST+3fNE2h0AVYim4OMo8KGOAKfVnpaT1izw9zktPD?=
 =?us-ascii?Q?k2GyOk7fk9ah+rkptqtccbUUZSGZeTFP3O7PYlMOCBINsv7Z1AXRqy7qWBN+?=
 =?us-ascii?Q?qmWRVNzBxjAskz26SeGdIlvzoVTp4dYsMWHhJzA+RnSrkHrbR9cPhoi18hzb?=
 =?us-ascii?Q?rRJQK5Wf6WcfkCOPDb2QIk7dIYWYbDbB6Agjb3XSLyK1k7+PelLlbvVWaMTr?=
 =?us-ascii?Q?vHKd6tB1h6sN7hZNOG45PfJB7sJyM7cn01Nr4zMJjnOPLgOTz8IT/hKoGMeT?=
 =?us-ascii?Q?Tw/Gt2D55fof6KdLeR9LVyCVyR4cJrm7GNFw9ebQiC5IOncnqM2BsGC6aVUK?=
 =?us-ascii?Q?y+Y3Gr9ojxrYPlLhdqNOye+bbEcDV5y/dozmI3VOQ6gG/1IRdDheX9UEsknS?=
 =?us-ascii?Q?ZFJ9wdm1gGDUPsTwnypRJxrLuZOzf3z/72FDNqZR3NE/xIXn969JyKdjRAJo?=
 =?us-ascii?Q?bD6e1apRfDBPKKs+EpqEpELhw8ihZXjO0ktRRBacA67qyceehAjdUxaK1NS2?=
 =?us-ascii?Q?qigqRuKRkoVhGagAxnKnFUqBnPdQSgz/ss2Ny7AWTf5yum6rL4vCFYbkLVXt?=
 =?us-ascii?Q?96B9UAbVstAyN89BgpWDBFJAlg7G/LzfcDAxMdgVlmDC6kegGDOzIuZg0tY/?=
 =?us-ascii?Q?9OF/9BXjZdV+F7bGo8C2DrHjz+zyGKK17luwhbRAcqdvFtc15bhWprqEv+AO?=
 =?us-ascii?Q?nQ8KfAmTgbCRyk8M/XIQcnS/w0qwgibnM1UVQGxwEZqGqMQXzWS7YR5W9NK7?=
 =?us-ascii?Q?trJQy9MokIG0hebpjqF3/22/rs8PiuyR38hnCMTL8Uxf65+X1iA0oDTMR7bo?=
 =?us-ascii?Q?APJ7oX3tVwngicW9RoSaforlTgQUQMFyRFlFULxccfiMe5Zr/gE49JMRigZ7?=
 =?us-ascii?Q?hrF8no6J8oEFNoklGjI4l2RK7RBTNz/xfq2cQUQtuKfqqQ6WzWg5kg2nqO0g?=
 =?us-ascii?Q?xcg5XR+wvuqMDRfBhNt7S+Q2Cs4Y7QIVfLs8bkqXAGrIHpkFgTi5p63qIlwK?=
 =?us-ascii?Q?QNnWUaK+cOBUTmvk5cIo6Fgqz73OCgAIxDxiZkHnv2knL3HqLnZkOx9WMAZe?=
 =?us-ascii?Q?FDdjOM7qhY6WvhnOsfgtILs+Ut/XcEZ+lU98nAmFAw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SyuDKK0PKpIobMOuHuufYzzy0qS+aC2e0iKnDCthOwa09lkOLCDKsB6tftep?=
 =?us-ascii?Q?Ase64bGKq2AuZGW0lozSIONs1enFGOsDjLJdmDJAt7t7OtOQUuqlv9MdP8+V?=
 =?us-ascii?Q?Stebtl4f/Kcq2oySigszeP9Z5MombCP3ywomOlqkhTBrQ6CrOZ60MGyyqG/6?=
 =?us-ascii?Q?n81OrCIbHevHKSoS43FNc/1xfP3/vwF0gAdYY1AB+oNTK5xrWhLwVABG7uWz?=
 =?us-ascii?Q?TzEWLe5ilPMpnvyVKi2QcdDkBIW96namXDzfFs1vq1Fs/xUmJZz5A6FuDr57?=
 =?us-ascii?Q?a9BS0GJr9flW7vTrpdkJeVsKea73gvz1PX1mbJAXgqt4ndGH8qUUAUmRGrhR?=
 =?us-ascii?Q?/1yvglpHZMG5RvkeKlhHEHn3dHRVQWZ8LWlR/OzTChhizOGsXM9Ok8VBeUBw?=
 =?us-ascii?Q?jIMBMWN0fUCWGZIiohwjUrgVY8VzypeBryaIFam3d3rQzdl1fELGE/bGlIBb?=
 =?us-ascii?Q?t3gdHUlOiR6UCIH1lztredSkEWMr6E913UcLJEOIoPA3LVw6qIKgqsiWZWpT?=
 =?us-ascii?Q?QAqKf3WCfgMmUGEfU8o0e7FRrXQyuJOvgjWUpD9Ch9zdYU6hOP9OWzptmvqn?=
 =?us-ascii?Q?gk4JpYDj8r/VYQTjuFzL9ZB2gi9IDXbO+7HI2tudsICAevJxUcfusFAuwcXh?=
 =?us-ascii?Q?Xr4MYXHdvpaVGhkQhmCIs6DT9y82cTrZa5n/oCGLYR/HkaO65DBrsCRJuPZp?=
 =?us-ascii?Q?MYl+tIXjlgm5CJRXiNXCNgqQyjjv2jaG1WOOViUoaA5dzuqQvBeSWW22Zq+a?=
 =?us-ascii?Q?CEqbfcHXMtg51sv7EiKT0I1/thC2Oa97TvaiDcSO7EaiH+8Ik5BtQKscJirt?=
 =?us-ascii?Q?7lCnHwRwt0aYiNJpxQi/gNHAs3kl3rY1bM4q+RXPqDsYwuAPXrUZP/3/qnne?=
 =?us-ascii?Q?1RiJnTzJAKApBLK6QIh/lP0ArkvYtps7DwP6ki2mc4jTd0BSNaBfpHgYnuUa?=
 =?us-ascii?Q?ZqQ+9wfwVTbf+iCFf0EZzElyLQjVBa5Z3LdVR4ABEAm7wqgBjppHehDZomyO?=
 =?us-ascii?Q?Blj65xXhdBV0WglM7W326SBdcBu4hODnKGGQVXdSGZFJs4xHJBMIanRoFlrs?=
 =?us-ascii?Q?g+GMXN81mvTVnBnYpf/T3ipBciSkQ/IvQAi88Kap4nsxoNJrlyexL2e74Jpz?=
 =?us-ascii?Q?DHDZIl7ARVVIg6bKuwg8TOW2YDJHJ7zBg77SuvgBd8lNLuLeWarYQ9VqdCek?=
 =?us-ascii?Q?4yQq4v7bhYmwbhnewUWTpTZUj0Nr7CakhslwgNS8tckiWOYI2OMJxuvm4LIB?=
 =?us-ascii?Q?/dMtg8BHKwAb7I4to/hez2yQyv35kYeCg+xUOMtH1jqnVe9fjYE3ojFgy2oT?=
 =?us-ascii?Q?kg2UQfXISkmXrO1d/Q5qeDdJ8JAm1Tf+zP4OwdLiKDg3iDEJwfVupiPDPmzV?=
 =?us-ascii?Q?MMIQPVKeISsrX6Dd+ewqQ54JRATVsDMLnRabieqYqRWU/lnt2dn5sTGvidKS?=
 =?us-ascii?Q?xNmM6C53luDZhUi4H1AxplWH8lOFcGj5FhI6b6EJLHdSWlYoFaElQ2zFlnDa?=
 =?us-ascii?Q?k5ypwU6ly3WpvOHy3UllpKA2RnHlU3Arlp/TBAlzkNT8RDslnHHl+9ao8qiJ?=
 =?us-ascii?Q?mTrnsoi3cxkmTztOYGsXuDGLQ2rdefDc6BPqISn/qo7dqdZkK21gC0CMqTy7?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Z1YY+Ti8M572UcfB8cV1cwWof+2lXfULkAZzWSslesJm8JlNZH7RRShkCKeVR5il0I9JIKdI5PYasNyvzIAFNzLZimbOqA0SgYGtsaOABDh3hE3qq3el3v/4JAbNt1m9CZxTaFtd3/4dN4KOPfbL9f6+hAZLN60qSDd14jbdlE8bpXzPAraFbbNeKzQBdHe4G+LBfsx1xlyzvxxvSqYtM5Ae86JXQJmreLetsMXgSBdVotFLgMax4LJ5JtgId+Jr3H7d3itGwJ20KKl+YGfTWl2lyS/XSfXQaj9xRyz/BnW6iH+vwrQUH3xgDQBHn58pho46qgMgqUIuLSHJy89hqD3vACUhCgeh/yf4FwLFHkRtt9k57iKaWlXT4cGVUMNc7EohZRTkqiVqc1SBvZqlslBS38BX/qRz8FESj5WPG6nA0q/wDS4YHqnrRVomyBZnM5DkUsXlg11S2fZqJXy94jyX+2Qjpv2BL16hovryoKJkVBFOrAMnPDg5dPleK/R/PW03rs5Y1ihhuv+1s9jdNmBx8DybdstIQWAvWo/gz87bXHGLdh3tbARk0jEDFja0ZXWKHG9hka3qz9gFocJM6bWbshy/99fVf434IDCWfbk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644262ea-cd17-47d8-647b-08dc7c0125b4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 14:52:35.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKX6eWoM6y7OmldJzawZ0qqLp66Rn9R1p//tIIPg0wVc/zqwOxnJPrcZVRkyZ6HtuOoAIacItZuPS16/lmu/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5692
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405240102
X-Proofpoint-ORIG-GUID: mv7rXjELG1CaNeHOwie3CaEtecb2_PzT
X-Proofpoint-GUID: mv7rXjELG1CaNeHOwie3CaEtecb2_PzT

On 23 May 2024, Nick Alcock told this:

> This moves it out of the way of SystemTap's rather different sdt.h, and lets
> us remove the barely-working kludgery in the specfile to work around it.
> Right now, the new location is nailed into every user (since sdt.h required
> no special cpp flags before now), but this is hardly a good long-term
> solution: a better one will be forthcoming soon.

Tests of this now completed: no new fails anywhere I've tried: RPMs,
"make install test-install" and direct source tree testing all works,
with no sign of inability to find sdt.h anywhere in the logs.

-- 
NULL && (void)
