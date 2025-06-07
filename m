Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE781CFBA
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276914; cv=fail; b=s1Z8rMjxwfIb7JDW5Ow7mC+vYZw7DOFDSg1uA+XdvXupKu00i3zqzVFGvazqMcepPihy/jv7RTlszIoT7FkAoEROT6k/cloMctWFtuPxY4u3p7a26AM33gP1K5JIXIkO+W56wm92JdN5wdUKsCQMazhY+q1wAJc2SSzveMx9TA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276914; c=relaxed/simple;
	bh=mRj407d5bhSvXD+RgByqLmlqaRQgcIG/FRM9fYQ9CEg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=lVUD5g+DrPwjuT6b6yxp41GO7AjQY8aU83CEgzz5be/puf+umlvi9zypS2lUWFl4qlIsU+8nYTFfAHaxb+sRwCCIJWSu+zqFCj5EJup5qrFDfTW88MCkHYvxx8RX8x2IepQa7jMEKCxzUpwKzAT/q5bOeN3YwaRTISwaDzYdxNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QUhUJuRM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jyZ/TPxd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QUhUJuRM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jyZ/TPxd"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575avTB018048
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rHYK3/hHNLwXd4DawIHNYex0zTiXkJxei9trSMqK49A=; b=
	QUhUJuRMFmI412nJeRVO+QDqGfjgHnFzEu1LYUEpzZSrXwr87hljFh6gTkh8TJ/j
	OevCwmFVYxcck2DI1kli4/yQKgTtvo2aPC8yWmN+uIUUyK+pVHm2naeePLDIPEqt
	iCsSJm06kJ2q9gIFiH3YS3pw3mK1H2VbhmFRqGA4mSHAD9pH1MuBl8asQN++H9uM
	rfcYyeC1Hs9UvdndCBQ0Nwvf+5YsP3Tjf/r6mq9HPZScowV+9Vr+fxx+blsl+uaF
	jNAYXh9qzu+4XV6CSP0rCLHkwjWAt50pjVH68rKFup7iyQKyp8DU8SgkDMaL83Dl
	dqQLCf9tow6XbAjAB4UIVg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad025k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XYgZ020720
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:10 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kysw-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yti7P+iNQOEcYl48XtxT8+L94kUNw2IT/t/hGXE1Aq5rd9mzFM8tx6Mmx1dsKSNmvB2dOgquQKabIFCE/rGhUK4SJKb/wlfcC26yqkA7/u3LjJN8y+/libxDSydrdgSbTf3598o5yroplkG5EG29j3Iq4dT99ONta9kgk9O9Gi3Hu8sp+O0UAVUJukZD5n63sRNoJtdkNaRJw8imPuRubY8LuzM83DBhVEhSU3uisiIFSacK2VK+8kiFrnrjWcPPnQ3iV+l04FFmySfdkMibY2TkDA7kgBpWCUHOJirU4tL9N4wMdvdhpP4FDx98Y9rMcJxIvqILsquZibTbkAuGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHYK3/hHNLwXd4DawIHNYex0zTiXkJxei9trSMqK49A=;
 b=cQslGbvBuiZgHaifRr/Mhn1rasaBYEoaOnhd1nJTXKE3I6ThCNZEaET/Yw0G/RGMVjbr8EO6mf3zPZeot9DMcbrjsqHaVnU6Zz4l0fzh/AXmSl2GuRz0M0HHZiR5FdFgCNzDrEBk8oZcjiqJUPIXZHWr53vOIwtXKlAt4WZOt8afy+E7m+CQ+m6vIuw1yRTHQS6apHvGAGO0u43aJwlhZIZEvODNOt635VZN05eew/v7gZhv3hOou2nT/4BL7xvb//uSdY6SMveBhHo5O/j1FUuwBcDYRjAKS6XEIK09+8CUZ2aqe+pLRMHQtKZ/t91vnvYhfXSgsJwp3dBvEs1Ngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHYK3/hHNLwXd4DawIHNYex0zTiXkJxei9trSMqK49A=;
 b=jyZ/TPxdRVOhXdgbVB5Ed/D8bi++eJkq7KvnIRolW+Lx+LK/6nxOYRPUIdFShsVazppg3V4XmJpXFdmZPECUhcmYR9Qb/SB6xDdxv/EvmXhjEKL2soyMSvJgcYLnUfp/m4eAO0QyvdpFDDUCMV8I9uOljEt+8dyJ70JBwB2wtls=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:08 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:07 +0000
Date: Sat, 07 Jun 2025 02:15:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/17] test: fix test for non-installed testing
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83746F10357E367148F453C2C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bac2b32-8424-46a3-cad6-08dda58aa6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oKwmle6TzjMox+CNnbki+mal65yfkT2efVDgkwh+yfLJRBbgYh5ZYlYaOv7A?=
 =?us-ascii?Q?EwpCDBao3qMMuGYs0J/ZsqMFWnCnNTPq8Tmqtl9j4N0/81v2oLJyPM8tYnvH?=
 =?us-ascii?Q?Vd66mC/6WfATMTbSaAogmINGWp/S6Bf4eWD7AfeeNgCNgT+TmrlHZFwbH2bj?=
 =?us-ascii?Q?rTz/hPwyffUPyPdHWGT4Dd3M2FSVoTOhn55lCaTISRVDt4so1SWgueE6b0hU?=
 =?us-ascii?Q?JZVZE763qyc9LMz7di4I6hOMG1Cmct69F5pa6HXEu5gkAkl3UVm8wBbBlyNX?=
 =?us-ascii?Q?1ZNxjr3cvtQbJR1ZA/SF/WSJ1IMb2G8byFDDdtQFuLsismZKA8Tx/laWjUKu?=
 =?us-ascii?Q?YdIv+a909iYh3tYJt6U8DQNHnoPTZ8LC5CodR6rJyuQZRY5IG+9xkfEIp+sS?=
 =?us-ascii?Q?oFRJwCpMM7BJrHEk+sULUdHghwoZ+aYWIBnwJ8B9CAcMrLFHNrcFDIUbl2z0?=
 =?us-ascii?Q?woYl3azdivSPDWasynQNFY8RbRJ5DzdNcGrOQl6W9/5nqh4V0HgNMdyRNE+V?=
 =?us-ascii?Q?4I1/1U/L+ezeDESzFH5kwjGrW+AlrJwdI8wuIckP28P6zvXNoGufudhZIacE?=
 =?us-ascii?Q?BEH+j7Z2izQlaIJ180QCNBvZ3rX6z5BXqbfJWkKuQLuK4HXOnf67FPV/oKOV?=
 =?us-ascii?Q?inrQfEVtxvlsWPkstaEEtXwMPg2Jbv2Num0IIFTTuXw6c8nnBgWYO0aeTxfi?=
 =?us-ascii?Q?s0nmetFGf2t9K6WO9szSbuapCn1HkOIHugV4r17KTYHysYuKpMQn8DWOs+uy?=
 =?us-ascii?Q?lT/gjv4K2/S0yaKTe8h0J+SQYYbGeen7lg/DXthW21IgAIPaVhPkchQrZSxk?=
 =?us-ascii?Q?oTZgjI0N0KUKXiCs1QmlNV7xF7CUtSU2RxFuKq1MThzNZneNP8AREbq7L00x?=
 =?us-ascii?Q?V8NFT3VS7aSg4/Fu5oV87qIGJpUHI+0CtrxAaVnzyEBIhCpHjeitJkULB4w4?=
 =?us-ascii?Q?/Ev5UnawVyWhIVu6z1UPKVlz/l80dfwDvMclxW7dbwku/nUa+M8XNs5i2Xb8?=
 =?us-ascii?Q?/ywIPcDfUOgzIN/J+wXl4uPRR20tIz2dxcA3K8hD9GGpt264nNz4rbpOUpqE?=
 =?us-ascii?Q?PFxuGeoB17vYJ8+0gYcAMFET2vENh+yX1FzYbrcDT8C+NEh8NUPmzRtAcqGz?=
 =?us-ascii?Q?oBAa4CiyN0IHZR6VfiWiU3PZgpE54KLiRrmO/xchJdskwtH5JMV/4aKTExKF?=
 =?us-ascii?Q?mHhCET1QVB4lqUI69LTCdIbbozqzspq8QWNtpev1vP4bdMEQwaqdLleT9xMt?=
 =?us-ascii?Q?4AyWOpapjKBqpjVOsDOwaNSEd0fG1Tz231fldaGNL5C4V9f7mVIa0B7ekElP?=
 =?us-ascii?Q?UkPk9OUCjXY2vHYDfqqKIv0LBefR6sVKNmwpdqYKy57vrfxWSmijMgmUNRFZ?=
 =?us-ascii?Q?fLY9W9/FxKu3kZoYztoHGweguENq6W3vxhi1NAOjSAy15i29Qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2vPZBoXvBmb5NmB7jmlUjiG3vtRQL1Jbo/EIhahecc945oWowtDmZ4gcyzt3?=
 =?us-ascii?Q?oC9QFzR5yk7BjcTjZZe6wsYnkRUDlMAe0qRVeBKI/3sdHAOUt5oZUws7aWQV?=
 =?us-ascii?Q?GKyfWT4dJqf3pU2snj1xu+lwQU6DpR46KAzOq8mBFkxrObQhRtBWHQtUKuiK?=
 =?us-ascii?Q?PTbKVSSYdsGkINv4WTohbS+orybitMkPj0DgzVphabFLcs2nI7VExwOTVn2C?=
 =?us-ascii?Q?jB7II1NGpmpu/7E5GSSSFVruxnsKto+xwITkPXlJVv2jDkaIJBYjuTHii50F?=
 =?us-ascii?Q?nLDQjA1zv9lO6GK+1v9SPuiy36iH1MoRkSIEv/Gk1easnQ/kwHv5KK3mJKwh?=
 =?us-ascii?Q?UCbGbmPkboTMd6EuqY1Qjxd304masNP5J8pfI1IDV3af6EjnDaCA16R1lCa3?=
 =?us-ascii?Q?lTEMjD8JF+QjbMIvBpD/lWak2BcoaLV53/Q1c05jFsfW61yX3eHttP1fvyZK?=
 =?us-ascii?Q?BBcbFEYxJeGQ6L9fxt2MsOWlNOMUEhpyLQv/T6fg6rvavCAHoM61OF1x3Qzr?=
 =?us-ascii?Q?ADEUjrTzXnfALSJHwskDlI92lFtp7bvkDBWYGEgyH3TMMOc59Q7jb9JHPb5l?=
 =?us-ascii?Q?/f9arJnYpJBTm+O2hiEqjEPVbbNzW8+udPwqGfRejyEcbqdGIHGG+IC6pUup?=
 =?us-ascii?Q?+EQFRQnviHIWsultD/pMZaiKVSJRWnklIrbD9HO8ogxKyi1GEgmX8zRQeblk?=
 =?us-ascii?Q?OEaC1sF1ezg43byKPcVuI0pPCf1V7YE5TysOz2VpyZcJnPjuAFeHBBUJ6bbz?=
 =?us-ascii?Q?GEGUvKTgf7guD2YuA85c5nZH49HAKQ7FrsDXpy7NoP6PVBdpr5VN6Hq46VXG?=
 =?us-ascii?Q?3zIMDWTw7uY2s16DsF4fbUZNCHahOZDoiyBqcPgzbQUZWg4UI8IwL8hvDWN+?=
 =?us-ascii?Q?OKrpprW95vStlIOybUgMVGLc4dYubcT1zwrRbkS0xlx40fou5kmKHTstTI6u?=
 =?us-ascii?Q?Q3gjLg3zv5sA4jhmhIGVRJ2f+hlxy/FCHQ+9yDbtowIMqX4mgVL/Sxk7s+Qr?=
 =?us-ascii?Q?BRvtdoPBiXHkykjNnZq4Llg+gXWZYZSHOjeu1bw1a8F4Zkhc2QUtJCYlx6VD?=
 =?us-ascii?Q?1sQnsm8wFzlXU45wqBrrK4q9sgAeQNiZ8Ya29ZyeP26rjz/VK2i+Y1uxgXKX?=
 =?us-ascii?Q?uaPhctB+I6P2geDhBHsdEsUqkPOUDiQDxWUH5URlIP6z815T5TQ8TRkRgemz?=
 =?us-ascii?Q?QJMGH3eAf6bW63f+BLgOPfAVRz2GrS2qGedDYYJ1VTOKui2HoeFq5BDv60MP?=
 =?us-ascii?Q?d2u92AuxtmU93cbH58u/fWKM26mYCCrmsUWuly2IPyVpTEPVIidOjEoaU/eZ?=
 =?us-ascii?Q?UuEHtJv7T/ZYhJM2oqgBJFhYmREX+IacZAHLMnr4FTd2Qz6hfdRHNT3uxl2E?=
 =?us-ascii?Q?TbRZ0dY/EZLJGq5UWsEouDt/2U9Q0tv6ApeIQrtGZ2efRGAJ/BY0+JZUEthD?=
 =?us-ascii?Q?MzXf0hAoV9FiOYLp4XDjMsxfOkrOH/3ARgrz6twLim4X4XS0sY7XfDG3JD90?=
 =?us-ascii?Q?bDsN6QGovf/KM7UohEii/oBkyPj5aG7smvlJdk9tiT51NlBYVYgzFsTofEIg?=
 =?us-ascii?Q?FGdiCfIaj1Q4wIfup27zXldWtkzeGCBEYnWcBxLwRP96v+YWwUJpyki+Xh0o?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oY95We+tot2264zdvafMI8or6qie3fqiZMpLyPQo5uvG7dPJtV6Jvb0pMiM1Sj9Gbci4/sxnIP8+ma/oqUe+wszz4SuCCunnU9u+3v7QIeHVesrerhYyFGmkgGFQd19sT+N9J6P+A5yFi0WfY4BK1rtT43qsyroRHGovF338qbmQ19/82+3cCdHXINKrsKpXYTW9ovrFr0iZfB66nKplE0GsLFXuiX6+bZi/pam84ELfHkBQ9J5JLvLiCw5LPoxNCOZFom6o59cWL1onZ50CW8d24vlPmo6crHa0Pf0XLT298RuF8+6bR6JGgrSVN4BKTciw9EuIpBBBjmJvYi5tkGeNd4SRUbzdA3lRgmT4I4XSioetfDagfek3/e8kwKrzmrhlmCHepxpEEgtNFKtKuYOz2+KpGegO9HaHjNXss9N/YN2/MEoxkhgHtWQNmvxtBdnaWay0fz5S53pDMeCbpEOztrSQaH2JHDfpmMbno7sv8fca5CNgFWcJTmhqEflb9j5DmsLkRX2Wru/HaQBhwH0Egyd3fA5lFlJ401NZgN2H1OlVKcDg+qkQpXLlamj4m4P357Q3JaWPS5MqMPklO0xSyVtPxMuO6QFoFHkF8Hs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bac2b32-8424-46a3-cad6-08dda58aa6ab
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:07.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUmqPIxGI7UqAtdSA2m08n6e4AScM/pPaFEqGHq0g9IokYjK4/y5sY4fCSqv2gY/CMFnjLAPVYkICZwnfqMKXx0JJn6/xwsL6JujSUx9NEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: BUO5dFIGPmQ7HUjUn3TKNyqbgIlHfs0L
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8f0 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Zztv512S-n5XyZizj7QA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX1qbSZDvCQclh atxsJCF0IRpsMnmLzvkLPEA6+9raMqZT4HLJ3f3tPkw+nyKfWs40/4ikAfZZetTMY+xlk8xA+yi qKxIzSfN2pIf5wLyE1ODCj7ldN/YEWDKtRhUxo3Wkwryvhlsnw8tWtMmKMb3nFNYmzuTodH4rls
 IizGxVBUlQK4GfmcCOCJWSuOVRalOehtBxEpBpD6XjSwjvSCCtHEb64BQm2s49PY9IYzhzd2LgS kG+hg5a5xz54yGOPEDiZCophVtbPhR2dM9bW2Hn4MKEzj8PKg8wDhmnVMDpxLbqsjXIvZcV91O+ 6MZK747JF387xSINLkSxpljRGVUlYaOHR2mokhHlXXulkU8WpriKmWk/MHe1WZr+bKDqLEZlrm6
 mJEJsuf1BNnXVM+qpuDi1oPOGYI5Aa+AofZbtEquIqOzWgZYtGK1nUb1pNyAQxbti0iFd9vi
X-Proofpoint-GUID: BUO5dFIGPmQ7HUjUn3TKNyqbgIlHfs0L

On a system without DTrace installed, <sys/usdt.h> cannot be found,
causing this test to fail.  Use test_cppflags to ensure the correct
location is used in all cases.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index f66d6cbd..f80fcc05 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -22,7 +22,7 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CFLAGS=
+CFLAGS=${test_cppflags}
 
 DIRNAME="$tmpdir/list-probes-module-usdt.$$.$RANDOM"
 mkdir -p $DIRNAME
-- 
2.45.2

