Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968832C21C2
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757714245; cv=fail; b=r6eKeKI6az83VZK9HpYbrQoN5pm6dZztpp433xJcBIIy2IymtSZbwgMEzxFP7gnYguolPmHdPDEFqcJTWOsthL03Qt/it9l9TtjUJoI+tozwcrQ+/5kQ5zyc5I9uu4sjRj6tC7hYH0zgSFvRummO1XU67DHBwQF0rMOMq2LGzkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757714245; c=relaxed/simple;
	bh=VgwXt6rPcJyj5jBCymQQweBenxq5xi7LhsL/8p+9cDk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GEQo1RG53BECrHhfkP4U88GUxHjtRGZPTsBaWJcCmtOiNjXbmrIKcxecwps+xhEnwYqozQzZJXJEC6TcRGrRRdjlCIu3i7rGMnZx72t8t0yA52cgeI905sDPsYZlK2oJp4aJ/iXKZDLpgAeJKv+sRUUO5rPXYN48p+Ig7NQHHDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hyWBOY7i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GXEpFI+E; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hyWBOY7i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GXEpFI+E"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CLgD3r025147
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=nDP35dVVxX/OnxL4
	7mECo7yLR49wXC+EmmAxGswHzPk=; b=hyWBOY7iLaESyaqpEv5Tz9Oa3SJonh/a
	qgcv3JT/k0OoeT3VSRrlN6fwC+NYcKGq4OZQYgn9zpPHmuRUqh4VH8qrVLYx2Sox
	V9VWeYDlgIjJPqV8OheLa9hBzBwl1ZYJFUR+rtDLjpMqnXBJf9eRkCcUwrhrhuxQ
	Mr50xZZQh4utTmBf0GOJcW5cvpGJpzLQErQfe/owVmS7rMSZtYb0Jor3LYq9vUHw
	92krciqiIpHonjJrzCuwEgioDf14RMTbe9K8T+oIDQrQTvwKoEinxU84ovpseVW8
	JiW2IRVAGhTvlyrWMYRubK7r5/u5ZEKhUgP17jaSPsDs42tE4ne6xw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49226t12wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CJp4Qo013674
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:21 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bdekkvt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnrmQS37/zGASijo/tDlDaoqJZD5iQ/4gN/tkuenEdrBErafoREgU9ADFQ5ofHA+eMiUjM5Xv86mGE4o9ftV7pThm2QqaWLXyQUgbC6L+DfaSTvra0+I209JE0FkJ3NOp/MFnRa+r8nGfNwRsFy+cszcE/LD0j3kUk5ASP8lgxkYeTzL7lIsK4nKlHHuIvcKcG951l6clFbitgA9WBKBjsEkMSZeybjAdNJttGU5F+h1PIQtX1il2SP+4hhhnZyWqJok3UI+TaLRZU7Vqou6OW5vmGGJGD4BAM1BScJ03zJHHj0vPBx0ns8mz6UWzT6wsmlkjWDiMo4uKZpmIas/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDP35dVVxX/OnxL47mECo7yLR49wXC+EmmAxGswHzPk=;
 b=YAuzyaBpFtsJdif5RHNWxF7a511Ln8k4UO3zlykJ4JeLwdfHOY/Hd/6gJtDJPte9Ep+YNePECEkjJxCVw1VSA/MkDx6je6E5tk2uUNiwd4ZEH+k0BpsOWrmxU+Dz/neMjP/SMcb/oAxob+HhGgoyQFZApy9oQqiTCeDlDi7wrRcGZpoFqslSUe+zSB3QmpDfWSm7O/fqzv5ZFyN+CioP2QNocZYUSAI8THrkMfySYDwwistydiBjByHBsrqS8FPzC2CAQepykYH9CZEFdER4rj/MBOKEIxTfC2uXRG6JLr5hNXmQKuDqDH+Ie6HNWkg7OAhz/sIcNDReqHOOmiPuLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDP35dVVxX/OnxL47mECo7yLR49wXC+EmmAxGswHzPk=;
 b=GXEpFI+EMKJy8rGRndtOEeXIZQEPhC2OfYCBS+NTnknSXJVdUm52RpbhZ783APKTTjD7IbXnXv8nXeiFiFw9aWpbASi3p8ejTqKn2ctkZ2h1ixBSuAJuhjh3SPrB0wYvpbBCHk8/UNoKzcYISP8hDJjQUJvK8lJbIskAcac/j0A=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH3PPF63308C95B.namprd10.prod.outlook.com (2603:10b6:518:1::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 21:57:19 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 21:57:18 +0000
From: Elena Zannoni <elena.zannoni@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH 0/1] Fix doc directory cleanup
Date: Fri, 12 Sep 2025 15:56:57 -0600
Message-ID: <20250912215706.1109973-1-elena.zannoni@oracle.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH3PPF63308C95B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e56da85-b4b3-4ff6-3473-08ddf24756f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MT6GZOLDh02P1IzSuuQEOK+jcYUYtLP0R1daeHAV+u79ZS/acAvdZFbDuGL0?=
 =?us-ascii?Q?ZflRvADWRIUUcWGhR0rnlYjSOu0RFsuO4e4Djr41M8Q0v9yT1uZBZCm0iYOX?=
 =?us-ascii?Q?gXeKQUnkL9LkvHyltAtewYDGbVEhHVf3M1ALyQWyzeYcAXIWTGLp8FywsH8j?=
 =?us-ascii?Q?Yn4PwXMs0GjjxxAMAtjY6qzUuPrVez7jUy8q7PSGLgH9yjFLSUctVsIgW8JK?=
 =?us-ascii?Q?j8LcMsMkOYnyrERhOlTNI+3fKU+4+c8eZ0VCCP3R7pcQfR4MO9bIgonMIbc8?=
 =?us-ascii?Q?Nbu6MOB28o8IzUBAPXiszypeQsG/4ag7fMBqlSIaHWFnytpcBGEjCWECdtja?=
 =?us-ascii?Q?DloM3Xfp02ZDSr2IonhaN1mSOB3GHwf5RuXFP4lu8d5IS8YTZR6VsikQwsll?=
 =?us-ascii?Q?XPcFqODliqbClBJVu6zVLdn2DvwmdCUeDBPitivibY0xMjV8DxMhWtUCmUKO?=
 =?us-ascii?Q?xh1CnDEKeUOXPFOzQwiUQEWOxcqp+JlmV+ZnHkqtV05DLwqCuVt7TtMPBSR4?=
 =?us-ascii?Q?81lUxvFkUNl8p99irDRRAhQRYaoo3C34YsjkoUqTlUi+A3EqHDCz3s+g3pMr?=
 =?us-ascii?Q?FzphGz3MGHu/2YvksW4iw/HPq0E/5chazIIAqEbvJs9AQopDgGIaxqr47+1L?=
 =?us-ascii?Q?znqPzMmag7qqu+RH2MEXBXcC9GUyaLsu53olgmk41bHPXQkMr0CO9yKtAryj?=
 =?us-ascii?Q?qJrArjbCLSq4B0yLXtlnIoPNFypB0lHW4fVhq3hpVj8NmPqiVD1f+yl/4xXu?=
 =?us-ascii?Q?kN22TBMKO5S3I/XCFwwOH1MT0Wma/icfc9eLAO8WoqW3PQJCZhJBKJaBp/p0?=
 =?us-ascii?Q?2PUxj/9e1XIHvqr2nuJ/rxM4ECDcehMHNsDRH6W3+vaCbGqXtiZ1BbwB8wOH?=
 =?us-ascii?Q?6AXJeh4O2mGabOm9XWlBfxIvu47vCYXT0pNXvWtCH5MDqM+M6nhafrQ1gAkZ?=
 =?us-ascii?Q?syexIjrkUqZbRU7d1R7Adfuh6ixYhWmZerPc6iQ9u1ne8mEVW2B4vKbjTSg0?=
 =?us-ascii?Q?B/epQxd62fuu8AscoHSYUeyyNdesbOo9GUkzHmqODC/JBFDS/nA6b/VFNQzy?=
 =?us-ascii?Q?7blnty3LEw5Cs+dZQBwXPBepcWs/rhLXlpedsuckxA/7Cn/MvFrDJvd54MDD?=
 =?us-ascii?Q?qgzE4UQb/ds9fg4XscXKBHI4bfdLKcJ1qmp1283e689yx9OqpGW86tznVIgF?=
 =?us-ascii?Q?kDteByeI2TwLptEuGXOMdk1+wyKdHTer9ztkmYrUuHYEYoAUqPbyntWTWs+c?=
 =?us-ascii?Q?lGgt/+IjUOkUI9d7RK2G/+G16ETiQh3SWXJIB3vMj9ntSXh+qVjC/aVopCBc?=
 =?us-ascii?Q?y4tIYu3FpkiImiR4C42zeCMPynYbnHPjl9HLwLORaUocSTR+elAsLxMueppr?=
 =?us-ascii?Q?2ryu/iOa5uLj/OiaQcT/9YwtkS7mo/vu5hieIOvLpx10mXFo/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tu3PcuZOwLLiejJhG9jaCDYlz6+dAzSSlUFeDYda7DdncT2iF7akxTTcELpp?=
 =?us-ascii?Q?JdqfC++5tkhHH70IcM1sUSoQYnFup8JCXUXpaUOuhQNbTrPY4fAw3+vIMuvr?=
 =?us-ascii?Q?Ba8y6hOgbkmcWmXBKGnBqbMpQ0T1qrPQpHecwAcGHlZQJ/cEhPD1mseVUEeI?=
 =?us-ascii?Q?aWjslje0RFYLJfTrQ6eHFyAmKJZ3/egS+Gu5AAnVk3yjBgCQqsGoEUvS+rth?=
 =?us-ascii?Q?6vux0Pr796ms8OZr7CJWXwUCFvx58DWS5p2QQzuq3P3hXxKr1YIU2JKfJfe9?=
 =?us-ascii?Q?lRkbvDx0iT7wbu742I138Q802Pg/z5dVH2F1H+q466z5XC66u/M4GwfG+y+r?=
 =?us-ascii?Q?w6cp8fcersQinMsrAcV0MtMjjaRV/avg0kJCVKxh04Th4wf9ZkIo3zHweM2f?=
 =?us-ascii?Q?7wRNFe5FptK5ZKSq7kR8YN2Ue1ci4XVAotM1lYHRCjyi12LD277DvAgX+Li8?=
 =?us-ascii?Q?x2wEgEEH7iqLNd8gbijYKkeLBahdfsrBUx7RcvxgxlXCDEXjt6lGr0DrDliz?=
 =?us-ascii?Q?yoAb1yxlyZXNjsixS+1Q2PyRtE1sUxiS+PUyj4dQDQvrPQQzZdqOcIPAolxW?=
 =?us-ascii?Q?cHnS/mYi3wptD/cm/dRbVpVIx1bqfOaWfUYqatUWnWctLo5/ZfzGV4+QFq59?=
 =?us-ascii?Q?k9jTSpOnR9rCjG/KDmF+Te6XctH2WlIzMLxRL7wh+p1EZGFy8ZjfNnoz8rCp?=
 =?us-ascii?Q?vtnaFgyMesipeLj+PNH9VNc494s0z0MEex9ObZTDA7k/Ne08vR/Tr855g5fL?=
 =?us-ascii?Q?QlOFQI+6BYJ+ZFuYsPNLnXyldnuUqp2VXLTZj0ZeUTXwl183zDwxu1LdbyIW?=
 =?us-ascii?Q?hR0I6LKxaaOVv6PbsKC0fS7QNYYLCqq+ipqucDI7wqHQEMv8iy2oUfFvRSAB?=
 =?us-ascii?Q?HnrzUW1cAFzkVta1KFkVM3QkC9LH5693o3UpGMfM+BJfIDjUraXTbKRTbfBH?=
 =?us-ascii?Q?4AqAPIsod7Q9SX6F0FiDOwus+uQYaxjsPVEdMCkpVkUkSpeMfFhrfIFw1T2L?=
 =?us-ascii?Q?aYt7NZ4PO6QJPPAXd1U7KQxzc5/0r45yh5IWuZhutaz/aUu2jc9dN+YObWGp?=
 =?us-ascii?Q?BamFGzDCFUC7iasCEB/jzaGJg3S3rfLSDKFRqoyAtF0dIHQ2GreX4Ca20DIv?=
 =?us-ascii?Q?XSjI2+mm+Mtly+fLMwyuAG7TmVdjgA6mMGw/h3Yc4Y08r4D6IH1l1fsTL9P8?=
 =?us-ascii?Q?aJrFEHpfgjAdIaJek5TMA1X8GijXRkTzVhWBu8oqr8mVU4RtOt+8u1SpunxZ?=
 =?us-ascii?Q?Ou3lU0hVV+kGGcNJGs5tZDBFSdr4wdfF1geSaYEb4HlzTgMArqe7MjKkHPs5?=
 =?us-ascii?Q?Za7ZpdwpIfC+3kryYDB/2W0RvAKX2CnnkKU+ZrKSvHnw/yETbxVknZH2QkuB?=
 =?us-ascii?Q?dahq7JiQmdC84HiBilcySZyHSK8h+66PvpWewd2psXdmJbyjR70wIEwusCUM?=
 =?us-ascii?Q?54CgRPLYcq6Hwv5bB4OvPldennNcTxf+3WvBQKUw6AVR+J3lkpqZyjmfxfrE?=
 =?us-ascii?Q?IOgLSmE2OvaKoNlK4h7Ks8XEOycgP/CWzUeXfHqFxVSb1IP0n75JBu07LE49?=
 =?us-ascii?Q?Ym2KMs3fEkkq01CR4a22GFHGvdpBG3z54QWNs6P+dvtRw8MxgfW1woSF3paV?=
 =?us-ascii?Q?SkXEoqmLSTq5WsVbDoYIVe4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rY7n+GsmieRAyBNzR4SPvn1T4JckU43ZKjujHo/9byEK6V1XEpDxX+0p5udd4+rbvk+iUa2RXf7SUT/cbseh7OzAVN5MriQFuQLwknChAyGBhIt3lncMKqEHId8NaKmNiCakf9Fy7tPE2SUTfCXU8rTJgMCKBmo35DGxbJa5DXkf7fhFRCKWEKTTkLnT6lEn4ohfEQWUPTuESPI7Jc9+iMEY/trjrV8GuiDt/tI877sdxW6rX7fEL+xP936EKu7raM1fSe8Xyb41XnRH4oOUJqLULr2MBM6CfGM7pxLRlXiDkn8efOSpLZiOEAzX82faBiO7v1PqBpzwdpNd/+UWLCjfk8aPfqC735NhD/A52xm2uwg6+0uodbRcNKGAVsHKucgTDsZhky9lx4xBNKY6N+krL1mNT3zqs37/1hzOx+wVxJ1wKXN8r7aX1EBnKX+Imr3F3ArGQWrA3PN6cLSIVp3P2JNAJzHiqgWPUqOCZ0wqhXb8PiULtcu5fp6aW0jvcfaIAIfo3SxbxdAarKIzQreKJ4fcAjMgx1z6usTnFcnel36toodFNdoR4iu2/DgNAbVQMIGVSLrF4kKUDOTa4dFAmfqTwf5BmT2/gM3QFpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e56da85-b4b3-4ff6-3473-08ddf24756f5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 21:57:18.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfvjsNbYyyqJ3sz6IIJgIyTzBVqFl2K9BS3QuUZsXW7DgKwxX1Aw6iyPcSP34a7enKc108rbuSqBubDAhlcIcqM6Xq7KOsQxmv1uzmwYh4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF63308C95B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120202
X-Authority-Analysis: v=2.4 cv=QeRmvtbv c=1 sm=1 tr=0 ts=68c49742 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=YLY-yHG4XgQwtller04A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: G1Vl8qpBKJNzYvtqCVcyWdKw7s0NvYcJ
X-Proofpoint-GUID: G1Vl8qpBKJNzYvtqCVcyWdKw7s0NvYcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1OCBTYWx0ZWRfX2xMxcfC858ZS
 Z3w07vibS7oY6iMpm4tGrT1c+IX3zu0+6kz3lKmDB+ChiUnudG+JFtiBETHWUHyeeOKLqlF81gj
 ZmJva0+7ivs5CVwpsB4Tb8ZgfDommH22V6mww72zjq4ryRGod4d3YaAc2T0N3a4dAyjYpZDMD/6
 jy0c8KupgQgf6eNChifXbNpbW9lyeeF/vHHrMtYpct5j1z1QpmnErs3aLuPUVuKVjBhCR76K3A1
 KLNcExiB+FvXtf5SHwQ9cS69nNQ0DHnxVXjX8F6UtGnLk9RKsFvnxO/35gwA6kPbTLVqFVZpAo7
 Uvqmtz+n9pYGIpDGoTulg+LJjzJ40VHeBKTLD4F0aDBu5BYFDxMbftUn2wU+ypcU46bNAMCVyWJ
 WXFcXOJI

Currently, uninstalling the dtrace RPM leaves an 
empty doc directory behind. Such as:

$ ls /usr/share/doc/dtrace-2.0.3/
INCOMPATIBILITIES  NEWS  README  showUSDT
$ sudo rpm -e dtrace-2.0.3
Removed '/etc/systemd/system/basic.target.wants/dtprobed.service'.
Removed '/etc/systemd/system/basic.target.wants/dtrace-usdt.target'.
$ ls /usr/share/doc/dtrace-2.0.3/
$

This patch changes the list of files to include the directory
itself, not just its contents.

After this patch the behavior is:

$ ls /usr/share/doc/dtrace-2.0.3/
INCOMPATIBILITIES  NEWS  README  showUSDT
$ sudo rpm -e dtrace-2.0.3
Removed '/etc/systemd/system/basic.target.wants/dtprobed.service'.
Removed '/etc/systemd/system/basic.target.wants/dtrace-usdt.target'.
$ ls /usr/share/doc/dtrace-2.0.3/
ls: cannot access '/usr/share/doc/dtrace-2.0.3/': No such file or directory


Elena Zannoni (1):
  Make sure the doc dir is cleaned up on RPM uninstall

 dtrace.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0

