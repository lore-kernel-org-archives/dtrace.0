Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277D84C83
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825296; cv=fail; b=M5xGH/g33JdPM6rX9N+JRWTJA+7XraAqoCcw+OTKYkLsdlROP73ntyzDLjhJt3flMgR4JfsI6NIi0RtbL6j5UPt28V6J3bE469oqps9uG2lHlZvPSlNsZL2tuURBhTdp4AXC0clUaDQZavMdqDvyWMMkP+YlDsA8mAab1ObWes0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825296; c=relaxed/simple;
	bh=RAV4jleXLhpxHH3kc+RYVs40cd5dbNenh4Mr//nFaUU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=az8l7SAtzWlfu1pYS3vWNtkwHznt6qErDdDJRlIzgghqyt5aSIurJlatwb65rs/FUu8uo1eEx4elRBye4tAhgE8psPgLr95RQjHkRMs8Z2JqrVjnqIfGJbHh596cGxcDUmYMvheq5hIcEF6daTzfpocnKA/PnpiqKxmIMTIzQxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VJslYO0X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZxyX+qwe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VJslYO0X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZxyX+qwe"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifdw030655
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aDE203uZDmLrbRVbKn
	QOwd0QMn6sa4awhh0Kao40Org=; b=VJslYO0XQCDCSKqpfNy50TxaV0c32AHQjG
	WeDwr5Rm2G5NxFpqAgwYH7Y5Luv2LAxP5lkmrogAwmRztO/9iPLOe5zS6N4rYx85
	n60BfQQG7+wmnMlhQr8R/mvE9QhEkFqLWBwqqxd1Q7cuZMh2avmxebrZMq7DkatL
	N/Vi+izd9L3upC6NZo/8qrMnngPaBsx/GiSlgTl6+X5mBMcqQzeJRAwlmtHhyXKD
	T8W5hADmy0R4ZL+f5r9CSJ4fUa58wNnl2s61Km0FbArTjYAi1AI+Bx/l7blZceTm
	Jfln8TWTBoDWHGNCh5KeaSfCwBNIPWXRDtCPR4fdBz/xAnpFazbA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxenc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1wdX4005009
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hm0h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQsYtOYXETeKwA7qaf1jakJ9kJl4hFPiT8PIG6gO0OpXvW1Ci6okbMuqnPCLPPu9DtORQHmTKIOMeEAgeyfbP4qxf/32my6s7mCvEZtNyy5F3ZqtYXreg+ea52BGDzmd80KtmitLJdrJ2yOHtjVaQoqGeyQegaMWI/s6SS65ivXS6NGPe3rQoOGXwMzcfA+OdCda23UJW0YoPXJh3+LpS2KrKwTklFwbTHywpsmHDUlB9ClSwmI59K6QDypT/gvJ7zNMG3tn+PMdAQ0w5YQv2kKJTSgxxK/cwEsniOUCC4bPsWywy8RStphwUSLaUpJsqOFYYEuO5ozYVGes3FaLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDE203uZDmLrbRVbKnQOwd0QMn6sa4awhh0Kao40Org=;
 b=f32AQfrBalE1szq3LNR5eio0tZxENMvtY5jNvp1blAHRNrfYBgkfiReM9+eWwxHD+DXVKsgsNzvnxGsHKOmfLNs3KBXxjuV1aI2Z2SNaV3QDiJDTr5qA/ymvI4N4KAO5xANc6OFKQssGyJ32UhA4j01I7+p6KyfeWdCHwxvTb2/YUIs78msdERnRHOpshsl7ur7MJGoOT5rANwo9Z6TcycTasPUOTvgMPOs7XTuLdJIBYydrCdfaWIabd+axIoz9Lz1DPxOIA14lheeba8aA5SP+d60FhbaEsqjl734lxOAi47RBmqGROLigrK4+Ce7M0r4zBhMyJN3I3GpZAnDIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDE203uZDmLrbRVbKnQOwd0QMn6sa4awhh0Kao40Org=;
 b=ZxyX+qweghkaGQyYwOakDP+EUl0jIEpGvFG+QOFiE9eNrmvAzLfwyrmQEZyeepGEOzcmdyjdoLNzabhd1bA7zp/TJQZYvaBbJCHu/xD8rxb71swuSxl75d7QgPzH9EWGuWUatS/zf5eEPZvKlYQwJoBmv8zPhudYvflftyHY24E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:21:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 11/14] test: caller and stackdepth tests for proc provider
Date: Wed, 25 Jun 2025 00:21:04 -0400
Message-Id: <20250625042107.13571-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 91601c04-4db7-4643-4410-08ddb39fc033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4JJN3JnR+a1Mpo5j8Q40jKbEYQ3qGCQEf3L3IN2IMoRn3byCyTXarb2TfGId?=
 =?us-ascii?Q?H4xSVY3yXVC9iRWACj9hlCznGMr4NtZHxfg8E/YrAUyjfEFnUlE/LkSA5lIc?=
 =?us-ascii?Q?PbhNTIEd3xFqAi9B+2Y1JVdo5+7NRPyU/D8I3xTG+ibs8lkWdz7RV3Zi2qWO?=
 =?us-ascii?Q?LoeHTSGkyC3m4jrAdAewG7f/eOr/U6axU0wOgsNSH3P23vdgs9wrpbEeKCyg?=
 =?us-ascii?Q?Zrn77rvuPlg29mVYbWpVG4Hj00f6cxUgz71CEWz9aPNjRRWFpsCnNWpJdu9y?=
 =?us-ascii?Q?gKI4zNkgdtxKLohTCydfVLeS/69R3sMMa6ggcZ0Zi6n2DA91r8jNh8l+6Ky7?=
 =?us-ascii?Q?HMixoUUWdSLyWBBXRqvQSiEEbNMWQPe2/iFVD81AGyv7fBYFMTM8vgCYiZ/Z?=
 =?us-ascii?Q?SafhOL6uiXRoR8AenU9mBP/WWplZuA98T0S0eyVN75BYwbfVd3SweTTte15S?=
 =?us-ascii?Q?WcNT2kMIaY0veFEBwZ9/mPK0qxjs5NXGRia2Jhb5LK/Q6X0yOJ49F90hhUrS?=
 =?us-ascii?Q?kzJNlN9ItqLdKF5E6ixIHaJcyCAak2D1lHF3DdmAYE6XbLA4xRFRdJfeh8IL?=
 =?us-ascii?Q?Jxkdd4txMI9uToa27GxRtnhOELS2AKwzTKzvk7RlArCl4OUEBGqMNCs9c8ob?=
 =?us-ascii?Q?agygi+PqNrUuqrM9POiaknYLK+Nz1l0k5xChmYqLMSnHXgDj8rU6kAFrD2m6?=
 =?us-ascii?Q?T3BRr7dPpcmLj8ZNnAccVNZwpmvzBuAtwt+XKjiTJPD3buBk/wRDZ4NaeU+E?=
 =?us-ascii?Q?DeDVns/Mmt+VTSk5cyjUyn1A1oGqz86P/iGMsVl/1D02t2BF05+x5qNbb1nh?=
 =?us-ascii?Q?grUW3PouvCbZhR72He92PNIBs7FLPwNDiW9WFHbGDlVqOBqVQjw8ktJJ1BzJ?=
 =?us-ascii?Q?aZ5X/lQAWHdas9Ucm2xomXQDdnJCWm0hxK25V3SUGYGgVsWlKG7SoLH99TAp?=
 =?us-ascii?Q?DXgcAIbLIU8ZwLU2oUoD1Ym/eJuD7/Eh9y/k+tHmt5wvUtD/YZnEDT1ellZH?=
 =?us-ascii?Q?TPY2TetXXoh8Qug+aLHU0eXaLfNy6zfbOBWDL3aSBd2TU/EXj8Zkslk4Euc5?=
 =?us-ascii?Q?9kWJplo26/jMS2VKsl63XR8g2u6EnTQN1EN9G2lokj8yshQc5aOmeJx2s860?=
 =?us-ascii?Q?pjO+ge3z7FvEPcHDvJiPhiyeEjoUdTlgXEUgy+HoC5K7te24AGWe+qgnTcXA?=
 =?us-ascii?Q?vkTFAYzvTQ3bDtdSDfj8KXX97E/Qx+VSGuDy+AoAWcl4a4YHz7zhrNHHS/sk?=
 =?us-ascii?Q?E/mkAqYSyO0Lwovm7wQMmxh8cI85X/JUa2lLY3iLf4A1ZTX3U3O8mG/jwENA?=
 =?us-ascii?Q?jZigifVlTts6iG4ME/E1KXtentx3YWp47jpwhzmr07+KKkxewwMv742AS6IM?=
 =?us-ascii?Q?I5vg2FJk3xSB67sk3dHd+rRjJBedv86zAAfnD9C5Tx3gwemyICnYom1BJnWj?=
 =?us-ascii?Q?Atqgfx0/8ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mtFFue0bHwdv0SIPF+iCQO5oyckj8vcsQ1qML9yco/0eamH+LGOi9xp4+j+G?=
 =?us-ascii?Q?80mEYb56APIe6wm+vpfy+afM5vNumQhI8f+btI6DfbQcvo51PVFxVDg1Zkxy?=
 =?us-ascii?Q?B+ynU6vGccmaK9P1GfC0i1QEBe8JJx5C+RYTZyco13MWfdIsVbVu4OZIqAHU?=
 =?us-ascii?Q?MVqPqUeVfElzBFkqmC0an5Moly7sMmfHSQsemq/Q0uskMIRysstS39/BuSg8?=
 =?us-ascii?Q?CtbRrKZUAUsTY0B+qhzk9Qb7ap08zysw0g4+M+C5x++SJxHYD2L0CawR2Qid?=
 =?us-ascii?Q?Vt6wz9dWy+Ruje0HQPuACX5g7CTeX2ihLoona8cL+WUjG3KmN+PJLOeHBSDB?=
 =?us-ascii?Q?sLK/YdorONHYPwnhPLB8V4LSTCwpb+DxDxxzPO9lPcXQmpSnod7PdBxg5c0u?=
 =?us-ascii?Q?p1uAec1QEhwbQt3x8y/cTV98qgwob6esUzTGykZMnv2xxue5cD2C1fWsbXXH?=
 =?us-ascii?Q?+BZEuDJoyA9bQ7QEkDmmcaGu2mbyZLT8MRWlifjyTM5ROGHi515rdEC+5WK4?=
 =?us-ascii?Q?S3Woo98rrpnk3y88cLuuSunuFTW0naWf8RaMg5cVrbJl3bDsLOQV8vpvBrMU?=
 =?us-ascii?Q?i2wDB928Vu2zeEzCvZrz6Qv+1GyK/4GWRXXe89i5KBzbYmMapZvc2dFoRgOx?=
 =?us-ascii?Q?vwB/ofuVVWh0QUi7BGTLyY9N3d/iZRkSgI/akkRYJDWSV9w37pCdbmOMohrd?=
 =?us-ascii?Q?1OjfZU6cm6mkKw7zy9/ej05C9adg2n13ernMRJkumxZ2ttMzpH5mOlj7KaUG?=
 =?us-ascii?Q?smIFH+ZUHJ9oCOdAcH7WeO+ARKFfCl91Jiq5QXs0dk7cWHZI3/gijqbogDQN?=
 =?us-ascii?Q?x82SZqXWNrTRN9eKovKgjydMEOmQy+ugoqnJRmnIK/3CsnSlgIEJVF16Jpub?=
 =?us-ascii?Q?XNIHvrMjd/T065z3NnKCy69NzBYSeygGg5bRoKN19UUf7xtrzwnkmK59C1dH?=
 =?us-ascii?Q?0S6IXpHcmbI0Rwku+v65RjJ7WkWHp+fVikX++eu29BvTg57QEHrs3SEE8WYE?=
 =?us-ascii?Q?D1KA4k29z5jgPhQ2fKixscMqPp1CnVpXt5iR9eXkrpxiCj2N0o/341lMvpD2?=
 =?us-ascii?Q?ew70PIw8YnfNZjOGl7s4bDOkzg3U2lb3Aj5BqS/0erTRoW7CS0JcfF2v4oqo?=
 =?us-ascii?Q?7QOfyRwLQGaPhuUDRHwjMU8/Hk3YCLNKrlWrQej9jV88iYG6wNxg5SvvdfOE?=
 =?us-ascii?Q?7JpWJEm9Rc6ebATttYk7kvjlsq2YrZ4sXguM77Uy5MMpvbJEZqJF729WODCn?=
 =?us-ascii?Q?vFcjDeXgrfvqw3WsRMOBdvEVYWbfwsiE3vtnK13VeP//ahTCeA9zWgL5s3Ud?=
 =?us-ascii?Q?xcC2xOnZhKJ8UyUgTWry8uQlKqeBwbWvDtCfUUxbgGDN8OcFToMz57EgvQ4b?=
 =?us-ascii?Q?0WmPJIIHO0k6xpi95/Gb5FECHNw6U1P4f2vXy9DhiLUcoFe1lToAgg9tONPe?=
 =?us-ascii?Q?zs9R0rjcd40d2ROISQccU3Qc2ys1nJnZIZK1RwN67J0+hVG8noN3fmd31msi?=
 =?us-ascii?Q?KHNkqXq+eY1pucJNX/AUUHgxdQuyNdE/6YCf+skB8AorZs/INDJShOQBPoPm?=
 =?us-ascii?Q?9+U+K7BX0DJ8J0v6YsKWrQfMWQZQWtVifrRJzA/2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	56MMM2vfgtIUEf/RFgRj2xwgycpDwRhciBTXOkzaB1lvn2fMydppeUIdYsKOOIniZFJ5G0ZeEoAUX8lSFuni1ov0/KcPm1bF2PU6fc14iABL67gy9J8u2HZa6BGLofCh5ZcOFRtPVae8YeXF9oBR4+oNIVb/lEI0ecAYbU9u2TrJeILV5RQRIBtPDT7OpkI3HpbTwY69AVEiNi8A8RM1vf2W4thSsyV6UK8OAQMKQlsARWL9IlLZ5rVPpoRI0p4MUbIXeVcprfDF19Jeg6ZiFSUFrXP92AlEZZ34BbKB0CSdI5Rjl2Ayu3P92gA8goEQ2ED2ITSfqNQdMLVCGVCo75q1+CgF3Wax9+lK67xsfE/8dDH9/o/bonLW9xC5KnQZ4XpLwkhH6eE+V4hVQDXUExHfSvRQWNvNhxXqVuq5ApWupxk8bFWO/sr/iEY00MZE0vXEhH55Wvt+m+NWwFq0YjY5D4H42EQeNi3P6b3qGBLaC6FRk75B3IdbG4MBFsP+8J54ZcEVixktDgjLi09yFGO5v5mPATpxK5rvODos9mM0ixrcsjw6wGYuXbTfkQSP8QTtEosUFKS/XYEryh51bHQkUuKKDH1VepKJyI/zROY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91601c04-4db7-4643-4410-08ddb39fc033
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:26.3274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvMycK0R7fbJtvwg3plGPLSmMyXxZnzWi8JEs1uS/yZiqsP9GsK3Yso0uB0VqhpKhIKchTGY8haaTLTie2nr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b794d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9
X-Proofpoint-ORIG-GUID: 8wlQ_DDJFcoVkwlCYJt2u9NIAa_yhqqR
X-Proofpoint-GUID: 8wlQ_DDJFcoVkwlCYJt2u9NIAa_yhqqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX9zt+7NXSmBF0 B5b0DuFmHag9ESg/v6u4xJdkAnfozITY5EulLEQyBFk4ZMGwH+0/3IuKLVAvxaLyMZFQoGbVUhu kmTPD/wAE+0davwC/Fny1Q6B5rdXisQK8Ec4X9FP9dp8q5PIKt4210PjR8dVI7LYy5jOTVdOxxv
 eb4JC7nn37pYlpPW2yB9caWLc1h1t0fPJaymaCtgFUNJVC9yFJ/o9Xq585UFOthSB5C9zUjr2df 0sG1hiYygzkUBwS8UXQ1KdGkG802ETGhyel6acwSkV4tlhlsBv0BQsw+QtCMZRj/wLvNWeM39TB p2RFA4Nse0eqzI/heLGZ9+VfKHzpOJBQSVfWXQNyi4ozdOMFHOLIkUxTf/fpCwQge8xeLpGa6lI
 XrxU0vLYON+Atcw5I+iucWrTr14ox+EF5uEsRLbaWz2tPWBSUJxsPOqA1+ObbKPhEYjshsrp

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../unittest/variables/bvar/tst.caller-proc.d | 34 ++++++++++++++++++
 .../unittest/variables/bvar/tst.caller-proc.r |  1 +
 .../variables/bvar/tst.caller-proc.r.p        |  1 +
 .../variables/bvar/tst.stackdepth-proc.d      | 36 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-proc.r      |  1 +
 .../variables/bvar/tst.stackdepth-proc.r.p    |  1 +
 6 files changed, 74 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-proc.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-proc.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-proc.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-proc.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-proc.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-proc.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-proc.d b/test/unittest/variables/bvar/tst.caller-proc.d
new file mode 100644
index 000000000..7c3557e2c
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+proc:::exec,
+proc:::exec-failure,
+proc:::exec-success,
+proc:::lwp-start,
+proc:::signal-clear,
+proc:::signal-send,
+proc:::start
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-proc.r b/test/unittest/variables/bvar/tst.caller-proc.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-proc.r.p b/test/unittest/variables/bvar/tst.caller-proc.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-proc.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.d b/test/unittest/variables/bvar/tst.stackdepth-proc.d
new file mode 100644
index 000000000..75f720370
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+proc:::exec,
+proc:::exec-failure,
+proc:::exec-success,
+proc:::lwp-start,
+proc:::signal-clear,
+proc:::signal-send,
+proc:::start
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.r b/test/unittest/variables/bvar/tst.stackdepth-proc.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-proc.r.p b/test/unittest/variables/bvar/tst.stackdepth-proc.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-proc.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

