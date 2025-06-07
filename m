Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42B1D5AD4
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276905; cv=fail; b=Y3On75f4DLBBYBgVzYVdxSOxkpzsgmt4OhxJmXA/0CsdqcFGym71np/ELy5p70SiMyglKQq9Cr5c78QNb2ufmxadqJBjp8Yd/7Fhl6/o8r7AmNlmhC4/0iF0aIn+5/WE58iDhDmLQskTwEOfOVUHvA95FRItNPdGnB/kA5Whtdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276905; c=relaxed/simple;
	bh=FFB3VMxbhiFeaZbpwY58pD6ctAWYsANkTW93FwEec5s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ed74eHXIjJJ/FoZ0yv0in5mE8Dc6x2Xv4hcrYeFJgr+oiZDZ5ayEil5qUJKatTa1aCm2j7RfFeHAmieF4j/ELXHLHhq5OH64p2cfs8IhtbJwfQ2PaUoQB+vmMvglSI/a9bEY8oF2gWf2//CwAxyboTCkvkiIU3c/DtU66Tu6J/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VP7VXsnu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nPHQi1g+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VP7VXsnu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nPHQi1g+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575mBTK012327
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=c/tOTcLW7DlfTOzawoPuSSYrnGm8iHdKLsrE6vQzstc=; b=
	VP7VXsnuxfMwDia6uPoetcN/wd4AkrGXIHaiZKFjtQIZR6phuzBZpXhPA9jKu8qQ
	InzOeu/CExpbeQc+vDZoROOVpX2MlPDauinYSuDw/2KVOdEv+XBFlodY0zmUn/8q
	spiZ+KC8e2w+RCUuJ7vW07OmqTv7xze9yb4RSNPFWcRRUhUG1Z/yzEN/Y9KZEnqJ
	/p21Ym23UmpapUb6NCSxUQlOLf0V2/Y4QyewFa9SdOmL0pg679AjxcZNs+4Y/jui
	q6sEfsK1sQcORchq/CK2C7iVCVennhJJ9BmuDWOrLzDDwvbT1Fnb6VvVFgj+Qep3
	siPtRXRaWNLWCQz27uMcpQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr1nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5p4020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:14:59 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7qv20zKkLU71g5U42UIMJgvIM3Mw4g+lmQPzjxpSRGP1L178lBCNXyKtt3LoAla7OEtZZJwLUODI2PB6pw3sSYNfEppaN7xZVcJwnRml8lvu/84x6JvnOamitf5axUa4+lrBzgV1YKx/ngdBOhfT3oEzlUCF+DgSZ2rxew08bcCvMegTU/UiAs9XW9fgNVvRGVnZG+JTcrEzhbQ8JtuCPOQZ56hWJw3mL9NCC/3utujYIxuFX8EVOl69SDPU3jOCPYa+pNDKfiRnKgagfe3ksrYPadZpKB/f2S+uGyXE5+ZpbPTpK9wHzPso0EhXXZSRtaCa8X1H9skJRfHzjai0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/tOTcLW7DlfTOzawoPuSSYrnGm8iHdKLsrE6vQzstc=;
 b=rCnVWyK0lozaivqCduW0D1m0UDR9CxOeO+u3sitrVlpnLBULIKdVgN+nRs7+0TwkGByYU1vGngQNy1n+G2lLfXeRwPeseiwBw5jRKIqraxyBnYHyHsnofdryL1/xEumFix7aLqdljqoOYQEF65ggch6S8GLa0tl+R1/BLJn/m5HHdZev7/NUKgquJxTGmmtCytnMhwPivJkj/9fXvr7RZvECROdFewoUEaPDSkDruTFGfE5/TsfcJbpxkRiO90Ij+sOToOOMHfeg8gXrFJYmfcsAjVo4uOfPOGXimtUoNvKnLqIjHe7UNMpvMY+/b678pB/vEjjWJQJIQvULt6Jisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/tOTcLW7DlfTOzawoPuSSYrnGm8iHdKLsrE6vQzstc=;
 b=nPHQi1g+CN0MGone407NUnVoZhn0DHPz2JASMLdWkmP0yaCmGIh0vs3FML9cVKLs5RDQSCGxCfePlGKHKaoTTWt3/iqGK/YWc4bTpxd5+pWGAC2q9719MYJimE6zDqHJwb1umca1qohHqYLMMwddUfiCMLPlWhaAhuo4xxo4rmg=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:14:56 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:14:56 +0000
Date: Sat, 07 Jun 2025 02:14:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/17] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB837479686334B7F2E57D7F05C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: ef646c0f-4bf6-44a7-3bb8-08dda58a9ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eAJoVT+DaeKpwYTCaGFv8syGgJPb+CNSILGHmpawo3v9Eor1dE/cyd0+tJZx?=
 =?us-ascii?Q?dUwk/lL5K+SO6jGD/7ySg5q4szqCbLhsEXsL8hNtqkgLvYz1LJxDQFvR9Mig?=
 =?us-ascii?Q?VakU9WQU6zwRjvQr0VCZW8hDdYfHuM+9P8ZykXXeIE/vXhnqWH5f6a4pkZFY?=
 =?us-ascii?Q?2cD0hqe6MQ9yGA8eUk/+JUboW9wNyezID4xxaYLCD1QwvwGDR6z+NToBB/Qr?=
 =?us-ascii?Q?R7GiQ3wIXW3MfcRfmF4qrLAhi2j4lTL89WpShsOV8YfxPRdQrTY39z3ohR/A?=
 =?us-ascii?Q?byE5U13wd4qwyNfGXZcCuK9YqTJichmZ9yrhmcKqiI7sGQmuQ0jt6JfRn2Hd?=
 =?us-ascii?Q?3J023xhribeboiTZngikhXS9qC4KsdAg3eiRqNL8UWrWwnJz8Vgtz/Tc+uGr?=
 =?us-ascii?Q?n4u+IshLDhuF8W0tqQFpVw5Iux8s5ZkTd0bD8/qVI5Owg3T28EzHrJ3ikwN/?=
 =?us-ascii?Q?OOO9y6xnap2lAUb0PSMKMQAJyZ1NNwykTxpfz1fht1gJqyEkWlD8TcYfRMkP?=
 =?us-ascii?Q?mkx3TUJ/X7m8ViYdw/BoABBfo8aFRSGKfdwOeS5BN/mlpE/fTGjKOmJMdZ1z?=
 =?us-ascii?Q?WbmTUQOTdR5BZBZUFH3Owv+AHsk71BdCX8OJRyvQnFyQQflABCz6UgpyMYOa?=
 =?us-ascii?Q?/X4y5cbjjlIBgr+NgCYGhxf7APRHzt0+FmtjEUTELhTDWiFXdqgUqT57WFfz?=
 =?us-ascii?Q?HAuj7X12Y2Sgb6g3qWhIB6AwtOmyhbOaaO3l/olI3qrPcpnBgeQU0EDYtLnh?=
 =?us-ascii?Q?ry6NxudvDDaZ3qWtkbctWXEA2+lJdxnurqdFftSYcVpgi4Z47mC6KRFV/UmR?=
 =?us-ascii?Q?HLAk25HcHoJp4PudA8CoYQr9YfunVuMtcQSyuwqSR79v1YXEiWk7MzlYYNMs?=
 =?us-ascii?Q?GZRLe4FkYx9N2Yp0w5ZC9nPMdlNAz3VT9eluI3KHeCqpEwt9dPMdXpdSMO3L?=
 =?us-ascii?Q?A3P27vED1E1EG2oxRbJmaLOZg/sIIlAcbGTI1FJhuBFTBDbVqJ+ONXiSUvo1?=
 =?us-ascii?Q?T+w0EX2pBzt23bua94jsaFX5mlM6YDA5DJYPC/IQA5V7po95RZbvLwtsCeb4?=
 =?us-ascii?Q?xjf9d2fcTnATGSMrXCjVXF2fogFSIWsBPDROLCqalvxiRqeuAqU5j0ItsTZy?=
 =?us-ascii?Q?pOOIfL9qKEsFB8vGVQAl761papHDQ3J0wGCq/aLG4I7LkmKJ3/Sc6v5OIbpR?=
 =?us-ascii?Q?R9LZDkzv41QLa8Q0bO4OGU+IivgjOrZ17LqzSg0Sxb5Vp0oTBok1uG4UKihN?=
 =?us-ascii?Q?Bo5hPycNsFtDCZkpFmUOObfU/ZIZBNIAOWnQFAjDsrCJQZvByG9HJGLyhi0J?=
 =?us-ascii?Q?00W/QExc7+XPsFbPk/+4oGOB7le7QIQbaKR/oHhEuO52eUDJUsjeaAYLhmYq?=
 =?us-ascii?Q?R5SQXDtB3QEpQ7o/6XV8tm27vbUYZx0HAzjuaVTL2LW7MMCyX4Nz2dkwIlJj?=
 =?us-ascii?Q?SOnvOa632DgoqzjjfkFwg/29dssQS+wv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zcMIrwJGt+ik0c+uNNNJ4DLLhp1APeELO5N7brHkaNdIrPMNDrYfm5+Ri9zI?=
 =?us-ascii?Q?WHuu6XutkHnLnRaGHOrcm/2xHiotH+AFNZsoRe97MCGxTGt5GYjqqhikhNPf?=
 =?us-ascii?Q?J9x+DnoKxQibaRYN4ATzadbEb/7ij5ZAK4qIWy4dhx907wwu50o1vP8KBxyM?=
 =?us-ascii?Q?efIp0LsGb3H+4lbwQ0tc3C1tf0fB8/01PdX8STstHLHZdWD4hQorOqx0f/MV?=
 =?us-ascii?Q?893Pu0aSRm9pHmyUf6xydRuB6YSpC5vZzJoan2WaanDYKCEA2dqQzlbiTFA1?=
 =?us-ascii?Q?/mVZSqVWWfuqIJNlIpG5kWpLxAkNsqg5BE7T4Of7j5gCT8iioJESanTa0jMO?=
 =?us-ascii?Q?71PU/57DlhtOccujNE8i4GqCoUJ3O4FEiTQxxOOwCDYJbsLzJYriZnrNoNI4?=
 =?us-ascii?Q?cU9ckNBCE1rSwqnj2GG1+X56VnhwqYAQCaJDiQbokJR07HwzMiceumxVK2gv?=
 =?us-ascii?Q?EAcWXbmwRP0IwmP/GLztMULYPUJ0hccg8xDRKLG7eOL531Exh8gvoa2W2Syp?=
 =?us-ascii?Q?wtjiCNs1T+Igj6/7QWwVmmPbtD4m3WmJ3g1qsbX4T14qRo9UB9P6sp9dyP+3?=
 =?us-ascii?Q?rCmHvsEh96CUfKfNp4A42hvozG56I79lpzwtPle9YWNZjo34VPZeIAjPce45?=
 =?us-ascii?Q?MxB2n/i8Lxe+ebfDEQOTmGJO/GERE1IKcMz1BnkzyoQKgmiBjSQ1bp7D/2qb?=
 =?us-ascii?Q?3Eyjyu59jgYckJULoXpAcB71E8FFPKH3nnZnEm4NNxg+pcYGx8unDZmhPADC?=
 =?us-ascii?Q?uWfhV81rcnxAJMXR4w/YeDION8F5lC1iiHEm0pmRSi8UXH/ETvSCAWJsLC/9?=
 =?us-ascii?Q?VlQjrrzAbjsJJ9ARy3fwd84I6XrlukazwKm4nUTKe8s9fWadsQP6LaZMSfRd?=
 =?us-ascii?Q?o9xLFOKRgL+h47UVZx52XtAGzLWzBgLmyUvTGtZHP+94dbReJdEzcEOhZDPM?=
 =?us-ascii?Q?Buv0k02y2O4HcRG8np1P+JDKxS12k2mKcGgENAplNXzpVy9MCO8GB3f4Chqf?=
 =?us-ascii?Q?pafDqkDebgHRYHWlfV1QuUk5Tup+oLpqdVtUR2kDGhsm3tAwnvndByajiT+z?=
 =?us-ascii?Q?scICBxdOqGHHt11P20c8Xc+iWz13d1g2g4KrVgZQBHdonpyeVciuZUyRQCdZ?=
 =?us-ascii?Q?sXOALbgyq6xSHw+J//dS9lrhFo7l6decOGJE2lYmlS9WBhyUi8vt7FTmrWFQ?=
 =?us-ascii?Q?AX2GwO39XeOJG3bE8OSMefm3xz3tpbI4MvyjtOnyd66yAAtZe7caZgvCUL7w?=
 =?us-ascii?Q?8UbQMaLCpsqAelCr5ReADoQBxiBbk8JOJS3ItyORrg0EPOzBPos+RPg7Q9JI?=
 =?us-ascii?Q?T67m4+G9WTQ9l86nY/QxOKo3A0z/zpNKU7BmQlkOuFB2YkUuohJQl876NVFf?=
 =?us-ascii?Q?COMmDd8jHptdEr0ftUVfXIHK7+ytGIFlEugPc81NDBD3Ds0BckSW1IoOPGqI?=
 =?us-ascii?Q?F2Uo8uha7JUcbm2XugR8TgFaTXYwN/346bIOZmxGkrf9vBtGlNY+v46EBp7I?=
 =?us-ascii?Q?75E12uD5PVGkcZs0LF6OSfajWB41/GTqnlABcFsjX5nuakFNBiSPNUusuD/B?=
 =?us-ascii?Q?4Z9TGU7bmX1KGK+46QJi8ZOU0Y/yTjzTJEfTGRFwd648n2naOcZmz7IeIkOx?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LDIgvnqnqEFES4JZU5rSiniqleziRJc/hPO5b+xlo8pxt6EHhUkU5pZvnbdT9l0Oomckg442exkspPc+tGr5es54CBEVVu7S/nWoLRTGpaLUXYQU+efMlMGELBVSyi3mcgA4nHcp1JjiJ2ypzssm0rT/i+Bxq/yZGD2MG3dKiD+Nxp5+8hcKLT1e3KhKJUm7eOfKyp9tvVow59rgOzoPlYM3Zx42zHAbzB/tbDBRUwogMCGOATOdrUoOq39XF1DR1F7gO8OTLESwN20crz12LMpNrLm6Oe02nlvVsfWpmWX7j+Wg1Eilp7mZ011itbweIzPpKks42zfrRBlwqhWAbeXBkhhn7D+6XiI+rLP6zWRu46ih+G9rLl+ULRnNy+pjw0wZ4JF+XAvZBwcFF4GrPrUDo6p6PKt1aDTh+ONqmmjEGW/A012E75AqKYZMEVDMsGY5xfLsXYJoTgll4FdLBQa2qPeCng52FiM52kyfzmrMUC+UVPmR8TDdLjtdcVUQjwlksQBbfQ2NfeiFT5OUZHtTyHTuwAmA0svHLKaECmThcD/dDW3Z9Umwh02NaSCE5mSytuzDqtbgYaMfHbo+guVuUmJbPkhRZ+3cXfpz1QQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef646c0f-4bf6-44a7-3bb8-08dda58a9ff5
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:14:56.5567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW48+DLJ7ZdKhWnKIVr7IvuM2dBdvkhnQAvztZCfTcEboExlUP6xpU2XyHTzUIF2XlMkjjjo1t5OpSGT6iHexw4xHqlrxTGy9zaD11LIHAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843d8e5 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=7mOBRU54AAAA:8 a=6fEu2DfWyTV9D_SmYkEA:9 a=wa9RWnbW_A1YIeRBVszw:22 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: EgMu52IXY0ymU7iMW2UnjID6mOdxfLej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX/ss/YXXHs2Ca 5zeUbSQ83s3mdhdHNaySYJXJ04yezowiwyomysoKcW3HHLMPWSIpZ7tX9am4VfI9raCDwWHaboV Z4sCX7qqr+zuBcgzSI2s8i14WG/w6ISzqaWzfaj7n35Y3lu6i7IgfvL8HsYT6npILJSBp6G0KhE
 kdlvZfBYteCqv3N+u7850xBH9qrTO4B/Rkg59C2AAZ1vyu1trp9ZbubDmSXinL9Vkmou3HHvHrO VUZOlOd77yLEzveHE9faHBsV9Z1X75QLl64ljJvvnyCCByEWJ8n/LgGgn4t+1/nPDXl9Dc8FAZO +n9f/DrYPB2y5NaEVQeogZu9M5r0RtcWaCvftns2dt5250XAkuDgsDBIZtMoNAf9IozyUa+495f
 DBPn3MoCmxjCyGX3iTmTM5Jc12ZbsFHIZD9k5hDA1BZsMW2jPsVgRq+vFDhbCrupHY22hxW7
X-Proofpoint-GUID: EgMu52IXY0ymU7iMW2UnjID6mOdxfLej

Bug: https://github.com/oracle/dtrace-utils/issues/75
Signed-off-by: Sam James <sam@gentoo.org>
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 runtest.sh                                           |  5 +++++
 .../expensive/locking/tst.DestructionDoubleUnlock.sh |  3 +--
 test/internals/headers/tst.header-endianness.sh      |  3 +--
 test/stress/options/tst.cpu-syscall.sh               |  4 ++--
 test/unittest/aggs/tst.aggmod_full2.sh               |  3 +--
 test/unittest/arrays/tst.uregsarray-check.sh         |  3 +--
 test/unittest/bitfields/tst.bitfield-offset.x        |  8 ++++----
 test/unittest/builtinvar/tst.errno3.sh               |  3 +--
 test/unittest/builtinvar/tst.tid_pid.sh              |  1 -
 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh  |  3 +--
 test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh  |  3 +--
 .../unittest/dtrace-util/tst.ListProbesModuleUSDT.sh |  3 +--
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh  |  3 +--
 .../dtrace-util/tst.ListProbesProviderUSDT.sh        |  3 +--
 test/unittest/fbtprovider/tst.entryargs2.sh          |  1 -
 test/unittest/funcs/copyout/tst.copyout.sh           |  4 ++--
 test/unittest/funcs/copyoutstr/tst.copyoutstr.sh     |  4 ++--
 test/unittest/misc/tst.include.sh                    |  3 +--
 test/unittest/options/tst.cpu-syscall.sh             |  4 ++--
 test/unittest/options/tst.ctypes.sh                  |  8 ++++----
 test/unittest/options/tst.dtypes.sh                  |  8 ++++----
 test/unittest/options/tst.linktype.sh                |  5 ++---
 test/unittest/options/tst.strip.sh                   |  5 ++---
 test/unittest/pid/tst.dash.sh                        |  4 ++--
 test/unittest/pid/tst.offsets.sh                     |  6 +++---
 test/unittest/pid/tst.provregex1.sh                  |  6 +++---
 test/unittest/pid/tst.provregex2.sh                  | 10 +++++-----
 test/unittest/pid/tst.provregex3.sh                  |  6 +++---
 test/unittest/pid/tst.provregex4.sh                  | 10 +++++-----
 test/unittest/usdt/tst.allargs.sh                    |  3 +--
 test/unittest/usdt/tst.badguess.sh                   |  3 +--
 test/unittest/usdt/tst.badguess.x                    |  2 +-
 test/unittest/usdt/tst.dlclose1.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose2.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose3.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose4.sh                   |  3 +--
 test/unittest/usdt/tst.eliminate.sh                  |  7 +++----
 test/unittest/usdt/tst.enable_pid.sh                 |  7 +++----
 test/unittest/usdt/tst.enabled.sh                    |  3 +--
 test/unittest/usdt/tst.enabled2.sh                   |  3 +--
 test/unittest/usdt/tst.entryreturn.sh                |  3 +--
 test/unittest/usdt/tst.exec-dof-replacement.sh       |  3 +--
 test/unittest/usdt/tst.execstack.sh                  |  5 +----
 test/unittest/usdt/tst.fork.sh                       |  3 +--
 test/unittest/usdt/tst.guess32.sh                    |  3 +--
 test/unittest/usdt/tst.guess64.sh                    |  3 +--
 test/unittest/usdt/tst.header.sh                     |  3 +--
 test/unittest/usdt/tst.lingering.sh                  |  3 +--
 test/unittest/usdt/tst.link-idempotence.sh           |  3 +--
 test/unittest/usdt/tst.linkpriv.sh                   |  3 +--
 test/unittest/usdt/tst.linkunpriv.sh                 |  3 +--
 test/unittest/usdt/tst.manyprobes.sh                 |  3 +--
 test/unittest/usdt/tst.manyprocs.sh                  |  3 +--
 test/unittest/usdt/tst.multiple.sh                   |  3 +--
 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh  |  3 +--
 test/unittest/usdt/tst.multitrace.sh                 |  3 +--
 test/unittest/usdt/tst.nusdtprobes.sh                |  6 +++---
 test/unittest/usdt/tst.onlyenabled.sh                |  3 +--
 test/unittest/usdt/tst.pidprobes.sh                  | 12 ++++++------
 test/unittest/usdt/tst.pie.sh                        |  3 +--
 test/unittest/usdt/tst.reeval.sh                     |  3 +--
 test/unittest/usdt/tst.static.sh                     |  3 +--
 test/unittest/usdt/tst.static2.sh                    |  3 +--
 test/unittest/usdt/tst.user.sh                       |  3 +--
 test/utils/workload_analyze_loop.sh                  |  4 ++--
 65 files changed, 109 insertions(+), 153 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index 15bd78fb..156e7dec 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -653,6 +653,11 @@ load_modules
 
 # Export some variables so triggers and .sh scripts can get at them.
 export _test _pid dt_flags
+export CC=${CC:-/usr/bin/gcc}
+export NM=${NM:-/usr/bin/nm}
+export OBJCOPY=${OBJCOPY:-/usr/bin/objcopy}
+export OBJDUMP=${OBJDUMP:-/usr/bin/objdump}
+export READELF=${READELF:-/usr/bin/readelf}
 
 # Arrange to do (relatively expensive) mutex debugging.
 export DTRACE_OPT_DEBUGASSERT="mutexes"
diff --git a/test/expensive/locking/tst.DestructionDoubleUnlock.sh b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
index c9b9eadc..b7118642 100755
--- a/test/expensive/locking/tst.DestructionDoubleUnlock.sh
+++ b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -28,7 +28,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/destruction-double-unlock.$$.$RANDOM"
diff --git a/test/internals/headers/tst.header-endianness.sh b/test/internals/headers/tst.header-endianness.sh
index e45cc597..227da854 100755
--- a/test/internals/headers/tst.header-endianness.sh
+++ b/test/internals/headers/tst.header-endianness.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -10,7 +10,6 @@
 set -e
 
 dtrace=$1
-CC=/usr/bin/gcc
 OLDDIRNAME=${PWD}
 CFLAGS="-I${OLDDIRNAME}/include -I${OLDDIRNAME}/uts/common"
 
diff --git a/test/stress/options/tst.cpu-syscall.sh b/test/stress/options/tst.cpu-syscall.sh
index 6fb09d48..3f6f2f48 100755
--- a/test/stress/options/tst.cpu-syscall.sh
+++ b/test/stress/options/tst.cpu-syscall.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -91,7 +91,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compilation failed
 	exit 1
diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
index 66cfc002..b87d6ba6 100755
--- a/test/unittest/aggs/tst.aggmod_full2.sh
+++ b/test/unittest/aggs/tst.aggmod_full2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -17,7 +17,6 @@
 ##
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/aggs-aggmod_full2.$$.$RANDOM"
diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
index f55d36d0..4f1aabaa 100755
--- a/test/unittest/arrays/tst.uregsarray-check.sh
+++ b/test/unittest/arrays/tst.uregsarray-check.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/arrays-uregsarray-check.$$.$RANDOM"
diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
index ae57c2b5..1f328c23 100755
--- a/test/unittest/bitfields/tst.bitfield-offset.x
+++ b/test/unittest/bitfields/tst.bitfield-offset.x
@@ -12,8 +12,8 @@
 # skip the test, since we can't possibly tell what it was
 # generated by.
 
-if ! objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
-    LANG=C objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
+if ! ${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
+    LANG=C ${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
     grep 'unrecognized option' > /dev/null 2>&1; then
     exit 2
 fi
@@ -21,7 +21,7 @@ fi
 ctfa=$tmpdir/vmlinux.ctfa
 trap "rm -f $ctfa" EXIT ERR
 
-objcopy --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
+${OBJCOPY} --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
 
-objdump --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
+${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
     gawk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
diff --git a/test/unittest/builtinvar/tst.errno3.sh b/test/unittest/builtinvar/tst.errno3.sh
index 7546152f..d1bcde39 100755
--- a/test/unittest/builtinvar/tst.errno3.sh
+++ b/test/unittest/builtinvar/tst.errno3.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/builtinvar-errno3.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
index 7ff0227f..e367411d 100755
--- a/test/unittest/builtinvar/tst.tid_pid.sh
+++ b/test/unittest/builtinvar/tst.tid_pid.sh
@@ -7,7 +7,6 @@
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/builtinvar-tid_pid.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
index 737f2cc8..945d2188 100755
--- a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -20,7 +20,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index f8083f2c..e7af9da9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index dc6cb100..f66d6cbd 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-module-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index 59b8dca5..9f6ca8ba 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 64fc185d..be6d87be 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-provider-usdt.$$.$RANDOM"
diff --git a/test/unittest/fbtprovider/tst.entryargs2.sh b/test/unittest/fbtprovider/tst.entryargs2.sh
index f5b435f5..4485d33a 100755
--- a/test/unittest/fbtprovider/tst.entryargs2.sh
+++ b/test/unittest/fbtprovider/tst.entryargs2.sh
@@ -9,7 +9,6 @@
 #
 
 dtrace=$1
-CC=${CC:-/usr/bin/gcc}
 
 # Set up test directory.
 
diff --git a/test/unittest/funcs/copyout/tst.copyout.sh b/test/unittest/funcs/copyout/tst.copyout.sh
index 748b138b..9553938b 100755
--- a/test/unittest/funcs/copyout/tst.copyout.sh
+++ b/test/unittest/funcs/copyout/tst.copyout.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -31,7 +31,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo "compilation error"
 	exit 1
diff --git a/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh b/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
index d98897fc..284478b0 100755
--- a/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
+++ b/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -42,7 +42,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo "compilation error"
 	exit 1
diff --git a/test/unittest/misc/tst.include.sh b/test/unittest/misc/tst.include.sh
index 9d9989a3..4cdacfe9 100755
--- a/test/unittest/misc/tst.include.sh
+++ b/test/unittest/misc/tst.include.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIR="$tmpdir/misc-include.$$.$RANDOM"
diff --git a/test/unittest/options/tst.cpu-syscall.sh b/test/unittest/options/tst.cpu-syscall.sh
index 401839d5..4fb58c35 100755
--- a/test/unittest/options/tst.cpu-syscall.sh
+++ b/test/unittest/options/tst.cpu-syscall.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -91,7 +91,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compilation failed
 	exit 1
diff --git a/test/unittest/options/tst.ctypes.sh b/test/unittest/options/tst.ctypes.sh
index 30a6c9b1..767de0db 100755
--- a/test/unittest/options/tst.ctypes.sh
+++ b/test/unittest/options/tst.ctypes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/ctypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
+if ${OBJDUMP} --help | grep ctf >/dev/null; then
+	${OBJCOPY} --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from ctypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/ctypes.o | \
+	${OBJDUMP} --ctf=.ctf $tmpdir/ctypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "C CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.dtypes.sh b/test/unittest/options/tst.dtypes.sh
index 441de098..ac6a8036 100755
--- a/test/unittest/options/tst.dtypes.sh
+++ b/test/unittest/options/tst.dtypes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/dtypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
+if ${OBJDUMP} --help | grep ctf >/dev/null; then
+	${OBJCOPY} --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from dtypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/dtypes.o | \
+	${OBJDUMP} --ctf=.ctf $tmpdir/dtypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "D CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
index 564d9b0f..7298d67a 100755
--- a/test/unittest/options/tst.linktype.sh
+++ b/test/unittest/options/tst.linktype.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,6 @@
 # @@nosort
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/linktype.$$.$RANDOM"
@@ -61,7 +60,7 @@ function mytest() {
 	fi
 
 	# report whether the file format is recognized
-	objdump --file-headers prov.o |& gawk '
+	${OBJDUMP} --file-headers prov.o |& gawk '
 	    /format not recognized/ {
 		print "objdump does NOT recognize file format";
 		exit(0);
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index 054955fb..f7960d7a 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/strip.$$.$RANDOM"
@@ -48,7 +47,7 @@ fi
 
 # link with and without -xstrip, dumping the DOF section
 
-objdump="objdump --full-contents --section=.SUNW_dof prov.o"
+objdump="${OBJDUMP} --full-contents --section=.SUNW_dof prov.o"
 
 $dtrace $dt_flags -G -xstrip -s prov.d test.o
 if [ $? -ne 0 ]; then
diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
index f364e3e3..0289b609 100755
--- a/test/unittest/pid/tst.dash.sh
+++ b/test/unittest/pid/tst.dash.sh
@@ -54,7 +54,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compile
 	exit 1
@@ -66,7 +66,7 @@ for func in foo0 foo1 foo2 main; do
 	# For each function, get the absolute and relative
 	# (to the function) address of some instruction in
 	# the function.
-	read ABS REL <<< `objdump -d a.out | awk '
+	read ABS REL <<< `$OBJDUMP -d a.out | awk '
 	  # Look for the function.
 	  /^[0-9a-f]* <'$func'>:$/ {
 
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index cc1a440d..23aad620 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -54,7 +54,7 @@ main(int c, char **v)
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR in compiling
 	exit 1
@@ -85,7 +85,7 @@ fi
 # hot and cold instructions in the function.
 #
 
-objdump -d a.out | gawk '
+${OBJDUMP} -d a.out | gawk '
 BEGIN {
 	pc0 = 0;	# First PC of loopfunc()
 	pcjump = 0;	# PC of the jump
diff --git a/test/unittest/pid/tst.provregex1.sh b/test/unittest/pid/tst.provregex1.sh
index c672b23f..5bc0bd51 100755
--- a/test/unittest/pid/tst.provregex1.sh
+++ b/test/unittest/pid/tst.provregex1.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o
-	cc -o main main.o
+	$CC -o main main.o
 
 main.o: main.c
-	cc -c main.c
+	$CC -c main.c
 EOF
 
 cat > $DIR/main.c <<EOF
diff --git a/test/unittest/pid/tst.provregex2.sh b/test/unittest/pid/tst.provregex2.sh
index 305aafe9..890836d9 100755
--- a/test/unittest/pid/tst.provregex2.sh
+++ b/test/unittest/pid/tst.provregex2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -24,16 +24,16 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o
-	cc -o main main.o -ldl
+	$CC -o main main.o -ldl
 
 main.o: main.c
-	cc -c main.c
+	$CC -c main.c
 
 altlib.so: altlib.o
-	cc -z defs -shared -o altlib.so altlib.o
+	$CC -z defs -shared -o altlib.so altlib.o
 
 altlib.o: altlib.c
-	cc -c altlib.c
+	$CC -c altlib.c
 EOF
 
 cat > $DIR/altlib.c <<EOF
diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
index 41210ff0..bc7908eb 100755
--- a/test/unittest/pid/tst.provregex3.sh
+++ b/test/unittest/pid/tst.provregex3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o prov.o
-	cc $test_cppflags -o main main.o prov.o
+	$CC $test_cppflags -o main main.o prov.o
 
 main.o: main.c prov.h
-	cc $test_cppflags -c main.c
+	$CC $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace $dt_flags -h -s prov.d
diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
index 5aa38fa9..0e405d3a 100755
--- a/test/unittest/pid/tst.provregex4.sh
+++ b/test/unittest/pid/tst.provregex4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -25,10 +25,10 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o provmain.o
-	cc $test_cppflags -o main main.o provmain.o -ldl
+	$CC $test_cppflags -o main main.o provmain.o -ldl
 
 main.o: main.c prov.h
-	cc $test_cppflags -c main.c
+	$CC $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace $dt_flags -h -s prov.d
@@ -37,10 +37,10 @@ provmain.o: prov.d main.o
 	$dtrace $dt_flags -G -o provmain.o -s prov.d main.o
 
 altlib.so: altlib.o provalt.o
-	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
+	$CC $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
 
 altlib.o: altlib.c prov.h
-	cc $test_cppflags -c altlib.c
+	$CC $test_cppflags -c altlib.c
 
 provalt.o: prov.d altlib.o
 	$dtrace $dt_flags -G -o provalt.o -s prov.d altlib.o
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index 179552b6..ca2d7188 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-std=gnu89 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
index b6ff9e23..6cd959bb 100755
--- a/test/unittest/usdt/tst.badguess.sh
+++ b/test/unittest/usdt/tst.badguess.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.badguess.x b/test/unittest/usdt/tst.badguess.x
index d92f8bff..b4030d55 100755
--- a/test/unittest/usdt/tst.badguess.x
+++ b/test/unittest/usdt/tst.badguess.x
@@ -4,4 +4,4 @@
 #
 # If we can't compile a trivial 32-bit program, this test
 # will fail.
-echo 'int main (void) { }' | gcc -x c -c -o /dev/null -m32 - 2>/dev/null
+echo 'int main (void) { }' | $CC -x c -c -o /dev/null -m32 - 2>/dev/null
diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
index a6bad02b..6e2c0da7 100755
--- a/test/unittest/usdt/tst.dlclose1.sh
+++ b/test/unittest/usdt/tst.dlclose1.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -29,7 +29,6 @@
 # The second should not.
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose1.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
index 907685a6..88779fc5 100755
--- a/test/unittest/usdt/tst.dlclose2.sh
+++ b/test/unittest/usdt/tst.dlclose2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose2.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose3.sh b/test/unittest/usdt/tst.dlclose3.sh
index 0b70906f..bcc1e0ed 100755
--- a/test/unittest/usdt/tst.dlclose3.sh
+++ b/test/unittest/usdt/tst.dlclose3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -21,7 +21,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose3.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
index a84e3460..9e1a11c4 100755
--- a/test/unittest/usdt/tst.dlclose4.sh
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ PATH=/usr/bin:/usr/sbin:$PATH
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.eliminate.sh b/test/unittest/usdt/tst.eliminate.sh
index e74896bb..e9fbf5e9 100755
--- a/test/unittest/usdt/tst.eliminate.sh
+++ b/test/unittest/usdt/tst.eliminate.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 # @@xfail: Linux ld does not seem to support STV_ELIMINATE
@@ -16,7 +16,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
@@ -71,13 +70,13 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-nm test.o | grep \$dtrace > /dev/null
+${NM} test.o | grep \$dtrace > /dev/null
 if [ $? -ne 0 ]; then
 	echo "no temporary symbols in the object file" >& 2
 	exit 1
 fi
 
-nm test | grep \$dtrace > /dev/null
+${NM} test | grep \$dtrace > /dev/null
 if [ $? -eq 0 ]; then
 	echo "failed to eliminate temporary symbols" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 207184d4..7f4f6869 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ PATH=/usr/bin:/usr/sbin:$PATH
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-enable_pid.$$.$RANDOM"
@@ -120,7 +119,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-cc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
@@ -130,7 +129,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+$CC $test_cppflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.enabled.sh b/test/unittest/usdt/tst.enabled.sh
index 4cd1eccd..a180f962 100755
--- a/test/unittest/usdt/tst.enabled.sh
+++ b/test/unittest/usdt/tst.enabled.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
index 1732085e..b174ef4c 100755
--- a/test/unittest/usdt/tst.enabled2.sh
+++ b/test/unittest/usdt/tst.enabled2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index 84af9672..03418e7b 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ fi
 # @@xfail: dtv2, no wildcard usdt probes yet
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index 6d547cce..b7ec5f2d 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.execstack.sh b/test/unittest/usdt/tst.execstack.sh
index e7b59105..42da7035 100755
--- a/test/unittest/usdt/tst.execstack.sh
+++ b/test/unittest/usdt/tst.execstack.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,11 +11,8 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
-OBJDUMP=/usr/bin/objdump
-READELF=/usr/bin/readelf
 
 DIRNAME="$tmpdir/usdt-execstack.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.fork.sh b/test/unittest/usdt/tst.fork.sh
index 9b2b372a..e82463f9 100755
--- a/test/unittest/usdt/tst.fork.sh
+++ b/test/unittest/usdt/tst.fork.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/tst.guess32.sh
index 7a130e17..21961236 100755
--- a/test/unittest/usdt/tst.guess32.sh
+++ b/test/unittest/usdt/tst.guess32.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess64.sh b/test/unittest/usdt/tst.guess64.sh
index 23b7a241..417dcec9 100755
--- a/test/unittest/usdt/tst.guess64.sh
+++ b/test/unittest/usdt/tst.guess64.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.header.sh b/test/unittest/usdt/tst.header.sh
index c5e411be..521e9fd1 100755
--- a/test/unittest/usdt/tst.header.sh
+++ b/test/unittest/usdt/tst.header.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.lingering.sh b/test/unittest/usdt/tst.lingering.sh
index 079acb75..148345cf 100755
--- a/test/unittest/usdt/tst.lingering.sh
+++ b/test/unittest/usdt/tst.lingering.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.link-idempotence.sh b/test/unittest/usdt/tst.link-idempotence.sh
index 643ba10c..caa49533 100755
--- a/test/unittest/usdt/tst.link-idempotence.sh
+++ b/test/unittest/usdt/tst.link-idempotence.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index 2c89f5d4..5f637e85 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-std=gnu99 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index 9ef38639..b00d532e 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index c0deb8df..6e894f2c 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index 58550302..e157d05a 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
index 440a7d7b..8734a110 100755
--- a/test/unittest/usdt/tst.multiple.sh
+++ b/test/unittest/usdt/tst.multiple.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
index 6595737f..2fc17e58 100755
--- a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@
 # @@nosort
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/usdt-multiprov-dupprobe-shlibs.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 262c7828..81f43f76 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index f275f921..93c56e38 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -66,7 +66,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-gcc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
@@ -76,7 +76,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-gcc $test_ldflags -o main main.o prov.o
+$CC $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
index d3487834..9db5dc46 100755
--- a/test/unittest/usdt/tst.onlyenabled.sh
+++ b/test/unittest/usdt/tst.onlyenabled.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 0c75d796..72434eb9 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -69,20 +69,20 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-cc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
 if [[ `uname -m` = "aarch64" ]]; then
-	objdump -d main.o > disasm_foo.txt.before
+	$OBJDUMP -d main.o > disasm_foo.txt.before
 fi
 $dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_ldflags -o main main.o prov.o
+$CC $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -104,7 +104,7 @@ fi
 
 # Disassemble foo().  (simplify with --disassemble=foo)
 
-objdump -d main | awk '
+$OBJDUMP -d main | awk '
 BEGIN { use = 0 }             # start by not printing lines
 use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
 use == 1 { print }            # print lines
@@ -112,7 +112,7 @@ use == 1 { print }            # print lines
 ' > disasm_foo.txt
 if [ $? -ne 0 ]; then
 	echo cannot objdump main
-	objdump -d main
+	$OBJDUMP -d main
 	exit 1
 fi
 
@@ -277,7 +277,7 @@ done
 
 pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
 
-objdump -d main | awk '
+$OBJDUMP -d main | awk '
 /^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
 /^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
 ' > return_func.out
diff --git a/test/unittest/usdt/tst.pie.sh b/test/unittest/usdt/tst.pie.sh
index 0d62c376..a2c12a26 100755
--- a/test/unittest/usdt/tst.pie.sh
+++ b/test/unittest/usdt/tst.pie.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-fno-inline -pie $test_cppflags"
 LDFLAGS="-pie $test_ldflags"
 
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 371eee3d..069248f5 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index 81b3ba04..dd96b0ff 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index 115a9551..2606ecf3 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.user.sh b/test/unittest/usdt/tst.user.sh
index 30513acc..62489705 100755
--- a/test/unittest/usdt/tst.user.sh
+++ b/test/unittest/usdt/tst.user.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/utils/workload_analyze_loop.sh b/test/utils/workload_analyze_loop.sh
index 3bbadf78..7edce7b0 100755
--- a/test/utils/workload_analyze_loop.sh
+++ b/test/utils/workload_analyze_loop.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -13,7 +13,7 @@ if [ ! -e $prog ]; then
 	exit 1
 fi
 
-objdump -d $prog | gawk -v myarch=$(uname -m) '
+${OBJDUMP} -d $prog | gawk -v myarch=$(uname -m) '
 # decide whether to track instructions (which we number n = 1, 2, 3, ...) or not (n < 0)
 # specifically, do not track instructions until we find the disassembly for <main>
 BEGIN { n = -1; }
-- 
2.45.2

