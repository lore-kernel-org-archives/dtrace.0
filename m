Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858961DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150340; cv=fail; b=EucC4wghNxpSxZ/od3VfVcjCZ4Yi8XilKnMsDdWeqHHzlAY8yziPrfKA+hAuQbAn9mdV5K9bW68IdzxkBafqqG8ixHiEfftYiQyZj2o60yBM2neR+a6xkwI2E8dea/eRNODtxtXwKWKygX4oITA8l/MLdnbeamoH7Qcsw371xGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150340; c=relaxed/simple;
	bh=UM+8tVxn8gvw9LaZowUXdEsUxL8pPluIcWOCxnllsDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gy25VhCoH+0tkEbZ04+10qCEnjuw1sX2qX9+po1GHm7OjJQxzaoQKD5jrti4c/lmxaJ9+auazxG/Bg025igYmMya55qkmT7cUsKM7XKvzOFuiY6IvkYJE/SZNxmwFFJhtmAvBuANFgdbva62DFf3WDBZLlN8LyohEH2LdPzRkdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Otz6PFbU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kTBcAUai; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Otz6PFbU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kTBcAUai"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtah0020945
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=; b=
	Otz6PFbUhnGMfkmav6q+HDNGekyj+uizLq0qVivHkkqyvdhLt//CQKHFjKtdzG4b
	3HTcCZPaQDVnQdLerqWQSKaKHYGm8kyvEzdcQB/DOe6V0Rhd9BFuVRe76rqlbE/9
	+zGBOqdsW0jqQnu29DN5uFeTB+S5ViRcboGXwrBE1DgbD89+Qh1W98soFgcLLJhe
	/ZowFSXLL+PpxpemLJCkTSgrnvVu2TO/kJKHeZhSfjWOm84aoPx4csgViFuBGG+t
	CC5OW5uYqO0IzPXZJKUEwxKD47x/Ov6OiyWZFXWKTsyt+iT76ktZO0G2f/U5BXdK
	nVYV80ZPdhOkEAd1ooHwyg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKuNJ4035542
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6kesb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtvXPGKkFwEFoDTjTLUw8uT8tgeC8VmN9gGiKF8y8scAg2eF3bXYapPeDq5ntzJrDIkyi3mXtA3uWVyB3vNLii5cpth1Fy1o/0mmeGhxvXYTWSHSHXmSDz9fJCDv8I1mTe2exeHFZ4GjqXZ2O/6ja5SCoUb8q7mN3NY1YopmG9UZ6i3qHbyIpQWLsKNd4BfcJorI2VXz0DlNGVOt50JkOsfjNkgQESs695hJF+ThN8jiz5mgmQh+UdT35w5t/Ex38OES9Ot9ghF3FwH2KAT6z/Kow0AnHPZxYCl7VVKruZWNjz8Bu0cwd9TUknphfbFOrdE/p7gbUJVU2JXk0vTJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=;
 b=L7mbcqp0LoTJzRx63Yhn+sF2b/rdKHn/g4O0CWK7GFFpfXhSj+8Cy5n2DNYTO/1J9sT3scZ14VhiKA6r4gcm+RBpBKCMyHTIF2K4kYngQddXpixqIoqaNSfYRdUk5Wr9169nbUNzcnXiotnm1xyS4LwDEBirXBk8KfECXGZLzhJCSY7Mu03Hr12kbAVOciUYaB0nrz/k4xJ+AiHd9FKY0kDBAx7iJ/v5sY6vrcIv+S2Jcp1FMMgl6z2qVZB5P24a4Ru+ULKM0qjnczb1gbS0JPFYy40dg4APd/QaAHO7FCdwiQAffIXcBjcByWg1dB1brHm3CnKWufiaUaFzZ+qBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic2PjGILgynOFypyZL3rRegAZ8pf9AHYy56Aj4anEAA=;
 b=kTBcAUaic7Rsgpo9UnW06DOxgKQPCUliQfAY8ptsQ2W1lff/UkyMP3I0lNIQAyM2IawY32sQaxeA3dpMhlruAs30WNJQSypFDXYVdXLTfldE+qh1NItaTNIO0lyRLpqCp43R+zoWpB+PKkYDT385sqfSQiXHbj/BhBPP8oWfJSA=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:54 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:54 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 1/6] error: add missing EDT_PRINT entry
Date: Mon, 28 Oct 2024 21:18:44 +0000
Message-ID: <20241028211849.458862-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 030e46bb-0e31-4955-fcf1-08dcf7962099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ASNPGwhAEJEE9A+abuIr7VJ+jyplSrrTI4dtSAtMFfMv1oYg0wctvW/iScf?=
 =?us-ascii?Q?qZKBeXDtBc78DsZ+Oq6TnCQOxRkQtbpg7ROywIzreAVKDP1k/e2/aMJ4U5rZ?=
 =?us-ascii?Q?y8FqB7w9zCz6/ryI9lckX3Mbkcia1jQ2thpbmUVX13Ju17mGCfJlxLrSk6Ag?=
 =?us-ascii?Q?qFv4XqInty8osJNvUusBpMOoMBoCBIhnD/0JCNd6AeVgh7RXun3yjoawbYBA?=
 =?us-ascii?Q?0tcLQzdZJhLD1Ientfns8x7YD3yX2bOo3x7wS2RWKkbQKMIwsx+UXB5Ra9HY?=
 =?us-ascii?Q?OalRTbNG1vxPKD8uEfvNAgsQc0e3RfI2t2hkT8j1AbxG2sDK7JFaWHQtj6tK?=
 =?us-ascii?Q?SlieFAtz1AVi28jYdsDk2dmng2C/wKFfvbU3GNWT4grJNtRI20x+ZTaWUgh5?=
 =?us-ascii?Q?qgD6dgYw82ma1VCmGrhLZkr3NzMES/YJONzPHruBYfMzBansE4/ZCbdm0luo?=
 =?us-ascii?Q?qzhCN8ndDOAP4wMCrygFjjqRIEyTCTihRYkrnpZW7adpUv70G3P/8MEAnZFY?=
 =?us-ascii?Q?08tsIoRJ3QjEhhmxY7kTQSlqbSI2ESR1A8TUtBzszVqn/GgVf/CzZtcMUqMX?=
 =?us-ascii?Q?o7p0yIUomSXpvlU7eMwQH97yCn6t9gBvw9qbp7BfmiQuhkjjneMFySl++gZ8?=
 =?us-ascii?Q?729BcAt+OJ4A/zCrinKTXvjGIW4hi7QXwcBvV78K8Ys+N9qny5AW1K79auqb?=
 =?us-ascii?Q?Ww+jCdbyX0aYD+rlPftTV+PftYu+LuRmM+9LWtNZYAnOSA6sIqC771yPCBM5?=
 =?us-ascii?Q?Y5Iw+vHVk50pXZta8KDLXlqJKVM7PnuHEnKR3LHYFeHUP5UNEnopnSryD4re?=
 =?us-ascii?Q?5jm8KwxCHtfoKwCNodQb6W9jZ+NkeR4pzWqbH+ZE9z5MRyH4b3TU/tsZiTQD?=
 =?us-ascii?Q?LJKVFd5dDQ87ytIH50I9xdzh4KIZQGHjluhh4GCFN9GAMehSnmmaj0Z7Gy6T?=
 =?us-ascii?Q?6xNzrjQ4kPiA9uUx9CfcY+dgh+aiIei1u4k7HSDL/Y/C2C1ScG/DyCGL+R3i?=
 =?us-ascii?Q?DBnP4Z3+SC4lfmDZ6yXV4iW0Ya5R1ChVR7Wi4T9WaMAYArSy6T/P3SprLjP/?=
 =?us-ascii?Q?sIRD42UN+Y/E57mnElciPCULSlAITrfzPTJ3PiXT/I+kmTOiQa9IYhqBKoiP?=
 =?us-ascii?Q?npPJ8y1Nh1E39w7j2sliTFWrd9sYQrNfw3VfGF86QPFCSL9wLvJ2qpLccgmz?=
 =?us-ascii?Q?Opl6iD/Gug+pWIxWGSgD9lCZoHGhyG9pMpwJ2tv8dmxQbYBYopYhRUVH88/F?=
 =?us-ascii?Q?JSQLzsCfMPaNcfEE8Jfq+HvlJzao2VHhvOLx0r7ndXUmOqPRTgvRqSlcFbl1?=
 =?us-ascii?Q?+feJmgX9Lw3TkziPrw5SH6sp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LUCrczkcQibDbLzk0wfl2xZQ06Ijz+9kQOnSn4x5vtLDXgiS7MOAHXl9xuqj?=
 =?us-ascii?Q?9oNioeyZg/U+pChtRNsH+F73SG7ydsuJHP53H7oXqMXnw8O/f8o5A/KUDbub?=
 =?us-ascii?Q?QbcJL+6E/z8LJbBxc55wG1Hgc3/URAFQeMym60f3CfoammjdVSfXdDvzjuDs?=
 =?us-ascii?Q?elAjv7G3qcvMk3WaqYaCSexsJ/2vc4DRtCtN60V3myNAdFuB/XDvKhxUKE51?=
 =?us-ascii?Q?n9bHZg3pxiAK+GmPfKwQEXV4EFBs8IeCNVeRIfp30mqyuNVLF27xAunxPTXq?=
 =?us-ascii?Q?rUOOAmimHN/UK70kx1Mi052FmVWNqsSfPcNtVGNDM/T5kRQjaDRb5/zN3POF?=
 =?us-ascii?Q?T0o4pBXVKyMVVB+WjWw4fCr3fBH/JnQIfhVh60yLb834Zo9DGW+XV8vxuJPw?=
 =?us-ascii?Q?mB4/oagpfDE75nci3+Dh6aUjJSvpt+rDQQwl+gPfZOhOOZUdXwOKr7lwvyV2?=
 =?us-ascii?Q?w6sVjXdlBDbo7PvjtE82L57bAMSrVL5pVIX/0SCob46jvRp/UEN2wzV7tl9x?=
 =?us-ascii?Q?q8B/DfJizeGodtueXpR2JH30+DCTzmG5FqZ+oWHD2C+sbMhcKOX4r6JbRccP?=
 =?us-ascii?Q?FdyKSAGqVqOPw0NbtANLfTZldEX5d19aflwdOpEw20yuW8twbocfce1F7W0b?=
 =?us-ascii?Q?H1OJOGvu/3cK83atmTFoWlJaCqF6o9EcqPvwb4l0fCH6fBNcyaudL3gkql9u?=
 =?us-ascii?Q?F9LvTYu2ODj+ka4dctKmy2qNELim6MTVznh2knvE3/TKrLDvxEl5WsD7l/6Q?=
 =?us-ascii?Q?v6IDlhzSK38VM8eVKRGRtREdIq1x/mNwh72sUC92d3H2k7pmAZdkC6rEECf4?=
 =?us-ascii?Q?wXBNWKA4V5M1mdF0PEQ59CQA7nIxulRrrU92C5oBK9hqfjA2ipWbFplBYXHr?=
 =?us-ascii?Q?qDnTtaNCUeuhLSQAGkptAV7Vfsjch+CB2BJ+2+JB7y/g9lFGEe4FoaYHMgLn?=
 =?us-ascii?Q?km9rcbkZYS/2vG5a62gXeonkr2bDXtQLNKejUAKXk0JW7JnESUnsp1DmO0Bg?=
 =?us-ascii?Q?tQ/uWT+4177pqQpO/1jom74y/fu5L37M2ydukRgXGzTXssIVDF7atGoAdnoF?=
 =?us-ascii?Q?ZeHnYgWjFn8pb59w7b/YVDsMdl7a6yqcOC9ameGij8l1LNRFBYK+aA4STST3?=
 =?us-ascii?Q?eXGziW9pIwYtvuTRlwAjUgkjWTBtcjk+xYE3+O+bqJhOwNGh3t4/B7EZNXSM?=
 =?us-ascii?Q?f21YdNtyswGKYGCuS96RsLf/CnaH5hjQkJBr1BWtPXSX2Qlf7vGBtJK1AMkd?=
 =?us-ascii?Q?GwdaHJz/n9qahH4ew8nHypg2MzLkXMxLl7n+S0+yNqNzR0IO2xiGpURrm4Pr?=
 =?us-ascii?Q?Bdfmt7O7iJ9GvF1H6VabOquDPoq97w2gPbDZIP9lMGQeEkR/v9LAp5joqHND?=
 =?us-ascii?Q?RlO+r5vRbDretADF+pCF0fepToL3mJA7EjD2Zv0OxBXqkDS+2F4zDrynQvBh?=
 =?us-ascii?Q?XsUCRX4Wa7Pk12nsWbl3d/++4edDx//tyoHNfV51Ak778oY0/hwdi6eXeAN9?=
 =?us-ascii?Q?2WNBykgtRZiaMAArOxULz21Udm2/A5DITMrMbwo4kpsrZlLkAQIR8LxWhQm3?=
 =?us-ascii?Q?zFSGl78tpkiM2Qhe6feqyjlQCPnZCW2YV3opX1CTZqSdzvKlydRJNOoMQMKS?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	evJ1HeO1dQLuoHZ8vxfQO7JZv6RsZGa2u5tgNmFjDchbysTbwRw9WYFDXBBjURPpVFN3WlfbSoHIRX38YFFjA04esSp/v68g9aZ1ZRNXfvv3bKmVQekyhm3hjo7bqdRWrNaXowTD9EckIjRI5nr5oAeAwS76r5/nsotHe40ZRBENg7JnKh8ZSBx61qf/BDMCSDGUzcrgf97PxupC2g0Ngz+agVF+l6Nhm31KX+B8yfVOGovCxw9OjuMRIIOgnrvaUv0e4HguNVA0iYW+NJP/fJSKD6DdCr7qRY+5kplJG9mcBjCRY/UnQ6z8gsLBqIX5PoT8jJQPZf3ZBym8Gr2ZNmHbZ30jxMLLLco+Gc9u5FB6z8/sdhiBm9UmvTL3BvcbJU6/H8Q3sVoZ2xtfKZ3k4jt0x18XA28Zj6Ys9IekEaJH4IKBwAKJQswA9GQSPngWDJ3cBM7+v6WlshFpZuY5fIb+eD0q3Ajqm9s43Z68rOLzlP0MZDGg1+vYGWBIHAXtZtqH07N6w4qK8DHUtKzGwrVCVgndqBM+4KhGooYGrkaYluaQOGSZktaqyxXRUsRSYwIzoVeozuzpW804zQUa88FO+bCQ/LZ38zlnYLn5ix8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030e46bb-0e31-4955-fcf1-08dcf7962099
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:54.4912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHvoc+REMGl2saXgI56a5FUKoT1XDR91+WYAPBuX41FllmH2TsWwvRk2frSY2aLtB6gDM2iEf1QD2n8SKlMYkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: w2x2YjV3gAAHUA5JVfznE3aeQ0xafg7M
X-Proofpoint-GUID: w2x2YjV3gAAHUA5JVfznE3aeQ0xafg7M

The lack of this made it impossible to print out the last error
in the list (which is EDT_PRINT itself).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_error.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 82e114a5b292..213f0d9e1385 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -97,7 +97,8 @@ static const struct {
 	{ EDT_OBJIO, "Cannot read object file or modules.dep" },
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
-	{ EDT_PCAP, "Missing or corrupt pcap() record" }
+	{ EDT_PCAP, "Missing or corrupt pcap() record" },
+	{ EDT_PRINT, "Missing or corrupt print() record" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
-- 
2.46.0.278.g36e3a12567

