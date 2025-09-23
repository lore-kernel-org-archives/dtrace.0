Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192CAAD24
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643311; cv=fail; b=hD9+NeLS12KztfACb8rt11Liun6GehaWCNbUxRDMm5MPr9zQ2Q7Y9FztdN36re8SrsnXYuquq+Yc3Sl4JbaAurqbLkA6Q1QWvQnr0O+nLP4AxAk7fJdGnYVMa3mqwQcaNLJEe5HDqvkDV9javuhAC4gbqCjVgVhQtJulitO/lgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643311; c=relaxed/simple;
	bh=YD4LsH6QNNQGv2sDiWZuZxURQfGfpq1a+as8MrJZCzg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=letQM45QRHLWHM2nvROnX1rYQ7CdXsLeBvbJzmKEVA4O0SjUDx/t9FK11G7DC2kWL5VyxyRw0YFqkTAHsCYwwvvVogkObDlNNsrVlLtXLTQWWSADgx6+AEBQH+3RVwlr6Ii55gXvockkQXk8BXuPFtWnGyP07zoT9EJmfwXUxTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mc7H2ZCb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x1GnWA1A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mc7H2ZCb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x1GnWA1A"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEY4Ei012550
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Ks8pQkZSPugnrbSgLm/OJzhm2nZoSO7J0ikM3QzHDsQ=; b=
	mc7H2ZCbt05FVZxnwvEATN42ow6xkCqdRxjMxK/IhYW3xDAxrrOBMg6nSKzXYmf+
	Zq5DeiI4eAfWTR+rkbtUDKGxgbJ8jEB0aepB8/EJAEkEgN/E046cslZh3rSbK9/B
	ZktStzLa3PU8Y0WcZqoMsXQ/AYLQoIBnLn+FcpiB637/Zm4Y7xOPHEqmj4lK6Zl0
	AC5ODaeZDixoKonbRLPiMykNJnecXgZfSKRUVXDO/5umv7y3xkYHiP+JBBCSZSKD
	gU07j8Ooi5B/4G02JzSlARp5wG764azMIDQnOjivoWmOsxubPrfzQNgHVGl7MaOj
	BcozFrd8WSpRBd8u4MvKnQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mtt50sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFYad2025333
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:42 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8nw6h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJKykHCB3N+sKzAegT6ffVGvlJorMZl039Nk8OGnntySA1NgCwDzBaHba9ynmOZtNcgYBiMnsgZ2Al0yrh4Oy++Dx33O3N7J0YD+PrwmZA3lKptux/GuQJUflZ6VJpha/uLL7YpJH+UeG1tKan0KFEsCDMhWOZ7ZGXrmtflJVjRglsgTuXyaAnVAhfcf+ovAjq9/404b1B3w3MHMWb7h1kko6ICzhxD+zZUpvYquTK5WAoqV8lw58X02fKGcd1Hpo4j24sH8VmHtyb4mm+0qslj9cdGAJuBQVAr5kBFuCz+QP0BlvI+JgThTYUzKXO7OBoHaTK/URlik+ugEP5GSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks8pQkZSPugnrbSgLm/OJzhm2nZoSO7J0ikM3QzHDsQ=;
 b=xanZCDukUUmTNblhJGwuOtPIElv77w5flowmt7VTwbW52MJIbmZYLqVT0NPVifGheAwkI/d7SE9nC+y9OGgdtYtnlE+UY04dKdnJdjOHl5bZ8Ze6QYAlD2/OPY2qWrPjsq5lONYD51Ep8mHN37PcPP/pUHTyK18+rEHKlXL5wa4BuR+ChsNFog9/bQzsVrnBtepSw6nuQZ5WKvTC+YOUXZ5Pso3cExrldGRULsexblr3hxnJc5H1gjRGu21qGoUWQERNPK0US/OUv4qCAZNsDeYoCUZ0zJlbTZTtlJGA9HlBg1NUVQF0eX0i8yHUSJ+53RYgwH+M+dfuAXFcCBID9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks8pQkZSPugnrbSgLm/OJzhm2nZoSO7J0ikM3QzHDsQ=;
 b=x1GnWA1AjZLnDGZXlBEJp0W8pb2vfh7HeiH5IgOB0mDUoPKDHU0r7arKcjJMRbzYI+CG/ukt6Z1He13y3xJ42+/PIWpUBWmnaIdHm56eq45c73fNhEPkah/SgP2vJ6eO5JJoj+AxmbUaSlCzVFRF3ymr9IXSf5WaguwC194yhXk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS4PPF3689F8B17.namprd10.prod.outlook.com (2603:10b6:f:fc00::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 23 Sep
 2025 16:01:34 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:01:34 +0000
Date: Tue, 23 Sep 2025 12:01:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] cg: transition [u]stack() from action to subroutine
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567238538078DC5066122BECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS4PPF3689F8B17:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ce59ce-8950-48d4-a169-08ddfaba7842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+HeHnHlOM04bg2xhOBI1PDLVH2XEkTztpkKdIrQpdYnoc+YFb3L2/6myokMl?=
 =?us-ascii?Q?6iXxftbYOnvsoV3YnMAtNtiPxAB/PemL14HmQUOAsn5ngIOy5t7FNi9icx9g?=
 =?us-ascii?Q?3flWJLzTzwQ521dND2kKI/K8G5CcOQkajm08dXkEDfPv5rEmjqb/tIJFMMxR?=
 =?us-ascii?Q?7ejWOSyw5pNN1ceGARB3gJYBMbHdDk8w8bnBPDkwQEGB3fo83bXD0r7A40Bq?=
 =?us-ascii?Q?8YGb8DNw5HTpDe5JsbPhzsxxBWvwSd+haWL+k1u6/B1IZrQ89uznvKW/QGtr?=
 =?us-ascii?Q?daBh4Ut6V92q88TpnHAGQlrQ5FfM8lLoXLhMUFSXNUTk7gWPZmIsfSg/HEQF?=
 =?us-ascii?Q?ffzEKCI7Z5POYd48cdI+QPXxHBMjV5B9+94n7YfLONkkocl1wqyOc6q797qp?=
 =?us-ascii?Q?/2Lg8LEFXeG5N4J0ad27OrHpfoQ9EgIMJvcgcqotDaeqenBxQZfSyD1RJpEN?=
 =?us-ascii?Q?8FOAUFWX9i0A7nk+5d/zD7SnvvMghT36kQrg+P1Jq0Mr2SG2pzFWqpMDj0JR?=
 =?us-ascii?Q?yoMFO0xmGNMNTytYp1QNUGe1cP0zPkM9PW2+GsniuUyxDNsxJ3YeFzev/yx3?=
 =?us-ascii?Q?k/xIeuGVtQCSRjw/8S7Rm11pDUaM8MHoyHpJnTJe5lwl+XQRloQ4B4DIY2qu?=
 =?us-ascii?Q?jvDIMAMTf6ocBJpd5r5dV5ueC5T25YZnOSIHcSCehJMFRvtrjaeQPWoarwxB?=
 =?us-ascii?Q?b8rkg18Ryujkr9LfFTeZbQ3HnImHp9Lvt4CYS2KO+MU2pHstoRf9nZo8jxEK?=
 =?us-ascii?Q?1qQoww9wQIe3I6SDn0iXl1k3FqshqAmZeQQTV6IiEYTnsaRhluwDWng5XRd9?=
 =?us-ascii?Q?nfcchwTBcnQrvAmexYYhOOzA8/EbwscHjl6vjqcMuYzQNjVnaER3hF1MwUdv?=
 =?us-ascii?Q?Kx6jvlu2QK6kdtMDxohj/rLmQZkCkpdvZekgw4KRFlBZjH6SDrp645uXIW66?=
 =?us-ascii?Q?uJ8P4mTkrvmv69gKuUabr2Rv82T/PAm5V0R9oMrGU1RxxrEO3lH7cGD/2Vlq?=
 =?us-ascii?Q?T6Dyk9YyfU7o8IiIWlWEiCHXjMkOorGhYl/dX+J7uZJb9IDf+xCMSWElqhac?=
 =?us-ascii?Q?1TPaCGbAmBfe/rxyvVnVbaZksuo6AatlY194NMBlE1I+/OdcEr9fuUnZN15p?=
 =?us-ascii?Q?NIl2suaerpS6+ZD9c9woMAZCxV5Tbs4NjujjC0DclQUonbe6ggJjU6He0WmU?=
 =?us-ascii?Q?WhP8fjUP51Lzab/epDIGZRyQIcuxuTRaHhFLd5u6Zl7zSMw9H6tI/NPcEUMY?=
 =?us-ascii?Q?H3ewC2e8yPWAF+cJNBG0UoaMpYAzlf36E1ywlYoQI6yxd48Em+zPZLjOQy4p?=
 =?us-ascii?Q?ECR4fKvXObgPnzJ3wH5HiaNi7lO8yZtg3FhFv6F0eu5zTziea+ZvUksYMq4o?=
 =?us-ascii?Q?+1Z6YaXIlF+WmGuyI/WRwQvsij8U7Ji4X1u3SdQ7Sus6lbT3R/DJOyRPPCvh?=
 =?us-ascii?Q?DtDzSet/wWc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mhHtF5mPLyj+h/IOVS+wSBRtXx1i6LGDQQq6a0JneehSL3zD4kf9C/03T4Tn?=
 =?us-ascii?Q?cRFjwvTnR0lTDSAk1NheFCJWxRTgUlajjPS79a/8JXO7rq/wY4rL6EtToQT2?=
 =?us-ascii?Q?0fimGP2tyjMy/6q8SlqF0XW823QCbKqqheHTfGSCvqA1KzTlDvO1SQPnNrLO?=
 =?us-ascii?Q?dTRVEy2YueQoy0HwTL5TvZ1oGQuryDPrbatIolbC8NSVDp4Bt3Hn6Krsds1J?=
 =?us-ascii?Q?swnhJF2MDVvG8C31i9tMVa00Q35xmIn5rkDcSnmiOjlnAGE7/bnqUZFGrjgR?=
 =?us-ascii?Q?FIFHDq7BKdvYTKwkzdsdLOmFZ2l6cFIJK+DEElVoHMP2oRrlitjatqLFxKig?=
 =?us-ascii?Q?bcFBA8Rc3UJsAOTzg4ZsEuwDbvXZi7kC5TDzE80GDRtBG1cjGU4DM1dbuJa5?=
 =?us-ascii?Q?H6/qSaTTytdd2kUwobee2RSBBP+VvLdw/fd/JMnni0lWoHR/1ceM9kXbrJ1O?=
 =?us-ascii?Q?D2sdNKyBvJckNulDU7+JUZhLQS5Z89wXycQbnixcBgrda5nPP4dRSHceL3JJ?=
 =?us-ascii?Q?dQFQQAlR84h91MTC3lDAK7hK4k06dtSCCNe9WotctEPAgShEF38Gg323e+we?=
 =?us-ascii?Q?FW/Ux1zWNCFt8YLsM0XuJeuEYlmLgIGk/GbIE5Use6czle1wbPyIqMKOWZF8?=
 =?us-ascii?Q?YHrAr19OyTF8/VHzIz9Z0GQ9PW2MBZLYLup2B9/nQ33hL4fYMddDgDpUo7Oj?=
 =?us-ascii?Q?yIqaVtG3WkkRe8+IPm+SagYB5hmo8+Yg0jb8ngL5SvS0CHgBRtAw3iM0RvJp?=
 =?us-ascii?Q?74MW2FFcircHlwlR+etX1v/t4bATk0pJrrolfH2rIJEG6kKbn/S+z4FV/pOx?=
 =?us-ascii?Q?yym6KUodumbDv0Yjjm93GaMaZnvptX9BEM54P6+u/ZqxvcAStFwpLRyohfKc?=
 =?us-ascii?Q?fhhW3YgOUjyvoK4fiNm9OtFCZGdzeUml6x0WV6rJQJ51HpY+30BYSZzIxVX8?=
 =?us-ascii?Q?qhd5W7uteK2aY+/ljtxekJazsl8KeLuIzkBVbFVNuiDvgkJOyTVt543ACTzo?=
 =?us-ascii?Q?5brvw8QZSilPwN3bjHjlrpAjQvxZeOtPr68o2+qt5+CvqB8fgDfhkd1JfTw/?=
 =?us-ascii?Q?YDNE9nDSXWNTfQo/cD7qW4KY8DtukvxGfv+kCmQKV2yt0FiJIWs03XiHDQXs?=
 =?us-ascii?Q?aJONgRGwDlT0wopT9XXe+dNdsGUoVilW1vAKaDMMUHkcwyqPOBVsYdHqsB7g?=
 =?us-ascii?Q?97AFze160Ykg0t1oGKrlHekxZbhIU1yhRlk49/8EL+xv9vtBkRrHkn8bliiI?=
 =?us-ascii?Q?KR6HHCfy+E00/a1ip2APIDpyGjdbR2DbIgtXbaq/u8RVAipk7awl+wm9gbFf?=
 =?us-ascii?Q?NMSJioJjnL4bvuzBW7E9gtk4KT5NpolyHBy5+pUyHQfZEtna/LrSXiiszf6l?=
 =?us-ascii?Q?F2o44R8OV8tNJzeA9BP6jrO/khAUJmZIKLFTQ6pRn+t3SSlnd/YkOax6gWXR?=
 =?us-ascii?Q?IeZ8aUaq0YPsG4EDJDxOnff1orFrchB6Ow6/rvfTEV0TndIh34NqDZfgWUi5?=
 =?us-ascii?Q?R4vxHVwMyseNfPtOvOSJn6vuVbOP2iaXJ80TuLJQvd91fWh+3CYdhXxovTGh?=
 =?us-ascii?Q?JewPMRNBVyzmvtvmtmMcESxglzLMgC+qS1B0vFllARD1OvMh8YsXo1jhxZO0?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cCQ3MTz216jfkQ0rXkkR1PcV4lTlKp7rKvuUn5OGrqn0cOj0moJ2ncIgiVMTpA+7ElnRQHh7MVsyrHqvB5QBOYlmD2iXGQ8hdYyK6z8EPJ5qB8DrX1PB0zJbwCYFMjAcieM7XYfFFkTeeXcCVu/+sB5rt8wUo1yu8mHCY92ppwh6z9/G6UiphOfHxp5mu8pmcfqkrIILWzkn4p2AQoIPbnA5dNOza4cuHXYLewd/QpZsmzL6R/43ptvSGp5Y1c+pPu0I4YMsqttrQFFO5VGZGjBLa/3acgi6h/FOXPrcDNmQVtdbOLimrfByE13GL8YRIW/CsQUWmp6VJXyofrbwey2q3FeghkrVEfYrAMgYn45Zq4BDCXQvDWwDB1u4DwiShWmeXN4vmY1dS4kjuBfifSmbPL5UR7J6KbjY+bL9MIru80TaDtuw7KBzVtgCmqWD+1YXZAKQ9Pkawn/+V5SA7XcBA+1cSPvCe3rUDQycQVT5vw1kWKiBJToHe0SYu+DRhWi5vsmtssYiyVNMFyvgs2yR1qyORDymqnZ9kPfEnEPzvIJIVCQYAObapfw0YaGNxCn4Y6rFNQ3QAQ5BuvMsVbCieDbvMtjuI5xoH37KFdE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ce59ce-8950-48d4-a169-08ddfaba7842
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:01:34.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMLchvY2+sNTTfDxjF9A9ke7tHg2ved0S9A49OTv1VPMQ4fJWmOMHkyesUa+4WXS7jvqZnM1CXAQW6tK+JEpJbG0/7BodabMjvq6iIvjhRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3689F8B17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230147
X-Authority-Analysis: v=2.4 cv=fd2ty1QF c=1 sm=1 tr=0 ts=68d2c468 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2aXaGo8567Iwr4cYDsoA:9
X-Proofpoint-ORIG-GUID: IBX3BB340rT2A78lNl08Qh6fLPeNrcrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNCBTYWx0ZWRfXypSMEa3OqFl6
 VWcImfOUYsRcyBUiXonHGb0WTVGE2+OAUvb9POMUmUMCguGQl0U8FqvMAclQrKm5qzW2G5jqBXw
 gZan706h2nTSTx17AszPITxQRo92xxBvJmpbm5K6MpnXJfDJAg91jAThglvEfO2IQTmq5vd9SWb
 5XbEk0BBS7Lwgq4SxLVcalsCjs8hfYsRABuDC+BacDi17HWQrYFyJheWN1CErD1pAlDyQnzP6oP
 Enny+MGTnc8OAEMjsqtCqwRjxEPAwWFQezpebR9j/wnjcPULHcVBqC8LEiTY+vi8csX6bYFnSUT
 jwWr/TXkSckmEuH8r5rSYewUrnk3YU53SjoxY0J25MCdOFh20VuO1YYi2tOl3wUBBz0zvCV6mfb
 /+kdW7wF
X-Proofpoint-GUID: IBX3BB340rT2A78lNl08Qh6fLPeNrcrG

In order to allow [u]stack() to be used in expressions, they must be
subroutines.  An exception is added to allow them to retain their
original behaviour as data recording actions as well.

The implementation change requires a new internal type to be defined
(dt_stack) to hold stack trace data.

This patch does not allow [u]stack() to be used in assignments to
variables just yet, but it supports all previous uses of [u]stack().
Additional functionality will be added on top of this.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/dif_defines.h                  |   4 +-
 libdtrace/dt_cg.c                             | 343 ++++++++++++------
 libdtrace/dt_open.c                           |  21 +-
 libdtrace/dt_options.c                        |  42 ++-
 libdtrace/dt_printf.c                         |   3 +-
 test/unittest/funcs/tst.subr.d                |  11 +
 .../printa/err.D_PRINTF_ARG_TYPE.stack.r      |   2 +-
 .../printa/err.D_PRINTF_ARG_TYPE.ustack.r     |   2 +-
 8 files changed, 313 insertions(+), 115 deletions(-)

diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index 9f6e3b55..6e412247 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -210,8 +210,10 @@
 #define DIF_SUBR_INET_NTOA6		43
 #define DIF_SUBR_D_PATH			44
 #define DIF_SUBR_LINK_NTOP		45
+#define DIF_SUBR_STACK			46
+#define DIF_SUBR_USTACK			47
 
-#define DIF_SUBR_MAX			45
+#define DIF_SUBR_MAX			47
 
 typedef uint32_t	dif_instr_t;
 
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 2b81f2e0..3eda5873 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3907,33 +3907,42 @@ dt_cg_arglist(dt_ident_t *idp, dt_node_t *args, dt_irlist_t *dlp,
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOTUPREG);
 
 		/*
-		 * Handle actions that can be used as agg keys.
-		 * If we are not an aggregation, dt_cg_node(dnp, ...)
-		 * will alert us there is a problem.
+		 * Some function calls (actions or subroutines) need special
+		 * handling.
 		 */
-		if (idp->di_kind == DT_IDENT_AGG &&
-		    dnp->dn_kind == DT_NODE_FUNC &&
-		    dnp->dn_ident != NULL)
-			switch (dnp->dn_ident->di_id) {
-			case DT_ACT_STACK:
-			case DT_ACT_USTACK:
-				/* If this is a stack()-like function, we can handle it later. */
-				dt_cg_push_stack(BPF_REG_FP, dlp, drp);
-				continue;
-			case DT_ACT_JSTACK:
-				dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
-				/* FIXME: Needs implementation */
-			case DT_ACT_SYM:
-			case DT_ACT_MOD:
-			case DT_ACT_UADDR:
-			case DT_ACT_UMOD:
-			case DT_ACT_USYM:
-				/* Otherwise, use the action's arg, not its "return value". */
-				dt_cg_node(dnp->dn_args, dlp, drp);
-				dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
-				dt_regset_free(drp, dnp->dn_args->dn_reg);
-				continue;
+		if (dnp->dn_kind == DT_NODE_FUNC) {
+			dt_ident_t	*fidp = dnp->dn_ident;
+
+			assert(fidp != NULL);
+
+			/*
+			 * For subroutines, stack() and ustack() don't need to
+			 * be evaluated until we fill in the data of the tuple.
+			 */
+			if (fidp->di_kind == DT_IDENT_FUNC) {
+				if (fidp->di_id == DIF_SUBR_STACK ||
+				    fidp->di_id == DIF_SUBR_USTACK) {
+					dt_cg_push_stack(BPF_REG_FP, dlp, drp);
+					continue;
+				}
+			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
+				switch (fidp->di_id) {
+				case DT_ACT_JSTACK:
+					dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
+					/* FIXME: Needs implementation */
+				case DT_ACT_SYM:
+				case DT_ACT_MOD:
+				case DT_ACT_UADDR:
+				case DT_ACT_UMOD:
+				case DT_ACT_USYM:
+					/* Otherwise, use the action's arg, not its "return value". */
+					dt_cg_node(dnp->dn_args, dlp, drp);
+					dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
+					dt_regset_free(drp, dnp->dn_args->dn_reg);
+					continue;
+				}
 			}
+		}
 
 		/* Push the component (pointer or value) onto the tuple stack. */
 		dt_cg_node(dnp, dlp, drp);
@@ -3987,50 +3996,63 @@ empty_args:
 		uint_t			nextoff;
 		int			is_symmod = 0;
 
-		if (dnp->dn_kind == DT_NODE_FUNC &&
-		    dnp->dn_ident != NULL)
-			switch (dnp->dn_ident->di_id) {
-			case DT_ACT_STACK:
-				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_STACK);
-				continue;
-			case DT_ACT_USTACK:
-				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_USTACK);
-				continue;
-			case DT_ACT_UADDR:
-			case DT_ACT_USYM:
-			case DT_ACT_UMOD:
-				nextoff = (tuplesize + (8 - 1)) & ~(8 - 1);
-				if (tuplesize < nextoff)
-					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
-
-				/* Preface the value with the user process pid. */
-				if (dt_regset_xalloc_args(drp) == -1)
-					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-				dt_regset_free_args(drp);
-				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
-				dt_regset_free(drp, BPF_REG_0);
-
-				/* Then store the value. */
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
-				emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
-				dt_regset_free(drp, BPF_REG_0);
-
-				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
-				tuplesize = nextoff + 16;
-
-				continue;
-			case DT_ACT_SYM:
-			case DT_ACT_MOD:
-				is_symmod = 1;
-				size = 8;
-				dt_regset_xalloc(drp, BPF_REG_0);
-				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
-				break;
+		if (dnp->dn_kind == DT_NODE_FUNC) {
+			dt_ident_t	*fidp = dnp->dn_ident;
+
+			if (fidp->di_kind == DT_IDENT_FUNC) {
+				switch (fidp->di_id) {
+				case DIF_SUBR_STACK:
+					tuplesize = dt_cg_act_stack_sub(
+							yypcb, dnp, treg,
+							tuplesize,
+							DTRACEACT_STACK);
+					continue;
+				case DIF_SUBR_USTACK:
+					tuplesize = dt_cg_act_stack_sub(
+							yypcb, dnp, treg,
+							tuplesize,
+							DTRACEACT_USTACK);
+					continue;
+				}
+			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
+				switch (dnp->dn_ident->di_id) {
+				case DT_ACT_UADDR:
+				case DT_ACT_USYM:
+				case DT_ACT_UMOD:
+					nextoff = ALIGN(tuplesize, 8);
+					if (tuplesize < nextoff)
+						emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
+
+					/* Preface the value with the user process pid. */
+					if (dt_regset_xalloc_args(drp) == -1)
+						longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+					dt_regset_free_args(drp);
+					emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+					emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
+					dt_regset_free(drp, BPF_REG_0);
+
+					/* Then store the value. */
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
+					emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
+					dt_regset_free(drp, BPF_REG_0);
+
+					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
+					tuplesize = nextoff + 16;
+
+					continue;
+				case DT_ACT_SYM:
+				case DT_ACT_MOD:
+					is_symmod = 1;
+					size = 8;
+					dt_regset_xalloc(drp, BPF_REG_0);
+					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
+					break;
+				}
 			}
+		}
 
 		if (!is_symmod) {
 			dt_node_diftype(dtp, dnp, &t);
@@ -6322,6 +6344,84 @@ dt_cg_subr_strchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	TRACE_REGSET("    subr-strchr:End  ");
 }
 
+static void
+dt_cg_subr_stack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_node_t	*size = dnp->dn_args;
+	dt_node_t	asize;
+	int		nframes = dtp->dt_options[DTRACEOPT_MAXFRAMES];
+
+	TRACE_REGSET("    subr-stack:Begin");
+
+	if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+	/*
+	 * Allocate enough scratch space to hold the maximum stacktrace size.
+	 * Since dt_cg_subr_alloca_impl() requires a node to be passed for the
+	 * allocation size, one is created here based on the stacktrace size.
+	 */
+	asize.dn_op = DT_TOK_INT;
+	asize.dn_kind = DT_NODE_INT;
+	asize.dn_value = (size ? size->dn_value : nframes) * sizeof(uint64_t);
+	dt_cg_node(&asize, dlp, drp);
+	dt_cg_subr_alloca_impl(dnp, &asize, dlp, drp);
+	dt_regset_free(drp, asize.dn_reg);
+	asize.dn_reg = -1;
+	/* Push the native alloca value to be used as return value. */
+	dt_cg_push_stack(dnp->dn_reg, dlp, drp);
+	/* Turn it into a proper alloca pointer. */
+	dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
+
+	/* Call the stack helper function to collect the stack. */
+	dt_cg_act_stack_sub(yypcb, dnp, dnp->dn_reg, 0, DTRACEACT_STACK);
+
+	/* Pop the native alloca value as return value. */
+	dt_cg_pop_stack(dnp->dn_reg, dlp, drp);
+
+	TRACE_REGSET("    subr-stack:End  ");
+}
+
+static void
+dt_cg_subr_ustack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_node_t	*size = dnp->dn_args;
+	dt_node_t	asize;
+	int		nframes = dtp->dt_options[DTRACEOPT_MAXFRAMES];
+
+	TRACE_REGSET("    subr-ustack:Begin");
+
+	if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+	/*
+	 * Allocate enough scratch space to hold the maximum stacktrace size.
+	 * Since dt_cg_subr_alloca_impl() requires a node to be passed for the
+	 * allocation size, one is created here based on the stacktrace size.
+	 */
+	asize.dn_op = DT_TOK_INT;
+	asize.dn_kind = DT_NODE_INT;
+	asize.dn_value = (size ? size->dn_value : nframes) * sizeof(uint64_t);
+	dt_cg_node(&asize, dlp, drp);
+	dt_cg_subr_alloca_impl(dnp, &asize, dlp, drp);
+	dt_regset_free(drp, asize.dn_reg);
+	asize.dn_reg = -1;
+	/* Push the native alloca value to be used as return value. */
+	dt_cg_push_stack(dnp->dn_reg, dlp, drp);
+	/* Turn it into a proper alloca pointer. */
+	dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
+
+	/* Call the stack helper function to collect the stack. */
+	dt_cg_act_stack_sub(yypcb, dnp, dnp->dn_reg, 0, DTRACEACT_USTACK);
+
+	/* Pop the native alloca value as return value. */
+	dt_cg_pop_stack(dnp->dn_reg, dlp, drp);
+
+	TRACE_REGSET("    subr-ustack:End  ");
+}
+
 static void
 dt_cg_subr_strrchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
@@ -6951,6 +7051,8 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
 	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
 	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
 	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
+	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
+	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
 };
 
 static void
@@ -6968,6 +7070,7 @@ dt_cg_call_subr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	assert(idp->di_id <= DIF_SUBR_MAX);
 
 	fun = _dt_cg_subr[idp->di_id];
+assert(fun != NULL);
 	if (fun == NULL)
 		dnerror(dnp, D_FUNC_UNDEF, "unimplemented subroutine: %s\n",
 			idp->di_name);
@@ -8690,43 +8793,50 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 			uint64_t arg = 0;
 			dt_ident_t *idp = knp->dn_ident;
 
-			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL &&
-			    idp->di_kind == DT_IDENT_ACTFUNC) {
-				size = 16;
+			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL) {
 				alignment = 8;
-				switch (idp->di_id) {
-				case DT_ACT_USTACK:
-					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
-					kind = DTRACEACT_USTACK;
-					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
-					break;
-				case DT_ACT_JSTACK:
-					kind = DTRACEACT_JSTACK;
-					break;
-				case DT_ACT_USYM:
-					kind = DTRACEACT_USYM;
-					break;
-				case DT_ACT_UMOD:
-					kind = DTRACEACT_UMOD;
-					break;
-				case DT_ACT_UADDR:
-					kind = DTRACEACT_UADDR;
-					break;
-				case DT_ACT_STACK:
-					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
-					kind = DTRACEACT_STACK;
-					size = 8 * arg;
-					break;
-				case DT_ACT_SYM:
-					kind = DTRACEACT_SYM;
-					size = 8;
-					break;
-				case DT_ACT_MOD:
-					kind = DTRACEACT_MOD;
-					size = 8;
-					break;
+
+				if (idp->di_kind == DT_IDENT_FUNC) {
+					switch (idp->di_id) {
+					case DIF_SUBR_USTACK:
+						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
+						kind = DTRACEACT_USTACK;
+						size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
+						goto add_rec;
+					case DIF_SUBR_STACK:
+						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
+						kind = DTRACEACT_STACK;
+						size = 8 * arg;
+						goto add_rec;
+					}
+				} else if (idp->di_kind == DT_IDENT_ACTFUNC) {
+					size = 16;
+					switch (idp->di_id) {
+					case DT_ACT_JSTACK:
+						kind = DTRACEACT_JSTACK;
+						goto add_rec;
+					case DT_ACT_USYM:
+						kind = DTRACEACT_USYM;
+						goto add_rec;
+					case DT_ACT_UMOD:
+						kind = DTRACEACT_UMOD;
+						goto add_rec;
+					case DT_ACT_UADDR:
+						kind = DTRACEACT_UADDR;
+						goto add_rec;
+					case DT_ACT_SYM:
+						kind = DTRACEACT_SYM;
+						size = 8;
+						goto add_rec;
+					case DT_ACT_MOD:
+						kind = DTRACEACT_MOD;
+						size = 8;
+						goto add_rec;
+					}
 				}
-			} else if (dt_node_is_string(knp)) {
+			}
+
+			if (dt_node_is_string(knp)) {
 				size = dtp->dt_options[DTRACEOPT_STRSIZE] + 1;
 				alignment = 1;
 			} else {
@@ -8737,6 +8847,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 				alignment = size;
 			}
 
+add_rec:
 			dt_aggid_rec_add(dtp, aid->di_id, kind, size, alignment, arg);
 		}
 	}
@@ -8820,10 +8931,34 @@ dt_cg(dt_pcb_t *pcb, dt_node_t *dnp)
 				if (enp->dn_kind == DT_NODE_AGG)
 					dt_cg_agg(pcb, enp, &pcb->pcb_ir,
 						  pcb->pcb_regs);
-				else
+				else {
+					/*
+					 * Special case: [u]stack() in statement
+					 * context is treated as data generating
+					 * action.
+					 */
+					if (enp->dn_kind == DT_NODE_FUNC) {
+						uint_t	id;
+
+						id = enp->dn_ident->di_id;
+						if (id == DIF_SUBR_STACK)
+							id = DTRACEACT_STACK;
+						else if (id == DIF_SUBR_USTACK)
+							id = DTRACEACT_USTACK;
+						else
+							id = 0;
+
+						if (id) {
+							dt_cg_act_stack(pcb, enp, id);
+							pcb->pcb_stmt->dtsd_clauseflags |= DT_CLSFLAG_DATAREC;
+							goto done;
+						}
+					}
 					dt_cg_node(enp, &pcb->pcb_ir,
 						   pcb->pcb_regs);
+				}
 
+done:
 				if (enp->dn_reg != -1) {
 					dt_regset_free(pcb->pcb_regs,
 						       enp->dn_reg);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 509f263d..9dd8956d 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint_t" },
 { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
+	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
 { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
 	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
 { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
@@ -273,8 +273,8 @@ static const dt_ident_t _dtrace_globals[] = {
 { "speculation", DT_IDENT_FUNC, 0, DIF_SUBR_SPECULATION,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "int()" },
-{ "stack", DT_IDENT_ACTFUNC, 0, DT_ACT_STACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t])" },
+{ "stack", DT_IDENT_FUNC, DT_IDFLG_ALLOCA, DIF_SUBR_STACK, DT_ATTR_STABCMN,
+	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t])" },
 { "stackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_STACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint32_t" },
@@ -328,8 +328,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
 { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_regs, NULL },
-{ "ustack", DT_IDENT_ACTFUNC, 0, DT_ACT_USTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
+{ "ustack", DT_IDENT_FUNC, DT_IDFLG_ALLOCA, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
+	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
 { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_2,
 	&dt_idops_type, "uint32_t" },
@@ -1054,8 +1054,17 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_type_dyn = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
 	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
 
+	/*
+	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
+	 * final value of MAXFRAMES may be adjusted with the "stackframes"
+	 * option.
+	 */
+	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
+	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
+	ctr.ctr_nelems = _dtrace_stackframes;
+
 	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
-	    "stack", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
+		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
 
 	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
 	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 25e79979..69667f5b 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -912,6 +912,46 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 	return 0;
 }
 
+/*
+ * When setting the maxframes option, set the option in the dt_options array
+ * using dt_opt_runtime() as usual, and then update the definition of the CTF
+ * type for "_stack" to be an array of the corresponding size.
+ * If any errors occur, reset dt_options[option] to its previous value.
+ */
+static int
+dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
+{
+	dtrace_optval_t val = dtp->dt_options[option];
+	ctf_file_t *fp = DT_STACK_CTFP(dtp);
+	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
+	ctf_arinfo_t r;
+
+	if (dt_opt_runtime(dtp, arg, option) != 0)
+		return -1; /* dt_errno is set for us */
+
+	if (dtp->dt_options[option] > UINT_MAX) {
+		dtp->dt_options[option] = val;
+		return dt_set_errno(dtp, EOVERFLOW);
+	}
+
+	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
+		dtp->dt_options[option] = val;
+		dtp->dt_ctferr = ctf_errno(fp);
+		return dt_set_errno(dtp, EDT_CTF);
+	}
+
+	r.ctr_nelems = (uint_t)dtp->dt_options[option];
+
+	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
+	    ctf_update(fp) == CTF_ERR) {
+		dtp->dt_options[option] = val;
+		dtp->dt_ctferr = ctf_errno(fp);
+		return dt_set_errno(dtp, EDT_CTF);
+	}
+
+	return 0;
+}
+
 /*
  * When setting the strsize option, set the option in the dt_options array
  * using dt_opt_size() as usual, and then update the definition of the CTF
@@ -1157,7 +1197,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
-	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
+	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
 	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 4c276c26..06c86a37 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -24,7 +24,8 @@
 static int
 pfcheck_addr(dt_pfargv_t *pfv, dt_pfargd_t *pfd, dt_node_t *dnp)
 {
-	return dt_node_is_pointer(dnp) || dt_node_is_integer(dnp);
+	return (dt_node_is_pointer(dnp) && !dt_node_is_stack(dnp)) ||
+	       dt_node_is_integer(dnp);
 }
 
 /*ARGSUSED*/
diff --git a/test/unittest/funcs/tst.subr.d b/test/unittest/funcs/tst.subr.d
index 9f7203c0..20e38341 100644
--- a/test/unittest/funcs/tst.subr.d
+++ b/test/unittest/funcs/tst.subr.d
@@ -36,6 +36,15 @@
 	/*DSTYLED*/			\
 	}
 
+#define STKFUNC(x)			\
+	BEGIN				\
+	/*DSTYLED*/			\
+	{				\
+		subr++;			\
+		@stk[x] = sum(1);	\
+	/*DSTYLED*/			\
+	}
+
 #define NUM_UNIMPLEMENTED 7
 
 INTFUNC(rand())
@@ -89,6 +98,8 @@ STRFUNC(inet_ntoa6((in6_addr_t *)alloca(sizeof(in6_addr_t))))
 /* Not implemented yet.
    STRFUNC(d_path(&(curthread->fs->root)))
    STRFUNC(link_ntop(ARPHRD_ETHER, (void *)alloca(sizeof(ipaddr_t)))) */
+STKFUNC(stack(5))
+STKFUNC(ustack(5))
 
 BEGIN
 /subr == DIF_SUBR_MAX + 1 - NUM_UNIMPLEMENTED/
diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
index 50e884a0..95ac80da 100644
--- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
+++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
@@ -2,4 +2,4 @@
 dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
 	conversion: %p
 	 prototype: pointer or integer
-	  argument: stack
+	  argument: dt_stack
diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
index fc9e1512..5df10376 100644
--- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
+++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
@@ -2,4 +2,4 @@
 dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
 	conversion: %p
 	 prototype: pointer or integer
-	  argument: stack
+	  argument: dt_stack
-- 
2.43.5

