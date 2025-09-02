Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753EA2E762D
	for <dtrace@lists.linux.dev>; Tue,  2 Sep 2025 20:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756843380; cv=fail; b=RvPEJ7Czg+IYvsQns5Wbx3QwNiK60j15lmuyW1G3AE55V2vNzaLPYhKqJdV3Dt1KseOhUc+Otl9Mun+SG0UqFfJ7wQiEwg7i3y8I8oM9VVVhzn7qpDLHhHJBZXnobZ74TqrD3X3R+ac1s0oyHKuho5BStrpaHHsLrBGXvapZ9wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756843380; c=relaxed/simple;
	bh=4A1euAyEuMUQ778TLJp/EKX5ZymC75BB/PoW9aHzasI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Nghm8BQWPi2aorNUYyCCBFT/howHRkqTijkTBQX7fiisG4Q3/VjuZNHdZQcQhoKv5bYKJbxgab1+RPQfdbkSgV52clBa1NBg104Krb2gM+fxiiNBEe+NotjckQKMgxaFtbHRBGP53JeNUqXro4ESzf9FHzhPL36dFiPwKRzncEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SGvkkBvC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DRMM4hh8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SGvkkBvC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DRMM4hh8"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582JuLSr023312
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 20:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=fMGP05DuJ4aEg27k21SDyUI/lbcbrU3WVCLVndcHBJM=; b=
	SGvkkBvCiijMdWnd8sqEZFZ4aklqxiMC8G7/2fBoSqrge3iq39THEJ63rMNhCYXb
	pUH7jwp0g9ucRsPb/42xke6KAOcwbcYo7m8ZyH5pwZqG2ZQSE1VvO59TZ1BqKbj1
	sT9+HJ60ErDQKXValhaktaPtwBYdFdEN0oKJG/zPj46OZx6hbcvLFjljxLjuaPmP
	Axnddvf5Gum5U95W/orh9NmiLTSdUe9PUmWrjWtaboxbGEvJDLKAeiYEY3Q8YSIe
	CEzTfdoXZNEzSwSo6OZMDn+/JhBwvLGOI4Zulb+eT5ErbDrgxiU4lPKUqGwPZ+KP
	qPTl408n47g8r0i0aZyGZA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ussymt66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 20:02:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 582IiX4g040023
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 20:02:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrfkt34-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 20:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvezPSYqTe5W7ZyeZVfIDtq8Zq1q53zzYRq/Vp/OeCrdQmq3bjBFOIYteOq99jIsK+qMdv9gaQMHT11PMGGz5BCx/ouQdYr+CAv69KHEPnFPm/cwv3t6dHIK7pFQghKhXkZwQgSkZHeRkcLmZrYRXnsU8GSkRV+WCwCD7/YhTEPPmlFIKS2h4Ct5ZoMs/TtE+6tvH4qb08TztfFXkCtjFL9+SoSmrKxPu1GpGTL7xQquE58IF+YtO86SFBBeLZjlVSI1U9Lh2CTJvIqjMY3ODmUD6j/m9VnDh4yC6eu1NUBXhRCadEXkPPzrVrDQO7nW1ACkFKgXwRAIR8OzDC7c0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMGP05DuJ4aEg27k21SDyUI/lbcbrU3WVCLVndcHBJM=;
 b=VEi1GeM//Nl4OPNw8BYT/D29k4pcsOXNC7ZhZ9w8VLEak3ZkBxAMzTr0WRjqObW975wcIWUJjUyLnOig09x4N0srG3TuOruCVPcUqdfuDcTDkdF1baiZwwV8FVfm2X/CDD+vAvXTnfZsBIw8F09N1UJ00LVtLABbO5u/Stkyf7d9Lp5K3E/qb21c2FI+ew3IO3OWbrmr7Mz721WBO8+yV8tvxMnaR4b9NUlQWokdYjHdbdbrBoXdKZj5XSHf3L0Mh2QJSYW3yiCgsO+GaNF5TDzpYiJs3PTaq+KUPVgaIsB8BtzRhAcsRcvVXbOLjatfyYR7rRaph4RjcT2GJ8v4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMGP05DuJ4aEg27k21SDyUI/lbcbrU3WVCLVndcHBJM=;
 b=DRMM4hh8+HlY7Birf7u/qApoeUAhhjBhjiZEC9M3kDwS58fH6Xkuc3Pzk80PDcd3ziUG75f88IS+C5L3oq1tI/SqC2ZJngX0B85Cm4m5EWsBvuTz/PNEgILTJH7NC1Mm8ctoJvrzSJt29NrX2zKmmOH8t+QUaAHJjhqdAKWbViY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4840.namprd10.prod.outlook.com (2603:10b6:408:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:02:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:02:51 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] examples: Add "language features" demo scripts
Date: Tue,  2 Sep 2025 16:02:46 -0400
Message-Id: <20250902200246.3299-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc8a42a-1a9c-456f-2b79-08ddea5bb20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YPK5FCI7Yw2t2f3zcRiqbIdMoLj5sr1+SoxZM2DquNQpjlmZmnid7zAbUxBr?=
 =?us-ascii?Q?bfnzM88lRh8aPITq4dkNQe2cAh7BW4pFecFO/GNCNVUn7xfzboXZRo9F1JZq?=
 =?us-ascii?Q?UU5W3mFD2NB5IPqsfshBbMiYGQJ+E7qG7uJQIuCuC17+AE/loGfAjqpu7zLH?=
 =?us-ascii?Q?+8+dDdvOqoGTBZPszkYAn9NFzWtLIN2ijNJFjp36JGHm/cA/G9vize8PHKDR?=
 =?us-ascii?Q?kb91VYM4We2ehz7J5qHQaF5rKgKtKBWip2Jw7AwCJVDL14nFiqJVQX30DHCB?=
 =?us-ascii?Q?rvcZVlW5T0QGNKbCf3+cCA+1t0fMS1yRDk9Wp0qdSpeQcRihunGyH9gPMF+k?=
 =?us-ascii?Q?pDd28qaNX8OU6Xdc489KTjHN6+6qHEL3h8RTMve7Jkok47y75s/EvyiRtKG7?=
 =?us-ascii?Q?TKwmRTIVR7Gp92axctSZf7SintVFRqkzu6p5I7IpmK5oxke98PoU/3d95CFA?=
 =?us-ascii?Q?ouUxZ85YuIz8s6Z6OKA65eKwKDpiPv0COuP+Nfz65ft26vdUT+49w0JiKVIA?=
 =?us-ascii?Q?XPVsi7QMfcvDTLflj/7EBeKFBC+U4kWPoIH8WM0qdg1l15dC5M8ZWh7Y+N1Y?=
 =?us-ascii?Q?Yz+IxCitPeBILOgtDH9vUEySM1/tGIlzqNE5m70IuIKJCZlVcc8mIQwJBUm8?=
 =?us-ascii?Q?BRwTH9MJgUM85re7JnKS7OrumZuKx7iMTlsyueR+AgBGCkpDUM7VZhcYgBUu?=
 =?us-ascii?Q?6R7baFKjrUANSD31gmA1tIsVrDFkIVFpTz5pzr+0V6qwtZDOtE1XKMx4tpbu?=
 =?us-ascii?Q?9AoP+lnWccTjiabPdPRjbBK4pS8hiMX/0K8+/ezv/F9km6x4HJJb1uddBqpx?=
 =?us-ascii?Q?cr0huEeEjF+tmjW8Iv+w5UAD0CCRZAPPVoETp7FilGVFgb7MucoJ8XNYTXbO?=
 =?us-ascii?Q?6EbbgiR9ZIocv3O59+UKpqHo92Jpf+SlgxJT0rJ1WyyRXLrgbrPjhzvzaLc2?=
 =?us-ascii?Q?2Qg3SonoarQdiZvIoh+Sz+PkuuVAeKKSF1ZrPHmT+tQj155qXV+qAEgsg/zx?=
 =?us-ascii?Q?kBnJ5lEgbszWJhHAl6ZwTBRDXztMepKcycRnzNtK98/vA9Hiqn1h/j0ZNdo6?=
 =?us-ascii?Q?wwsIiSB3/HocvJhiK7ySEguN799BaC15kFc7wzssnlqiiopXwKiMALAqPFOD?=
 =?us-ascii?Q?aZ2kk0HokmOOOSan3WAQTdk6XJQPMClRGAH+9fiM2cPnyjxpoe+ivWTLvprD?=
 =?us-ascii?Q?qKzGOTnJEa9Sjjk+9K9ehYBFHVtuDMf0a6g3y6xSpRJJMOnDcscK4vKw1gI7?=
 =?us-ascii?Q?suQF6nlo0vRv8t6X72y3VVaPanaIiQB1DStl0lEkpz1yTz2UJ6+qWStCRnEZ?=
 =?us-ascii?Q?C7c9AqJk4s24v6xzVmOyYFdeseEmRA+4IRzKa/e7k0+Th9oHUGE1q95F13Xo?=
 =?us-ascii?Q?z4Pbr/7ampHeopnKX1cr/9nOfXanYpR0f3N8rXtXmYgOAEdzSZjRiAiT9cGD?=
 =?us-ascii?Q?NYikugxFgEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n7EF9ngC9GQnhF7IE4MS3q7u4ARqdH/qA7Ev01VY1UBsva4od1Inx+nDBCcQ?=
 =?us-ascii?Q?iBXfnhe0hTFEoUnELHmkDGwOGcDb5GsykatEKDv2aHo6CjT1qnQo4aIDSZhj?=
 =?us-ascii?Q?ruq587AMQCbP7tmAz6SbxYHkrVFNQmSQaFHfrghF/BtsFpQJQtBmPBkCThN5?=
 =?us-ascii?Q?B2gndpGk1qIQ2Glyrs2k+zikwR8u2aqJFArhGmN12/yOLFaiJUdH0RLcaToS?=
 =?us-ascii?Q?zaeI6cJS21RbAZuifnmkc+2HbRnMP4CLu5US7/kgUHT8a11xN+StSi2eXWP0?=
 =?us-ascii?Q?ssez4yZCu0sTesAleyYODbU5ngsW97FZ+Dq4s1rC103uHl9iRCBqpOIa5Pn4?=
 =?us-ascii?Q?hPVZOoFyuhQHOtFNMv7pvTlEeYNy8GoTtOaZ8+W+kshTswsFDrNoGGKJNzAd?=
 =?us-ascii?Q?doo3bzcsLixUqUd6AMQNQwsBzLOHP9gZHMzqRwmn/hpCC+lqQYPM+/YbJKlQ?=
 =?us-ascii?Q?PCtT/4+pUclbZp29U9UNSpg0+lab/cVSAGvLsOmkd+Y6jcItJQPbWTyMl1FC?=
 =?us-ascii?Q?ASuRB/2sqSc0wibgDrWZLKnwkDDMTfINi+nlogqfsm6r/KFblO1F+yx1ag9l?=
 =?us-ascii?Q?HXfQmZizJOuI2XK5qDrEvHFS/wDBwE3ByyQ4UFmHjYn1B4PowsCTXnSenWCU?=
 =?us-ascii?Q?MuCEC+Ze74bIlvfWFwc7SuDrHZC/bxDSos1OnsxWGXCp52G5y8pqV1ggE6Av?=
 =?us-ascii?Q?qKvuGMK1XNLws6tLhm4ZTVW35+O+ShjBElskC3/cKZZRbSGqi4O58TT43KiF?=
 =?us-ascii?Q?svz70NKNrlmADtYHh7Vx5M64paS0A2cDuCDxGkhjwTVWbGHJ1dNaGohNKR7+?=
 =?us-ascii?Q?eKwenlhcNbikLF68omiDBVpRNhuatw5FRIbQN9Y1F/c++JsK/jMkR/KTaLsl?=
 =?us-ascii?Q?uXLKEdNiUoWLeDdjDdQP1I+pweRb7zGKctKWsjXzOOkACPjFw7nMW775f/5N?=
 =?us-ascii?Q?v6SLgugXEN3X9ncoX4Twz9GWvxvms22c7JIzdpdsbcp04u8GXO86fagwmjdk?=
 =?us-ascii?Q?HwnZYJ+zon0JVHc4u+qBWpX0j8OhRLXl++2z441Cd3s81dZqpaZGMyGrLxdm?=
 =?us-ascii?Q?eEMOjwO6TpkEv5Go3gQXOZKBfRbaAANIcGRnWkG03Vpu5XKRYhMY/KvEOaYN?=
 =?us-ascii?Q?wvbT6NNeLdn4Bb87X++rCoOAwrBt6Iv4Dl8kMyaLU2dThBGxrFH1yGbThHAb?=
 =?us-ascii?Q?KE80PH6VnboJd8rnCXwv6KikbOmwzkBArMqDGaRPTAfx5LAuVugCDygQHBv/?=
 =?us-ascii?Q?AMuy7qpx9e413Yzc4kstSldkO6TN2DeiAUN5ewyCaNN/o1CFdTZl4MJKjtpE?=
 =?us-ascii?Q?Kd+eh3sA6pxYK/rzgsD/Cm7bB/Opq24RcHSR1FDLw7LexU7z9V9YmYBYrIF2?=
 =?us-ascii?Q?YPBphkh1A7sQc00ljasxzYtNcoo+lGBhq/Dpdmh4p2bshVpWHluzfpWN9d1S?=
 =?us-ascii?Q?pU1G+lQBrggdc4y1tBgcNSjqyOKxQe+TvFUENwkSji2oNRjf/T4GCbfYLvJS?=
 =?us-ascii?Q?guIqhigzajGJfVenArnotVNocdwIwntY/hFhcUaQbYP1klfKX5fHsF6dZbgT?=
 =?us-ascii?Q?4Tey/DqjQ1XBkKmSFRqfzkTz5zYbQ4N3Y74F6mmq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CAZCeVGg5AEEhhH3axYO4PF9IOHkJwt7X4xkcGNFr/GPrnooRi/tVY32fo5EGdASmN9mo+qIAPFCC7Ct61P3hmmwJm4H9qkYZSfT8Kx8AOPsYPW7PZIRSfnsUGSYNz9kTMBpm3Zuc9GQM8FeDM5tpSJTbsgsaPjmRyInnsgeOz/5YGf2tzUcJzQnZbSYU737c7uqeU7JmtUpCobQdsDeMPxY65lGzbqIp4Win1jTevff9A+Mb2USGeMzbEySfNjHfKO3FHdHfHR2uOrJ9wUdU6rgAcowhMykRMoUEFYz18vzaa5VQgKDE+wq02CWkbyDI3Lk3VN+V+MaEzO59AEAwNFJdBeCl9RCCFx5DjMbNkYxn6thXsyY8fokCNk0SH6fqJ424CuSsfR+BgeJ5JLqpfA73UyQzNSsq9dqce748+gtqM90VtciH6C2jykirVJCXgfEwpZvdaifuP86I5LIwUW/97mo3koSLmiiCPgdT6drccUWhq8rb2OHqn8RKNOn+dPaFkKCjSc39Zs973ucIliVVHzaXE9ImmVga8+zd7Xu2tZiJcnvO8qivh2prYPrsWii97yvnKWOYRKxS7MdLzIBLlcGkSrFxPMk+utVE+8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc8a42a-1a9c-456f-2b79-08ddea5bb20c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 20:02:51.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwPdGh5R3V+I7HBaG4XAr/9s0jk19RL7KPR7/VHHTAApdMIrqq4JktJq3iIMHQ05gqcPY+XKndQSYtGp3lRZaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509020198
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX75HAkY8g1L32
 SWk2qecItzaTBPGxWaqRNz0SwDsz6Q6u5/UL9VR8dmOMp+c+goK7esqxaUsqq9gmQ+ArFiFuku4
 gAJmg+NBMCl1M6rfBku1HCsGuHhsOWVVjxBDCdh/M2lA63004/VQh0TN17gSR9fX/lGyqZFxyzU
 xMp7hIbAz/kFwB6CDPtnxe8q1NmoOfryqzi84nVXpeahCdEzC2rx1VbNKsXQQy0Q+O9QvyTQIYm
 RrV+tCWNKamH8SQNKhKwuu8N4YT6htw2C+Kit40qyR01A3JqaODNrWZaI3A+aW/oZ57QKf1u9aW
 LywqKuBf34Xiw6jM8OdNVVe8wWu86dbSSX9ZafQUakDMq8Aziq+S5Qj5knVANyNj34H0pYyEC8f
 PDc6dGk6v5pjOAwNvCECNaBDLWKU9A==
X-Authority-Analysis: v=2.4 cv=X/9SKHTe c=1 sm=1 tr=0 ts=68b74d6f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7K-vq_9jToTCBA0V4jgA:9
 a=QWoAyJx5Xna_e5xF:21 cc=ntf awl=host:12068
X-Proofpoint-ORIG-GUID: irDRXvzSgMELInB3ndljOlphbRQqpnP2
X-Proofpoint-GUID: irDRXvzSgMELInB3ndljOlphbRQqpnP2

From: Eugene Loh <eugene.loh@oracle.com>

The idea is to have lots of short scripts, each illustrating a
D language feature.

The numbering scheme serves two purposes:

*)  the scripts are more or less in ascending order
    of difficulty, although that's admittedly a tricky
    concept in such a multi-dimensional space

*)  there is some grouping of themes -- e.g.,
    "introduction", "providers", "built-in variables", etc.

The combination of comments and code is intended to help either
a human user or an AI bot to learn how to use the D language.

Other examples have been based on functional objectives (doing
simple but useful tasks).  These new examples are based on language
features.  A future set of examples could be based on errors!  That
is, the scripts generate errors of different sorts that we would
illustrate (and explain how to fix).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 examples/README.md                            | 13 +++
 .../language_features/000intro-hello-world.d  | 63 ++++++++++++
 .../language_features/001intro-ERROR-probe.d  | 30 ++++++
 .../002intro-global-variables.d               | 31 ++++++
 examples/language_features/003intro-C-like.d  | 75 +++++++++++++++
 examples/language_features/004intro-ternary.d | 32 +++++++
 examples/language_features/005intro-strings.d | 65 +++++++++++++
 .../language_features/006intro-associative.d  | 34 +++++++
 .../007intro-this-variables.d                 | 49 ++++++++++
 .../008intro-self-variables.d                 | 57 +++++++++++
 examples/language_features/009intro-pragmas.d | 38 ++++++++
 .../010intro-external-variables.d             | 53 +++++++++++
 .../language_features/011intro-preprocessor.d | 25 +++++
 .../language_features/012intro-predicates.d   | 52 ++++++++++
 examples/language_features/100list_probes.sh  | 11 +++
 .../101count_probes_by_provider.sh            | 12 +++
 .../102list_probe_arguments.sh                | 11 +++
 .../language_features/110provider_profile.d   | 29 ++++++
 examples/language_features/120provider_proc.d | 37 ++++++++
 .../130provider_sched_on_off_cpu.d            | 28 ++++++
 .../131provider_sched_enqueue_dequeue.d       | 24 +++++
 .../language_features/140provider_syscall.d   | 20 ++++
 examples/language_features/150provider_fbt.d  | 48 ++++++++++
 .../160provider_sdt_rawtp.sh                  | 36 +++++++
 .../language_features/170provider_lockstat.sh | 17 ++++
 examples/language_features/171provider_io.d   | 31 ++++++
 examples/language_features/172provider_ip.d   | 26 +++++
 examples/language_features/180provider_cpc.d  | 52 ++++++++++
 .../200built-in-variables-probe.d             | 18 ++++
 .../201built-in-variables-timestamps.d        | 31 ++++++
 .../202built-in-variables-args.d              | 28 ++++++
 .../203built-in-variables-process-info.d      | 31 ++++++
 .../204built-in-variables-uregs.d             | 31 ++++++
 examples/language_features/300actions-exit.sh | 18 ++++
 examples/language_features/301actions-print.d | 32 +++++++
 .../language_features/302actions-strings.d    | 45 +++++++++
 .../303actions-strings-paths.d                | 25 +++++
 .../language_features/304actions-system.d     | 22 +++++
 .../language_features/305actions-progenyof.d  | 20 ++++
 .../306actions-speculations.d                 | 57 +++++++++++
 .../language_features/307actions-callstack.d  | 54 +++++++++++
 .../310actions-alloca-copy.d                  | 95 +++++++++++++++++++
 examples/language_features/311actions-rand.d  | 25 +++++
 .../language_features/500aggregations-intro.d | 24 +++++
 .../501aggregations-names-keys.d              | 19 ++++
 .../502aggregations-basic-funcs.d             | 26 +++++
 .../language_features/503aggregations-stack.d | 24 +++++
 .../504aggregations-printa.d                  | 29 ++++++
 .../505aggregations-quantize.d                | 65 +++++++++++++
 .../506aggregations-clear-trunc.d             | 63 ++++++++++++
 .../507aggregations-trunc5.d                  | 50 ++++++++++
 .../508aggregations-normalize.d               | 49 ++++++++++
 52 files changed, 1880 insertions(+)
 create mode 100755 examples/language_features/000intro-hello-world.d
 create mode 100755 examples/language_features/001intro-ERROR-probe.d
 create mode 100755 examples/language_features/002intro-global-variables.d
 create mode 100755 examples/language_features/003intro-C-like.d
 create mode 100755 examples/language_features/004intro-ternary.d
 create mode 100755 examples/language_features/005intro-strings.d
 create mode 100755 examples/language_features/006intro-associative.d
 create mode 100755 examples/language_features/007intro-this-variables.d
 create mode 100755 examples/language_features/008intro-self-variables.d
 create mode 100755 examples/language_features/009intro-pragmas.d
 create mode 100755 examples/language_features/010intro-external-variables.d
 create mode 100755 examples/language_features/011intro-preprocessor.d
 create mode 100755 examples/language_features/012intro-predicates.d
 create mode 100755 examples/language_features/100list_probes.sh
 create mode 100755 examples/language_features/101count_probes_by_provider.sh
 create mode 100755 examples/language_features/102list_probe_arguments.sh
 create mode 100755 examples/language_features/110provider_profile.d
 create mode 100755 examples/language_features/120provider_proc.d
 create mode 100755 examples/language_features/130provider_sched_on_off_cpu.d
 create mode 100755 examples/language_features/131provider_sched_enqueue_dequeue.d
 create mode 100755 examples/language_features/140provider_syscall.d
 create mode 100755 examples/language_features/150provider_fbt.d
 create mode 100755 examples/language_features/160provider_sdt_rawtp.sh
 create mode 100755 examples/language_features/170provider_lockstat.sh
 create mode 100755 examples/language_features/171provider_io.d
 create mode 100755 examples/language_features/172provider_ip.d
 create mode 100755 examples/language_features/180provider_cpc.d
 create mode 100755 examples/language_features/200built-in-variables-probe.d
 create mode 100755 examples/language_features/201built-in-variables-timestamps.d
 create mode 100755 examples/language_features/202built-in-variables-args.d
 create mode 100755 examples/language_features/203built-in-variables-process-info.d
 create mode 100755 examples/language_features/204built-in-variables-uregs.d
 create mode 100755 examples/language_features/300actions-exit.sh
 create mode 100755 examples/language_features/301actions-print.d
 create mode 100755 examples/language_features/302actions-strings.d
 create mode 100755 examples/language_features/303actions-strings-paths.d
 create mode 100755 examples/language_features/304actions-system.d
 create mode 100755 examples/language_features/305actions-progenyof.d
 create mode 100755 examples/language_features/306actions-speculations.d
 create mode 100755 examples/language_features/307actions-callstack.d
 create mode 100755 examples/language_features/310actions-alloca-copy.d
 create mode 100755 examples/language_features/311actions-rand.d
 create mode 100755 examples/language_features/500aggregations-intro.d
 create mode 100755 examples/language_features/501aggregations-names-keys.d
 create mode 100755 examples/language_features/502aggregations-basic-funcs.d
 create mode 100755 examples/language_features/503aggregations-stack.d
 create mode 100755 examples/language_features/504aggregations-printa.d
 create mode 100755 examples/language_features/505aggregations-quantize.d
 create mode 100755 examples/language_features/506aggregations-clear-trunc.d
 create mode 100755 examples/language_features/507aggregations-trunc5.d
 create mode 100755 examples/language_features/508aggregations-normalize.d

diff --git a/examples/README.md b/examples/README.md
index de4ba090b..b84a34031 100644
--- a/examples/README.md
+++ b/examples/README.md
@@ -86,3 +86,16 @@ These are the scripts included, plus a brief description.
 |                 | thread ID as returned in the DTrace tid variable.         |
 | var-scope.d     | Demonstrate some of the scoping rules for global and    |B|
 |                 | clause-local variables.                                   |
+
+## Language-feature examples
+
+In the language_features/ subdirectory are short scripts,
+each illustrating a D language feature.
+
+The numbering scheme serves two purposes:
+
+* The scripts are more or less in ascending order of difficulty, although that's admittedly a tricky concept in such a multi-dimensional space
+
+* There is some grouping of themes -- e.g., "introduction", "providers", "built-in variables", etc.
+
+The scripts start at Beginner, and they arguably do not get much more complicated than that.
diff --git a/examples/language_features/000intro-hello-world.d b/examples/language_features/000intro-hello-world.d
new file mode 100755
index 000000000..a38f7cacc
--- /dev/null
+++ b/examples/language_features/000intro-hello-world.d
@@ -0,0 +1,63 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./000intro-hello-world.d
+ *
+ *        or
+ *
+ *    sudo /usr/sbin/dtrace -s 000intro-hello-world.d
+ *
+ *        or
+ *
+ *    sudo /usr/sbin/dtrace -n 'dtrace:::BEGIN
+ *                              {
+ *                                  printf("hello world\n");
+ *                                  exit(0);
+ *                              }
+ *                              dtrace:::END
+ *                              {
+ *                                  trace("goodbye world");
+ *                              }'
+ *
+ *  DESCRIPTION
+ *    This is a simple "hello world" program in D.  It
+ *    illustrates a variety of very simple features of D.
+ */
+
+/*
+ * The BEGIN probe fires when the script is launched.  It can
+ * be called by simply asking for BEGIN.  Or, its provider can
+ * also be named:  dtrace:::BEGIN.  The other probe description
+ * fields, the module and function, are blank for this probe.
+ */
+dtrace:::BEGIN
+{
+	/*
+	 * A C-like printf() function can be used to print
+	 * data.  Alternatively, the trace() function can be
+	 * used, and it will discern the appropriate data type.
+	 */
+	printf("hello world\n");
+
+	/*
+	 * Variables can be assigned.  They maybe typed implicitly.
+	 */
+	x = 123;
+
+	exit(0);
+}
+
+dtrace:::BEGIN
+/x == 456/    /* A predicate can indicate whether to execute a clause. */
+{
+	trace("YOU SHOULD NOT SEE THIS MESSAGE!!!\n");
+}
+
+/*
+ * We can also gives actions to list at the end.
+ */
+dtrace:::END
+{
+	trace("goodbye world");
+}
diff --git a/examples/language_features/001intro-ERROR-probe.d b/examples/language_features/001intro-ERROR-probe.d
new file mode 100755
index 000000000..3c3a50eee
--- /dev/null
+++ b/examples/language_features/001intro-ERROR-probe.d
@@ -0,0 +1,30 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./001intro-ERROR-probe.d
+ *
+ *  DESCRIPTION
+ *    The ERROR probe can be used to handle run-time errors.
+ *    If a clause encounters an error, its output is not seen
+ *    and the ERROR probe is triggered.  Other clauses associated
+ *    with the guilty probe, however, do execute.
+ */
+
+dtrace:::ERROR
+{
+	printf("An error occurred.\n");
+}
+
+dtrace:::BEGIN
+{
+	printf("WE SHOULD NOT SEE THIS!\n");
+	printf("Dereference an illegal address: %d\n", *((int *)0x1234));
+	printf("WE SHOULD NOT GET HERE!\n");
+}
+
+dtrace:::BEGIN
+{
+	printf("This is a different clause.\n");
+	exit(0);
+}
diff --git a/examples/language_features/002intro-global-variables.d b/examples/language_features/002intro-global-variables.d
new file mode 100755
index 000000000..9b9ec6533
--- /dev/null
+++ b/examples/language_features/002intro-global-variables.d
@@ -0,0 +1,31 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./002intro-global-variables.d
+ *
+ *  DESCRIPTION
+ *    Rules for variable names are similar to those in C.  By
+ *    default, they are "global" -- that is, seen by every thread
+ *    and every probe.  So be careful that no thread overwrites any
+ *    other thread's write.  Variables may be typed implicitly.
+ */
+
+int explicitly_typed_variable;
+
+dtrace:::BEGIN
+{
+	explicitly_typed_variable = 1234;
+	implicitly_typed_variable = 5678;
+
+	printf("%d %d\n", explicitly_typed_variable,
+			  implicitly_typed_variable);
+
+	my_char = 'a';
+	my_string = "hello world";
+	my_pointer = (int *) 0x123456;
+
+	printf("%c '%s' %p\n", my_char, my_string, my_pointer);
+
+	exit(0);
+}
diff --git a/examples/language_features/003intro-C-like.d b/examples/language_features/003intro-C-like.d
new file mode 100755
index 000000000..2e3ea8bde
--- /dev/null
+++ b/examples/language_features/003intro-C-like.d
@@ -0,0 +1,75 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./003intro-C-like.d
+ *
+ *  DESCRIPTION
+ *    Much of D syntax is very C-like.  Examples are shown here.
+ *    Check the documentation for more complete information.
+ *
+ *    Differences include:
+ *    - D variables can be typed implicitly
+ *    - D has no "if" "switch" "case" "for"
+ *    - D has no function definitions
+ */
+
+/*
+ * As you have already seen, one can use multi-line comments in D
+ * similarly to C.
+ */
+
+/*
+ * Variables can be declared explicitly.  Data types like short, int, long,
+ * long long, char, struct, and union are familiar from C.
+ */
+int x, y, arr[5];
+
+dtrace:::BEGIN
+{
+	/* Assignments are similar to C. */
+	x = 1;
+	y = 2;
+	x += 3;
+
+	/* There are familiar operators.  E.g., arithmetic operators. */
+	x = x + y;
+	y = 3 * x - 2 * y;
+
+	/* Relational operators. */
+	x = 2 > 3;
+	y = 2 >= 3;
+
+	/* Logical operators. */
+	x = (2 > 3) && (2 >= 3);
+
+	/* Bitwise operators. */
+	x = x & y;
+
+	/* Various unary operators. */
+	x = x++ + --y;
+
+	/* Types and casting. */
+	x = (long long) (sizeof(int) + ((int) 0xfedcba9876543210ull));
+
+	/*
+	 * In contrast with C, D has a printf() whose %d, %x, and %i format
+	 * conversions use type information about the corresponding argument
+	 * to interpret that argument with its actual word size.
+	 */
+	printf("%x\n", x);
+
+	/* Arrays can also be associative.  More on that later. */
+	arr[0] = 10000;
+	arr[1] = 11111;
+	arr[2] = 12222;
+	arr[3] = 13333;
+	arr[4] = 14444;
+
+	/* One can get addresses and dereference addresses. */
+	/* (In this case, `nr_cpu_ids is a kernel variable.) */
+	ptr = &`nr_cpu_ids;
+	printf("nr_cpu_ids:  %d should equal %d\n", *ptr, `nr_cpu_ids);
+
+	exit(0);
+}
diff --git a/examples/language_features/004intro-ternary.d b/examples/language_features/004intro-ternary.d
new file mode 100755
index 000000000..e6404f8b6
--- /dev/null
+++ b/examples/language_features/004intro-ternary.d
@@ -0,0 +1,32 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./004intro-ternary.d
+ *
+ *  DESCRIPTION
+ *    Much of D syntax is very C-like.  Another example is
+ *    ternary operations:  ($condition ? $if_yes : $if_no).
+ *    In D, however, ternary operations are argubly more
+ *    useful than they are in C.  The D language does not
+ *    have conditional constructs like "if" statements.
+ *    Therefore, other constructs, like predicates and
+ *    speculations, must be used.  Or, ternary operations.
+ */
+
+dtrace:::BEGIN
+{
+	x = 123;
+	y = 456;
+
+	/* basic ternary operation to implement z = MIN(x, y) */
+	z = (x < y) ? x : y;
+
+	/* a more novel use to conditionalize an assignment */
+	(x < y) ? (y = x) : 1;
+
+	/* all three variables should have the same value */
+	printf("x = %d; y = %d; z = %d\n", x, y, z);
+
+	exit(0);
+}
diff --git a/examples/language_features/005intro-strings.d b/examples/language_features/005intro-strings.d
new file mode 100755
index 000000000..5a758fcc3
--- /dev/null
+++ b/examples/language_features/005intro-strings.d
@@ -0,0 +1,65 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./005intro-strings.d
+ *
+ *  DESCRIPTION
+ *    But D does differ from C when it comes to strings.
+ *    The D language has a built-in string data type.
+ */
+
+/*
+ * Strings are stored in arrays of fixed length.  The
+ * default length 256 can be overridden with a D option.
+ */
+#pragma D option strsize=12
+
+/* string variables can be declared explicitly */
+string exp;
+string s1, s2, s3, s4;
+
+char carray[32];
+
+BEGIN
+{
+	/* strings are truncated, if necessary, per strsize */
+	printf("%s\n", "abcdefghijklmnopqrstuvwxyz");
+
+	/* string variables can be declared implicitly */
+	imp = "abcdefghijklmnopqrstuvwxyz";
+	printf("%d chars, string %s\n", sizeof(imp), imp);
+
+	/* operators can be used to order strings lexically (akin to strcmp) */
+	exp = "zyxwvutsrqponmlkjihgfedcba";
+	printf("%s is %s than %s\n", imp, imp < exp ? "less" : "greater", exp);
+
+	/* set up NULL-terminated char array for some illustration purposes */
+	carray[ 0] = 'A'; carray[ 1] = 'B'; carray[ 2] = 'C'; carray[ 3] = 'D';
+	carray[ 4] = 'E'; carray[ 5] = 'F'; carray[ 6] = 'G'; carray[ 7] = 'H';
+	carray[ 8] = 'I'; carray[ 9] = 'J'; carray[10] = 'K'; carray[11] = 'L';
+	carray[12] = 'M'; carray[13] = 'N'; carray[14] = 'O'; carray[15] = 'P';
+	carray[16] = 'Q'; carray[17] = 'R'; carray[18] = 'S'; carray[19] = 'T';
+	carray[20] = 'U'; carray[21] = 'V'; carray[22] = 'W'; carray[23] = 'X';
+	carray[24] = 'Y'; carray[25] = 'Z'; carray[26] = '\0';
+
+	/* char pointers can be turned into strings */
+	s1 = (string) carray;	/* type casting */
+	s2 = stringof carray;	/* stringof operator */
+
+	/* char pointers can be promoted automatically to strings */
+	s3 = carray;
+	s4 = strchr(carray, 'B');
+
+	/*
+	 * Note that in the above assignments, we did not simply set
+	 * a char* to some existing string buffer.  Rather, contents
+	 * are copied "by-value" to the destination string buffer.
+	 * E.g., if the source buffer is modified, the output strings
+	 * nevertheless all stay the same.
+	 */
+	carray[2] = '\0';
+	printf("%s %s %s %s %s\n", s1, s2, s3, s4, carray);
+
+	exit(0);
+}
diff --git a/examples/language_features/006intro-associative.d b/examples/language_features/006intro-associative.d
new file mode 100755
index 000000000..b811c6028
--- /dev/null
+++ b/examples/language_features/006intro-associative.d
@@ -0,0 +1,34 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./006intro-associative.d
+ *
+ *  DESCRIPTION
+ *    The D language also supports associative arrays.
+ */
+
+/* associative arrays can be declared explicitly by key (if any) and value types */
+int exp[string, int];
+
+BEGIN
+{
+	/* associative arrays can also be declared implicitly */
+	imp["hello", 5] = 1234;
+
+	/* values not set are assumed to be 0 */
+	printf("set value is %d; unset value is %d\n",
+	    imp["hello", 5],
+	    exp["hello", 5]);
+
+	/* when you are done, set a value back to 0 to free the memory */
+	imp["hello", 5] = 0;
+
+	/*
+	 * By the way, you cannot promote a char associative array
+	 * to a string -- whether with stringof or (string) -- since
+	 * it is not a consecutive block of memory holding chars in sequence.
+	 */
+
+	exit(0);
+}
diff --git a/examples/language_features/007intro-this-variables.d b/examples/language_features/007intro-this-variables.d
new file mode 100755
index 000000000..4d9ba5390
--- /dev/null
+++ b/examples/language_features/007intro-this-variables.d
@@ -0,0 +1,49 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./007intro-this-variables.d
+ *
+ *  DESCRIPTION
+ *    We saw earlier that D supports global variables, allowing
+ *    convenient access from every probe and every thread.  In
+ *    the same way, however, this causes the danger of different
+ *    probes and threads overwriting one another's values.
+ *
+ *    For variables that are to used only within a set of clauses
+ *    for a specific probe, specify "this->".  Such variables have
+ *    undefined values at the start of the set of clauses.
+ */
+
+/* "this" variables can be declared explicitly */
+this int exp;
+
+dtrace:::BEGIN
+{
+	/* the value is undefined by default, define its value */
+	this->exp = 1234;
+
+	/* variables can also be typed implicitly */
+	this->imp = 5678;
+}
+
+dtrace:::BEGIN
+/ 1 == 1 /
+{
+	/* the variables are available in this later clause for the same probe */
+	printf("%d %d\n", this->exp, this->imp);
+
+	/*
+	 * There is no need to zero out this-> variables at the end of a
+	 * set of clauses:  they will no longer exist anyhow and their
+	 * values when they are used in a different set of clauses, for
+	 * some other probe firing, will be undefined at first.
+	 */
+
+	exit(0);
+}
+
+END
+{
+	/* the variables are not available here, for a different probe */
+}
diff --git a/examples/language_features/008intro-self-variables.d b/examples/language_features/008intro-self-variables.d
new file mode 100755
index 000000000..68a5dcf59
--- /dev/null
+++ b/examples/language_features/008intro-self-variables.d
@@ -0,0 +1,57 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./008intro-self-variables.d
+ *
+ *  DESCRIPTION
+ *    In D, we can also have variables that are local to a thread.
+ *    We preface them with "self->".
+ */
+
+/* Thread-local "self" variables can be declared explicitly */
+self int exp, dummy;
+
+syscall::write:entry
+{
+	/* we initialize one variable to the fd of the write() call */
+	self->exp = arg0;
+
+	/* we can declare a self->variable implicitly, setting it to the requested number of bytes */
+	self->imp = arg2;
+}
+
+fbt::ksys_write:entry
+/ self->exp /
+{
+	self->kernel_value = arg2;
+}
+
+/*
+ * We look for a write() return probe on the same thread where
+ * self->exp has been set.  Using thread-local variables allows
+ * us to connect two probes for the same thread, without interference
+ * from other threads.
+ */
+syscall::write:return
+/ self->exp /
+{
+	printf("on fd %d\n", self->exp);
+	printf("bytes (requested): %d\n", self->imp);
+	printf("bytes (requested in kernel function): %d\n", self->kernel_value);
+	printf("bytes (actual): %d\n", arg1);
+
+	/* uninitialized self-> variables are 0 */
+	printf("uninitialized is zero: %d\n", self->dummy);
+
+	/*
+	 * It is good practice to zero out variables when you are
+	 * done with them to free up the associated memory.
+	 */
+	self->exp = 0;
+	self->imp = 0;
+	self->kernel_value = 0;
+
+	/* but for this example, we are finished */
+	exit(0);
+}
diff --git a/examples/language_features/009intro-pragmas.d b/examples/language_features/009intro-pragmas.d
new file mode 100755
index 000000000..a4e359976
--- /dev/null
+++ b/examples/language_features/009intro-pragmas.d
@@ -0,0 +1,38 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./009intro-pragmas.d
+ *
+ *  DESCRIPTION
+ *    D options can be set on the command line.  E.g.,
+ *
+ *        sudo /usr/sbin/dtrace -xq ...
+ *        sudo /usr/sbin/dtrace -xw ...
+ *        sudo /usr/sbin/dtrace -xstrsize=12 ...
+ *
+ *    They can also be set via pragmas inside a script.
+ *    Respectively,
+ */
+
+/* -q */
+#pragma D option quiet
+
+/* -w, e.g., for the system() call */
+#pragma D option destructive
+
+/* -xstrsize=12 */
+#pragma D option strsize=12
+
+/*
+ * Simple options could alternatively be set on the first
+ * "shebang" line.  E.g., "#!/usr/sbin/dtrace -qws".
+ */
+
+dtrace:::BEGIN
+{
+	/* string truncated to strsize */
+	system("echo abcdefghijklmnopqrstuvwxyz");
+
+	exit(0);
+}
diff --git a/examples/language_features/010intro-external-variables.d b/examples/language_features/010intro-external-variables.d
new file mode 100755
index 000000000..a763a36f6
--- /dev/null
+++ b/examples/language_features/010intro-external-variables.d
@@ -0,0 +1,53 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+#pragma D option strsize=64
+
+/*
+ *  SYNOPSIS
+ *    sudo ./010intro-external-variables.d
+ *
+ *  DESCRIPTION
+ *    We can examine external variables -- that is, variables from outside
+ *    the D program, such as kernel variables.  They are distinguished by
+ *    a back quote ` and constitute a different name space from that of
+ *    the D variables.  When such a variables is named, the kernel and all
+ *    loaded modules are searched for the name.  Or, you can specify a
+ *    module before the back quote.  The kernel itself is module "vmlinux".
+ *    D scripts cannot modify values of kernel variables.
+ *
+ *    Such external variables are not part of D and are subject to change.
+ */
+
+dtrace:::BEGIN
+{
+
+	printf("\n==== print some kernel variables ====\n\n");
+
+	printf("cad_pid->level: %d\n", ((struct pid *)`cad_pid)->level);
+	printf("crashing_cpu: %d\n", `crashing_cpu);
+	printf("linux_banner: %s\n", (string)`linux_banner);
+	printf("linux_proc_banner: %s\n", (string)`linux_proc_banner);
+	printf("load averages: %d.%02d, %d.%02d, %d.%02d\n",
+	    `avenrun[0] / 2048, ((`avenrun[0] % 2048) * 100) / 2048,
+	    `avenrun[1] / 2048, ((`avenrun[1] % 2048) * 100) / 2048,
+	    `avenrun[2] / 2048, ((`avenrun[2] % 2048) * 100) / 2048);
+	printf("max_pvn: %d\n", `max_pfn);
+	printf("nr_cpu_ids: %d\n", `nr_cpu_ids);
+	printf("saved_command_line: %s\n", (string)`saved_command_line);
+
+	printf("\n==== reprint some of them, explicitly naming vmlinux ====\n\n");
+
+	printf("crashing_cpu: %d\n", vmlinux`crashing_cpu);
+	printf("linux_banner: %s\n", (string)vmlinux`linux_banner);
+	printf("linux_proc_banner: %s\n", (string)vmlinux`linux_proc_banner);
+	printf("max_pvn: %d\n", vmlinux`max_pfn);
+	printf("nr_cpu_ids: %d\n", vmlinux`nr_cpu_ids);
+
+	printf("\n==== refer to a data type in a module ====\n\n");
+
+	printf("offset of atomic in struct rds_message: %d\n",
+	    offsetof(struct rds`rds_message, atomic));
+
+	exit(0);
+}
diff --git a/examples/language_features/011intro-preprocessor.d b/examples/language_features/011intro-preprocessor.d
new file mode 100755
index 000000000..1ece9d2d6
--- /dev/null
+++ b/examples/language_features/011intro-preprocessor.d
@@ -0,0 +1,25 @@
+#!/usr/sbin/dtrace -Cqs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./011intro-preprocessor.d
+ *
+ *  DESCRIPTION
+ *    D scripts can also use the C preprocessor.  This requires using
+ *    the "dtrace -C" option, or by adding 'C' to the first, shebang
+ *    line, as illustrated above.
+ */
+
+#define KEYS "abcde", 12
+#define DEBUG
+
+dtrace:::BEGIN
+{
+#ifdef DEBUG
+	printf("\nabcde, 12 should get a count of 1\n");
+#endif
+
+	@[KEYS] = count();
+
+	exit(0);
+}
diff --git a/examples/language_features/012intro-predicates.d b/examples/language_features/012intro-predicates.d
new file mode 100755
index 000000000..3e4f7894d
--- /dev/null
+++ b/examples/language_features/012intro-predicates.d
@@ -0,0 +1,52 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./012intro-predicates.d
+ *
+ *  DESCRIPTION
+ *    We have already seen that predicates can be used to
+ *    conditionalize execution in a D scripts.  (Other
+ *    mechanisms include speculation and ternary operators.)
+ */
+
+BEGIN
+{
+	ntimes = 0;
+}
+
+/*
+ * The write() system call has a file descriptor in arg0 and a
+ * requested number of bytes in arg2.  If a nonzero number of
+ * bytes is requested, take note of the fd.
+ */
+syscall::write:entry
+/ (self->nbytes_requested = arg2) != 0 /
+{
+	ntimes++;
+	self->fd = arg0;
+}
+
+/*
+ * When the write() system call returns, we know the actual
+ * number of bytes written.  Report it.
+ */
+syscall::write:return
+/ self->nbytes_requested != 0 /
+{
+	printf("fd %d: bytes requested %d, actual %d\n",
+		self->fd, self->nbytes_requested, arg1);
+
+	/* free memory associated with self-> variables */
+	self->nbytes_requested = 0;
+	self->fd = 0;
+}
+
+/*
+ * Only report a limited number of times.
+ */
+syscall::write:return
+/ ntimes >= 5 /
+{
+	exit(0);
+}
diff --git a/examples/language_features/100list_probes.sh b/examples/language_features/100list_probes.sh
new file mode 100755
index 000000000..23bfd0525
--- /dev/null
+++ b/examples/language_features/100list_probes.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+#  SYNOPSIS
+#    ./100list_probes.sh
+#
+#  DESCRIPTION
+#    List all probes.  There are many.
+
+sudo /usr/sbin/dtrace -l | head -10
+echo "[...]"
+sudo /usr/sbin/dtrace -l | tail -10
diff --git a/examples/language_features/101count_probes_by_provider.sh b/examples/language_features/101count_probes_by_provider.sh
new file mode 100755
index 000000000..e897a1062
--- /dev/null
+++ b/examples/language_features/101count_probes_by_provider.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+#  SYNOPSIS
+#    ./101count_probes_by_provider.sh
+#
+#  DESCRIPTION
+#    The second column lists probes' providers.  Count how
+#    many probes there are for each provider.  Use "tail" to
+#    start at the second line of output, since the first line
+#    has the column headers, which we want to ignore.
+
+sudo /usr/sbin/dtrace -l | tail -n +2 | awk '{print $2}' | sort | uniq -c
diff --git a/examples/language_features/102list_probe_arguments.sh b/examples/language_features/102list_probe_arguments.sh
new file mode 100755
index 000000000..3d6eff537
--- /dev/null
+++ b/examples/language_features/102list_probe_arguments.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+#  SYNOPSIS
+#    ./102list_probe_arguments.sh
+#
+#  DESCRIPTION
+#    Some providers provide typed arguments for (some of) their
+#    probes.  Use "dtrace -lv" for a verbose listing to see the
+#    arguments and their types, if any.
+
+sudo /usr/sbin/dtrace -lv -n 'syscall::open:entry'
diff --git a/examples/language_features/110provider_profile.d b/examples/language_features/110provider_profile.d
new file mode 100755
index 000000000..7f9e75b7d
--- /dev/null
+++ b/examples/language_features/110provider_profile.d
@@ -0,0 +1,29 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./110provider_profile.d
+ *
+ *  DESCRIPTION
+ *    The profile provider has basically two kinds of probes:
+ *      - profile probes fire on all CPUs each time period
+ *      - tick probes fire only once each time period
+ *    One can specify either a frequency or a time period.
+ */
+
+/*
+ *  A profile probe is used with higher frequency to sample
+ *  what is executing on the system.
+ */
+profile:::profile-10hz
+{
+	printf("CPU %d: running %s\n", cpu, execname);
+}
+
+/*
+ *  A tick probe is used to fire once to stop data collection.
+ */
+profile:::tick-2sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/120provider_proc.d b/examples/language_features/120provider_proc.d
new file mode 100755
index 000000000..7c442f39f
--- /dev/null
+++ b/examples/language_features/120provider_proc.d
@@ -0,0 +1,37 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./120provider_proc.d
+ *
+ *  DESCRIPTION
+ *    We can track when processes throughout their life cycle.
+ */
+
+proc:::create
+{
+	printf("%s %s\n", probename, args[0]->pr_fname);
+}
+
+proc:::exec
+{
+	printf("%s %s\n", probename, args[0]);
+}
+
+proc:::start
+{
+	printf("%s %s\n", probename, execname);
+}
+
+proc:::exit
+{
+	printf("%s %s\n", probename, execname);
+}
+
+/*
+ *  A tick probe is used to fire once to stop data collection.
+ */
+profile:::tick-10sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/130provider_sched_on_off_cpu.d b/examples/language_features/130provider_sched_on_off_cpu.d
new file mode 100755
index 000000000..0d927bc3d
--- /dev/null
+++ b/examples/language_features/130provider_sched_on_off_cpu.d
@@ -0,0 +1,28 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./130provider_sched_on_off_cpu.d
+ *
+ *  DESCRIPTION
+ *    We can track when processes start and end execution
+ *    on a CPU.
+ */
+
+sched:::on-cpu
+{
+	printf("on CPU %d is %s\n", curcpu->cpu_id, curlwpsinfo->pr_name);
+}
+
+sched:::off-cpu
+{
+	printf("off CPU %d is %s\n", curcpu->cpu_id, args[0]->pr_name);
+}
+
+/*
+ *  A tick probe is used to fire once to stop data collection.
+ */
+profile:::tick-2sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/131provider_sched_enqueue_dequeue.d b/examples/language_features/131provider_sched_enqueue_dequeue.d
new file mode 100755
index 000000000..c773dc908
--- /dev/null
+++ b/examples/language_features/131provider_sched_enqueue_dequeue.d
@@ -0,0 +1,24 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./131provider_sched_enqueue_dequeue.d
+ *
+ *  DESCRIPTION
+ *    We can track when processes are enqueued and
+ *    dequeued on CPUs.
+ */
+
+sched:::dequeue,
+sched:::enqueue
+{
+	printf(" %s %s\n", probename, args[0]->pr_name);
+}
+
+/*
+ *  A tick probe is used to fire once to stop data collection.
+ */
+profile:::tick-2sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/140provider_syscall.d b/examples/language_features/140provider_syscall.d
new file mode 100755
index 000000000..370e7063d
--- /dev/null
+++ b/examples/language_features/140provider_syscall.d
@@ -0,0 +1,20 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./140provider_syscall.d
+ *
+ *  DESCRIPTION
+ *    With the syscall provider, you can probe the entry to
+ *    and return from any system call, which is useful for
+ *    watching how a program moves between user space and the
+ *    kernel.
+ */
+
+/* probe on entry to system call write() */
+syscall::write:entry
+{
+	printf("write %d bytes to fd %d\n", args[2], args[0]);
+
+	exit(0);
+}
diff --git a/examples/language_features/150provider_fbt.d b/examples/language_features/150provider_fbt.d
new file mode 100755
index 000000000..6dd30e264
--- /dev/null
+++ b/examples/language_features/150provider_fbt.d
@@ -0,0 +1,48 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./150provider_fbt.d
+ *
+ *  DESCRIPTION
+ *    Function boundary tracing (fbt) can be used to trace the
+ *    beginning and end of just about any function in the kernel.
+ *    As such, it is very powerful.
+ *
+ *    That said, there are some challenges:
+ *
+ *      - One must know the kernel fairly well.  There may
+ *        be tens of thousands of functions available to trace.
+ *
+ *      - Functions that can be traced will vary from one
+ *        kernel build to another.  For example, a function
+ *        might be inlined in a kernel build, making that
+ *        function not traceable in that build.
+ *
+ *    Also, there are both:
+ *
+ *      - an fbt provider, which supports typed probe arguments
+ *        (seen with "dtrace -lvP fbt")
+ *
+ *      - a rawfbt provider, whose probe arguments are not typed
+ *        nor specially ordered;  traceable functions include
+ *        compiler-generated optimized variants of functions,
+ *        named <func>.<suffix>.
+ */
+
+/* probe on entry to kernel function ksys_write() */
+fbt::ksys_write:entry
+{
+	printf("write %d bytes to fd %d\n", args[2], args[0]);
+}
+
+/* do the same thing with a rawfbt probe, so the args are not typed */
+rawfbt::ksys_write:entry
+{
+	printf("write %d bytes to fd %d\n", arg2, arg0);
+}
+
+fbt::ksys_write:return
+{
+	exit(0);
+}
diff --git a/examples/language_features/160provider_sdt_rawtp.sh b/examples/language_features/160provider_sdt_rawtp.sh
new file mode 100755
index 000000000..92ac621eb
--- /dev/null
+++ b/examples/language_features/160provider_sdt_rawtp.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+
+#  SYNOPSIS
+#    ./160provider_sdt_rawtp.sh
+#
+#  DESCRIPTION
+#    Statically Defined Tracing (SDT) refers to probes placed
+#    in the kernel source code by kernel developers to support
+#    tracing in stable, semantically meaningful terms.  In the
+#    case of Linux, this means tracepoints.
+
+# You can see these tracepoints via the sdt provider.
+sudo /usr/sbin/dtrace -lP sdt
+
+# You can see the exact same probes via the rawtp provider.
+sudo /usr/sbin/dtrace -lP rawtp
+
+# The difference is that the rawtp provider gives DTrace users
+# access to the raw tracepoints exposed by the kernel tracing
+# system, including access to the untranslated arguments of the
+# associated tracepoint events.  Regular tracepoints often expose
+# translated arguments based on the raw arguments that were passed
+# in the tracepoint call.
+
+# For example, the DTrace sched provider implements the "off-cpu"
+# probe by using "rawtp:sched::sched_switch" and the "wakeup" probe
+# by using "rawtp:sched::sched_wakeup".  We can see how the typed
+# arguments for these probes depend on whether we are using the
+# sdt or the rawtp provider:
+
+sudo /usr/sbin/dtrace -lvn :sched::sched_switch | grep args
+sudo /usr/sbin/dtrace -lvn :sched::sched_wakeup | grep args
+
+# Here, the module "sched" is named, but the provider name,
+# expected before the first colon ":", is left blank as a
+# wildcard to pick up both providers with these probes.
diff --git a/examples/language_features/170provider_lockstat.sh b/examples/language_features/170provider_lockstat.sh
new file mode 100755
index 000000000..de7913a82
--- /dev/null
+++ b/examples/language_features/170provider_lockstat.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+
+#  SYNOPSIS
+#    ./170provider_lockstat.sh
+#
+#  DESCRIPTION
+#    The lockstat provider can be used to study lock usage.
+#    For example, here we count how many times spin locks
+#    and adaptive locks are acquired by the command "date".
+
+sudo /usr/sbin/dtrace -qn '
+lockstat:::spin-acquire,
+lockstat:::adaptive-acquire
+/pid == $target/
+{
+	@locks[probename] = count();
+}' -c date
diff --git a/examples/language_features/171provider_io.d b/examples/language_features/171provider_io.d
new file mode 100755
index 000000000..b91ba6cf5
--- /dev/null
+++ b/examples/language_features/171provider_io.d
@@ -0,0 +1,31 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./171provider_io.d
+ *
+ *  DESCRIPTION
+ *    The io provider can be used to study I/O operations.
+ *    For example, here we print whenever an I/O operation
+ *    is started over the course of ten seconds, reporting
+ *    the device name and whether it is a read or write
+ *    operation.  Consult the documentation for more
+ *    information on the probes and their arguments.
+ */
+
+BEGIN
+{
+	printf("%10s %2s\n", "DEVICE", "RW");
+}
+
+io:::start
+{
+	printf("%10s %2s\n",
+	    args[1]->dev_statname,
+	    args[0]->b_flags & B_READ ? "R" : "W");
+}
+
+tick-10s
+{
+	exit(0);
+}
diff --git a/examples/language_features/172provider_ip.d b/examples/language_features/172provider_ip.d
new file mode 100755
index 000000000..dce852fbd
--- /dev/null
+++ b/examples/language_features/172provider_ip.d
@@ -0,0 +1,26 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./172provider_ip.d
+ *
+ *  DESCRIPTION
+ *    The ip provider can be used to study IP communications.
+ *    Here is an example that tracks sends and receives,
+ *    reporting their source and destination addresses for
+ *    10 seconds.
+ *
+ *    Consult the documentation for further information about
+ *    ip probe arguments.
+ */
+
+ip:::send,
+ip:::receive
+{
+	printf("%s: from %s to %s\n", probename, args[2]->ip_saddr, args[2]->ip_daddr);
+}
+
+tick-10s
+{
+	exit(0);
+}
diff --git a/examples/language_features/180provider_cpc.d b/examples/language_features/180provider_cpc.d
new file mode 100755
index 000000000..a2ce8b271
--- /dev/null
+++ b/examples/language_features/180provider_cpc.d
@@ -0,0 +1,52 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./180provider_cpc.d
+ *
+ *  DESCRIPTION
+ *    The cpc (CPU Performance Counter) provider can be used
+ *    profile activity based on hardware performance counters.
+ *
+ *    For a list of cpc probes, use "dtrace -lP cpc".
+ *
+ *    Probe specifications are of the form:
+ *
+ *        cpc:::<event name>-<mode>-<count>
+ *
+ *    The "event name" tells you which counters are available
+ *    on your hardware.
+ *
+ *    The "mode" can be "kernel", "user", or "all", even if
+ *    only "all" is listed.
+ *
+ *    The "count" indicates how many times the event is seen
+ *    before the probe fires.  If the listed "count" is not
+ *    suitable for your purposes, you can specify a different
+ *    value.  It is usually best to start with a higher value,
+ *    decreasing it if there are not enough probe firings,
+ *    rather than starting too low and inundating your system
+ *    with very many probe firings.
+ *
+ *    Here, an event perf_count_sw_cpu_clock-all-1000000000
+ *    was listed by "dtrace -lP cpc".  We tweak the "mode"
+ *    and "count" for our purposes.  The probe will fire every
+ *    300 usecs of kernel activity.  We use aggregations to
+ *    count how many times each call stack is seen.  The
+ *    aggregation will be printed by default when the D
+ *    script exits, after 10 seconds.
+ *
+ *    Consult the documentation for further information about
+ *    cpc probes.
+ */
+
+cpc:::perf_count_sw_cpu_clock-kernel-300000000
+{
+	@[stack()] = count();
+}
+
+/* run for only 10 seconds */
+tick-10s
+{
+	exit(0);
+}
diff --git a/examples/language_features/200built-in-variables-probe.d b/examples/language_features/200built-in-variables-probe.d
new file mode 100755
index 000000000..5d7e97260
--- /dev/null
+++ b/examples/language_features/200built-in-variables-probe.d
@@ -0,0 +1,18 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./200built-in-variables-probe.d
+ *
+ *  DESCRIPTION
+ *    We can get a probe's name components when it fires.
+ *    The fully qualified name is provider:module:function:name,
+ *    which we get with the built-in variables probeprov,
+ *    probemod, probefunc, and probename, respectively.
+ */
+
+syscall:::entry
+{
+	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
+	exit(0);
+}
diff --git a/examples/language_features/201built-in-variables-timestamps.d b/examples/language_features/201built-in-variables-timestamps.d
new file mode 100755
index 000000000..c07ee0456
--- /dev/null
+++ b/examples/language_features/201built-in-variables-timestamps.d
@@ -0,0 +1,31 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./201built-in-variables-timestamps.d
+ *
+ *  DESCRIPTION
+ *    Built-in variables provide timestamps:
+ *
+ *    - timestamp counts nanoseconds since
+ *      some arbitrary point in the past.
+ *      Use differences between values to measure
+ *      elapsed time.  The value is captured only
+ *      once per clause.
+ *
+ *    - walltimestamp counts nanoseconds since
+ *      00:00 Universal Coordinated Time, January 1, 1970.
+ */
+
+dtrace:::BEGIN
+{
+	printf("\n%d %d\n", timestamp, walltimestamp);
+	printf(  "%d %d\n", timestamp, walltimestamp);
+}
+
+dtrace:::BEGIN
+{
+	printf("\n%d %d\n", timestamp, walltimestamp);
+	printf(  "%d %d\n", timestamp, walltimestamp);
+	exit(0);
+}
diff --git a/examples/language_features/202built-in-variables-args.d b/examples/language_features/202built-in-variables-args.d
new file mode 100755
index 000000000..192fff8e1
--- /dev/null
+++ b/examples/language_features/202built-in-variables-args.d
@@ -0,0 +1,28 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./202built-in-variables-args.d
+ *
+ *  DESCRIPTION
+ *    A probe's arguments can be accessed through the built-in
+ *    variables arg0, arg1, arg2, etc.  These are all signed,
+ *    64-bit integers, whose meanings depend on the probe.
+ *
+ *    Some probes have typed arguments args[0], args[1], args[2],
+ *    etc.  To see the types, use "dtrace -lvn $probe".  Their
+ *    meanings are described in the documentation.
+ *
+ *    When arguments are typed, they may also be reordered.
+ *    So there may be no correspondence between, say, arg0
+ *    and args[0].
+ *
+ *    Typically, it is better to use the typed args[] when
+ *    the probe has them.
+ */
+
+syscall::write:entry
+{
+	printf("Write %d bytes to fd %d\n", args[2], arg0);
+	exit(0);
+}
diff --git a/examples/language_features/203built-in-variables-process-info.d b/examples/language_features/203built-in-variables-process-info.d
new file mode 100755
index 000000000..82600ba9e
--- /dev/null
+++ b/examples/language_features/203built-in-variables-process-info.d
@@ -0,0 +1,31 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./203built-in-variables-process-info.d
+ *
+ *  DESCRIPTION
+ *    A number of built-in variables describe the process
+ *    that is running.
+ */
+
+syscall::write:entry
+{
+	printf("\n\n");
+	printf("The CPU is %d (%d).\n", curcpu->cpu_id, cpu);
+
+	printf("\n");
+	printf("The exec name can be accessed through\n");
+	printf("    the struct task_struct: %s\n", curthread->comm);
+	printf("    or a built-in variable: %s\n", execname);
+
+	printf("\n");
+	printf("The execargs are: %s\n", execargs);
+
+	printf("\n");
+	printf("The group id and user id are %d and %d.\n", gid, uid);
+	printf("The process id and thread id are %d and %d.\n", pid, tid);
+	printf("The parent process id is %d.\n\n", ppid);
+
+	exit(0);
+}
diff --git a/examples/language_features/204built-in-variables-uregs.d b/examples/language_features/204built-in-variables-uregs.d
new file mode 100755
index 000000000..55e333218
--- /dev/null
+++ b/examples/language_features/204built-in-variables-uregs.d
@@ -0,0 +1,31 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./204built-in-variables-uregs.d
+ *
+ *  DESCRIPTION
+ *    The uregs[] array can be used to access the current thread's
+ *    saved user-mode register values at probe firing time.  The
+ *    available registers depend on the chip architecture:
+ *
+ *    - x86_64
+ *        R_SP R_PC R_FP R_TRAPNO R_ERR
+ *        R_CS R_DS R_ES R_FS R_GS R_PS R_SS
+ *        R_RSP R_EBP R_RFL R_RIP R_RDI R_RSI R_RAX R_RBX R_RCX R_RDX
+ *        R_ESP R_RBP R_EFL R_EIP R_EDI R_ESI R_EAX R_EBX R_ECX R_EDX
+ *        R_R0 R_R1 R_R8 R_R9 R_R10 R_R11 R_R12 R_R13 R_R14 R_R15
+ *
+ *    - aarch64:
+ *        R_SP R_PC R_PSTATE R_FP
+ *        R_X0 R_X1 R_X2 R_X3 R_X4 R_X5 R_X6 R_X7 R_X8 R_X9
+ *        R_X10 R_X11 R_X12 R_X13 R_X14 R_X15 R_X16 R_X17 R_X18 R_X19
+ *        R_X20 R_X21 R_X22 R_X23 R_X24 R_X25 R_X26 R_X27 R_X28 R_X29
+ *        R_X30
+ */
+
+BEGIN
+{
+	printf("0x%x 0x%x\n", uregs[R_PC], uregs[R_SP]);
+	exit(0);
+}
diff --git a/examples/language_features/300actions-exit.sh b/examples/language_features/300actions-exit.sh
new file mode 100755
index 000000000..fea6cb50d
--- /dev/null
+++ b/examples/language_features/300actions-exit.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+# SYNOPSIS
+#   sudo ./300actions-exit.sh
+#
+# DESCRIPTION
+#   The exit() action terminates the script, returning an
+#   unsigned 8-bit integer value.
+
+/usr/sbin/dtrace -n '
+BEGIN
+{
+	x = 123;
+	y = 456;
+	exit(x < y ? x : y);
+}'
+
+echo $?
diff --git a/examples/language_features/301actions-print.d b/examples/language_features/301actions-print.d
new file mode 100755
index 000000000..0b3742644
--- /dev/null
+++ b/examples/language_features/301actions-print.d
@@ -0,0 +1,32 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./301actions-print.d
+ *
+ *  DESCRIPTION
+ *    There are multiple ways to examine data values.
+ */
+
+BEGIN
+{
+	/* printf() is a C-like formatted print */
+	/* note:  %d can be used with any size of integer */
+	printf("%c %d %s\n", 'a', 1234ll, "hello");
+
+	/* trace() uses data-type information to format */
+	trace('a');
+	trace(1234);
+	trace("hello");
+
+	/* tracemem() dumps a specified number of bytes */
+	tracemem(`linux_banner, 64);
+
+	/*
+	 * print() uses data-type information to print and annotate
+	 * contents at a pointer
+	 */
+	print(curthread);
+
+	exit(0);
+}
diff --git a/examples/language_features/302actions-strings.d b/examples/language_features/302actions-strings.d
new file mode 100755
index 000000000..097eff064
--- /dev/null
+++ b/examples/language_features/302actions-strings.d
@@ -0,0 +1,45 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./302actions-strings.d
+ *
+ *  DESCRIPTION
+ *    There are functions to manipulate strings.
+ */
+
+BEGIN
+{
+	/* find the length of a string */
+	printf("length of 'abcde' is %d\n", strlen("abcde"));
+
+	/* various other functions also resemble libc */
+	printf("text starts with first 'd': %s\n", strchr("abcdefedbca", 'd'));
+	printf("text starts with last 'd': %s\n", strrchr("abcdefedbca", 'd'));
+	printf("text starts with 'def': %s\n", strstr("abcdefedbca", "def"));
+
+	/* break a string up into tokens */
+	printf("token #1: %s\n", strtok("hello world", " "));
+	printf("token #2: %s\n", strtok(NULL, " "));
+
+	/* join (concatenate) strings */
+	printf("join 'abc' and 'def': %s\n", strjoin("abc", "def"));
+
+	/* dump part of a string */
+	printf("start at char #4: %s\n", substr("abcdefghij", 4));
+
+	/* dump part of a string, only 2 chars */
+	printf("start at char #4: %s\n", substr("abcdefghij", 4, 2));
+
+	/* find index of a substring */
+	printf("found at char #%d\n", index("abcdefghij", "def"));
+	printf("found at char #%d\n", rindex("abcdefghij", "def"));
+	printf("found at char #%d\n", index("abcdefghij", "XXXX"));
+
+	/* convert an integer to a string */
+	printf("123000 + 456 = %s\n", lltostr(123000 + 456));
+
+	exit(0);
+}
diff --git a/examples/language_features/303actions-strings-paths.d b/examples/language_features/303actions-strings-paths.d
new file mode 100755
index 000000000..9588d08f5
--- /dev/null
+++ b/examples/language_features/303actions-strings-paths.d
@@ -0,0 +1,25 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./303actions-strings-paths.d
+ *
+ *  DESCRIPTION
+ *    There are functions to manipulate strings, specifically path names.
+ */
+
+BEGIN
+{
+	/* find the base name of a path */
+	printf("base is %s\n", basename("/usr/sbin/dtrace"));
+
+	/* find the directory of a path */
+	printf("directory is %s\n", dirname("/usr/sbin/dtrace"));
+
+	/* clean up a path name */
+	printf("cleaned up path is %s\n", cleanpath("////usr/bin/../sbin/././//dtrace"));
+
+	exit(0);
+}
diff --git a/examples/language_features/304actions-system.d b/examples/language_features/304actions-system.d
new file mode 100755
index 000000000..001566808
--- /dev/null
+++ b/examples/language_features/304actions-system.d
@@ -0,0 +1,22 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+#pragma D option destructive
+
+/*
+ *  SYNOPSIS
+ *    sudo ./304actions-system.d
+ *
+ *  DESCRIPTION
+ *    One can launch system calls from within D script,
+ *    but this must be explicitly allowed with the "destructive"
+ *    option or dtrace -w switch.
+ */
+
+BEGIN
+{
+	system("ls");
+	system("echo hello world");
+
+	exit(0);
+}
diff --git a/examples/language_features/305actions-progenyof.d b/examples/language_features/305actions-progenyof.d
new file mode 100755
index 000000000..2aa3e8ea3
--- /dev/null
+++ b/examples/language_features/305actions-progenyof.d
@@ -0,0 +1,20 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./305actions-progenyof.d
+ *
+ *  DESCRIPTION
+ *    One can test whether one is progeny of another process.
+ */
+
+BEGIN
+{
+	printf("I am%s progeny of pid 1234\n", progenyof(1234) ? "" : " not");
+	printf("I am%s progeny of myself\n", progenyof(pid) ? "" : " not");
+	printf("I am%s progeny of my parent\n", progenyof(ppid) ? "" : " not");
+
+	exit(0);
+}
diff --git a/examples/language_features/306actions-speculations.d b/examples/language_features/306actions-speculations.d
new file mode 100755
index 000000000..7e0d21370
--- /dev/null
+++ b/examples/language_features/306actions-speculations.d
@@ -0,0 +1,57 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./306actions-speculations.d
+ *
+ *  DESCRIPTION
+ *    In DTrace, one can write output speculatively, deciding at a
+ *    later time whether to commit or discard the speculative output.
+ */
+#pragma D option nspec=2
+
+BEGIN
+{
+	/* create two speculations */
+	s1 = speculation();
+	s2 = speculation();
+}
+
+BEGIN
+{
+	/* the clause has "speculate()" before data recording */
+	speculate(s1);
+	printf("one\n");
+}
+
+BEGIN
+{
+	speculate(s2);
+	printf("two\n");
+}
+
+BEGIN
+{
+	speculate(s1);
+	printf("three\n");
+}
+
+BEGIN
+{
+	speculate(s2);
+	printf("four\n");
+}
+
+BEGIN
+{
+	commit(s1);  /* commit "one" "three" output */
+	discard(s2);  /* discard "two" "four" output */
+}
+
+BEGIN
+{
+	/* cannot be in same clause as commit/discard */
+	exit(0);
+}
diff --git a/examples/language_features/307actions-callstack.d b/examples/language_features/307actions-callstack.d
new file mode 100755
index 000000000..8e3d6fe47
--- /dev/null
+++ b/examples/language_features/307actions-callstack.d
@@ -0,0 +1,54 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./307actions-callstack.d
+ *
+ *  DESCRIPTION
+ *    In DTrace, one can get information about the call stack.
+ */
+
+/* have a probe fire somewhere in the kernel */
+fbt::ksys_write:entry
+{
+	/* dump the kernel call stack */
+	stack();
+
+	/* a built-in variable gives the number of frames */
+	printf("%d frames\n", stackdepth);
+
+	/* another built-in variable gives the caller PC */
+	printf("second frame is the caller %p\n", caller);
+
+	/* we can get the symbolic name of its module */
+	printf(  "  module   ");  mod(caller);
+
+	/* we can get the symbolic name of its function */
+	printf("\n  function "); func(caller);
+
+	/* sym() is an alias for func() */
+	printf("\n  == symbol");  sym(caller);
+
+	/*
+	 * Similarly, we can also get the user-space call stack
+	 * through ustack().  The related built-in variables are
+	 * ustackdepth and ucaller.  Conversion to symbolic names
+	 * can be made via umod(), ufunc(), usym(), and uaddr().
+	 * User-space call stacks face a few challenges:
+	 *
+	 * - The BPF helper functions rely on frame-pointer
+	 *   chasing, which can be impaired or even incorrect
+	 *   unless -fno-omit-frame-pointer is specified.
+	 *
+	 * - Conversion to symbolic names does not take place when
+	 *   the probe fires but later, in user space, when results
+	 *   are printed.  It is possible that the user application
+	 *   has already terminated and the information about its
+	 *   address space gone.
+	 *
+	 * - For a stripped executable, you must specify
+	 *   --export-dynamic when linking the program.
+	 */
+
+	exit(0);
+}
diff --git a/examples/language_features/310actions-alloca-copy.d b/examples/language_features/310actions-alloca-copy.d
new file mode 100755
index 000000000..1a48c696b
--- /dev/null
+++ b/examples/language_features/310actions-alloca-copy.d
@@ -0,0 +1,95 @@
+#!/usr/sbin/dtrace -qs
+
+#pragma D option strsize=32
+
+/*
+ *  SYNOPSIS
+ *    sudo ./310actions-alloca-copy.d
+ *
+ *  DESCRIPTION
+ *    A DTrace program has scratch memory that it manages
+ *    for its own purposes.  The program can allocate scratch
+ *    memory as well as copy into, out of, and between buffers.
+ *    It is automatically freed at the end of each clause.
+ */
+
+/* alloca */
+BEGIN
+{
+	/* alloca() a string */
+	ptr = (string *) alloca(32);
+
+	/* set its contents (truncated to strsize chars, including NUL) */
+	*ptr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
+
+	/* print it */
+	trace(*ptr);
+
+	/* end of the clause:  ptr is freed */
+}
+
+/* bcopy */
+BEGIN
+{
+	/* alloca() a string */
+	ptr = (string *) alloca(32);
+
+	/* copy from kernel memory to scratch memory */
+	bcopy(`linux_banner, ptr, 32);
+
+	/* print it */
+	printf("\n%s", *ptr);
+
+	/* end of the clause:  ptr is freed */
+}
+
+/* copyinto */
+syscall::write:entry
+{
+	/* alloca() a string */
+	ptr = (string *) alloca(32);
+
+	/* copy from user space into scratch memory */
+	copyinto(arg1, 32, ptr);
+
+	/* print it */
+	printf("\n%s to fd %d, %d bytes", *ptr, arg0, arg2);
+
+	/* end of the clause:  ptr is freed */
+}
+
+/* copyin */
+syscall::write:entry
+{
+	/* copy from user space to scratch memory, allocating the pointer */
+	ptr = copyin(arg1, 32);
+
+	/* print it */
+	printf("\n%s to fd %d, %d bytes", *ptr, arg0, arg2);
+
+	/* end of the clause:  ptr is freed */
+}
+
+/* copyinstr */
+syscall::write:entry
+{
+	/* copy string from user space to scratch memory, allocating the pointer */
+	str = copyinstr(arg1);
+
+	/* print it */
+	printf("\n%s to fd %d, %d bytes", str, arg0, arg2);
+
+	/* end of the clause:  ptr is freed */
+}
+
+/*
+ * There are also copyout() and copyoutstr() functions, that may be
+ * used to copy from scratch memory to user-space buffers.  Since they
+ * alter the behavior of the user code, the "destructive" option -w
+ * must be specified.
+ */
+
+syscall::write:entry
+{
+	exit(0);
+}
diff --git a/examples/language_features/311actions-rand.d b/examples/language_features/311actions-rand.d
new file mode 100755
index 000000000..54500fb3b
--- /dev/null
+++ b/examples/language_features/311actions-rand.d
@@ -0,0 +1,25 @@
+#!/usr/sbin/dtrace -qs
+
+/*
+ *  SYNOPSIS
+ *    sudo ./311actions-rand.d
+ *
+ *  DESCRIPTION
+ *    The rand() function generates a random integer.
+ */
+
+BEGIN
+{
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+	printf(" %3d\n", rand() & 0xff);
+
+	exit(0);
+}
diff --git a/examples/language_features/500aggregations-intro.d b/examples/language_features/500aggregations-intro.d
new file mode 100755
index 000000000..54b5cbe6b
--- /dev/null
+++ b/examples/language_features/500aggregations-intro.d
@@ -0,0 +1,24 @@
+#!/usr/sbin/dtrace -s
+
+#pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./500aggregations-intro.d
+ *
+ *  DESCRIPTION
+ *    Aggregations can be used to collect statistical data on
+ *    some value.  Results are printed by default when the
+ *    script terminates.
+ */
+
+tick-20hz
+{
+	/* do not even bother naming the aggregation;  just "@" */
+	@ = count();
+}
+
+tick-1sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/501aggregations-names-keys.d b/examples/language_features/501aggregations-names-keys.d
new file mode 100755
index 000000000..06ede5301
--- /dev/null
+++ b/examples/language_features/501aggregations-names-keys.d
@@ -0,0 +1,19 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  SYNOPSIS
+ *    sudo ./501aggregations-names-keys.d
+ *
+ *  DESCRIPTION
+ *    Aggregations can be named or use keys.
+ */
+
+tick-20hz
+{
+	@my_count[(timestamp % 2 == 0) ? "even" : "odd"] = count();
+}
+
+tick-1sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/502aggregations-basic-funcs.d b/examples/language_features/502aggregations-basic-funcs.d
new file mode 100755
index 000000000..b55a42117
--- /dev/null
+++ b/examples/language_features/502aggregations-basic-funcs.d
@@ -0,0 +1,26 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./501aggregations-basic-funcs.d
+ *
+ *  DESCRIPTION
+ *    Aggregations can include basic statistical functions.
+ */
+
+tick-20hz
+{
+	@my_count["count"] = count();
+	@my_sum["sum"] = sum(timestamp);
+	@my_avg["average"] = avg(timestamp);
+	@my_stddev["standard deviation"] = stddev(timestamp);
+	@my_min["minimum"] = min(timestamp);
+	@my_max["maximum"] = max(timestamp);
+}
+
+tick-1sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/503aggregations-stack.d b/examples/language_features/503aggregations-stack.d
new file mode 100755
index 000000000..3e297c34b
--- /dev/null
+++ b/examples/language_features/503aggregations-stack.d
@@ -0,0 +1,24 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./503aggregations-stack.d
+ *
+ *  DESCRIPTION
+ *    An interesting key to use is "stack()", giving you
+ *    information, for example, about hot kernel call stacks.
+ *    Each distinct kernel call stack found will be reported
+ *    along with the number of times it was encountered.
+ */
+
+tick-20hz
+{
+	@[stack()] = count();
+}
+
+tick-1sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/504aggregations-printa.d b/examples/language_features/504aggregations-printa.d
new file mode 100755
index 000000000..6867511e2
--- /dev/null
+++ b/examples/language_features/504aggregations-printa.d
@@ -0,0 +1,29 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./504aggregations-printa.d
+ *
+ *  DESCRIPTION
+ *    While aggregations are printed by default when the D
+ *    script terminates, it can be useful to print aggregations
+ *    explicitly using the printa() function -- either to use
+ *    detailed formatting or if results should be printed
+ *    while the script is still running.  In addition to the
+ *    usual formatting directives used by printf(), printa()
+ *    also uses "@" directives for the aggregation values.
+ */
+
+tick-20hz
+{
+	@["key"] = count();
+}
+
+tick-1sec
+{
+	printa("KEY BEFORE VALUE: %s %@d\n", @);
+	printa("VALUE BEFORE KEY: %@d %s\n", @);
+	exit(0);
+}
diff --git a/examples/language_features/505aggregations-quantize.d b/examples/language_features/505aggregations-quantize.d
new file mode 100755
index 000000000..5ae382843
--- /dev/null
+++ b/examples/language_features/505aggregations-quantize.d
@@ -0,0 +1,65 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./505aggregations-quantize.d
+ *
+ *  DESCRIPTION
+ *    While avg(), stddev(), min(), and max() are useful for
+ *    characterizing the distribution of values crudely, one
+ *    may also be interested in more detail on a distribution.
+ *
+ *    Aggregations can count by value after the value has been
+ *    "quantized" -- that is, grouped into bins.
+ */
+
+BEGIN
+{
+	/* time origin at the beginning of the script's execution */
+	t0 = timestamp;
+
+	/* for this example, use some dummy value that will change in scale */
+	dummy = t0;
+}
+
+tick-20hz
+{
+	/*
+	 * If you have no sense for the distribution of values --
+	 * not even of the scale -- then quantize(val) can be a
+	 * good starting point.  Its only input parameter is the
+	 * value.  Bins are powers of two -- you reduce values
+	 * log2() -- giving you a sense of the scale of the values.
+	 */
+	@crude = quantize(dummy >>= 1);
+
+	/*
+	 * But perhaps you know the scale and want to chop some
+	 * range of values up linearly.  So we use lquantize().
+	 */
+	@linear = lquantize(
+	    (timestamp - t0) / 1000000,	/* number of msecs since D script start */
+	    0,				/* lower bound */
+	    2000,			/* upper bound (msecs in 2 secs) */
+	    200);			/* number per bin */
+
+	/*
+	 * Finally, and this is a little complicated, what if you
+	 * liked the original, logarithmic quantization, but you
+	 * just want a little more detail.  Then, there is a
+	 * log-linear quantization.
+	 */
+	@log_linear = llquantize(
+	    dummy,	/* number of msecs since some arbitrary time in the past */
+	    100,	/* use log10() */
+	    3,		/* lower bound is 10 to the 3 = 1000 */
+	    5,		/* upper bound is 10 to the 9 = 1000000000 */
+	    4);		/* number of steps per logarithmic range */
+}
+
+tick-2sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/506aggregations-clear-trunc.d b/examples/language_features/506aggregations-clear-trunc.d
new file mode 100755
index 000000000..26314d8a8
--- /dev/null
+++ b/examples/language_features/506aggregations-clear-trunc.d
@@ -0,0 +1,63 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./506aggregations-clear-trunc.d
+ *
+ *  DESCRIPTION
+ *    Here, we show clear() and trunc(), used with aggregations.
+ *
+ *    One reason to use printa() is to get aggregation values
+ *    periodically while the D script is executing.  In that
+ *    case, however, you may want to reset the aggregations.
+ *    There are two ways of doing so.
+ */
+
+tick-20hz
+{
+	/* in this example, consider two aggregations */
+
+	/*
+	 * "parity" counts whether the timestamp is even or odd.
+	 * In each one-second time interval, both cases should
+	 * get some values.
+	 */
+	@parity[(timestamp & 1) ? "odd" : "even"] = count();
+
+	/*
+	 * "low_bits" counts how often the low bits (0-255) appear.
+	 * It is reasonable that some keys will not reappear.
+	 */
+	@low_bits[timestamp & 0xff] = count();
+}
+
+tick-1sec
+{
+	/*
+	 * Every second, we print the values for the recent
+	 * one-second interval.
+	 */
+	printa("parity: %-4s %@2d\n", @parity);
+	printa("low bits: %3d %@d\n", @low_bits);
+
+	/*
+	 * We clear out the "parity" values, leaving the keys,
+	 * since almost surely those keys will recur.  And if
+	 * a key ends up with no counts, we want to know about it!
+	 */
+	clear(@parity);
+
+	/*
+	 * We trunc() (truncate) "low_bits", however, since keys
+	 * might not reoccur.  Unused keys take up memory and
+	 * pollute the periodic output.
+	 */
+	trunc(@low_bits);
+}
+
+tick-4sec
+{
+	exit(0);
+}
diff --git a/examples/language_features/507aggregations-trunc5.d b/examples/language_features/507aggregations-trunc5.d
new file mode 100755
index 000000000..ca5fdae02
--- /dev/null
+++ b/examples/language_features/507aggregations-trunc5.d
@@ -0,0 +1,50 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./507aggregations-trunc5.d
+ *
+ *  DESCRIPTION
+ *    Here, is another use of trunc() -- with an additional
+ *    argument to focus attention on the top values.
+ */
+
+BEGIN
+{
+	/*
+	 * The mask will change size.  When it is wide, it will
+	 * spread values over many keys.  When it is narrow, it
+	 * will concentrate values over a few keys.  So, some
+	 * keys will get many values, while others will get few.
+	 */
+	mask = 255;
+}
+
+tick-100hz
+{
+	/* the aggregation */
+	@[timestamp & mask] = count();
+
+	/* update the mask */
+	mask >>= 1;
+	mask = (mask == 0) ? 255 : mask;
+}
+
+tick-1sec
+{
+	printf("entire result\n");
+	printa("    %3d %@3d\n", @);
+
+	trunc(@, 5);
+
+	printf("top 5 keys\n");
+	printa("    %3d %@3d\n", @);
+
+	/*
+	 * On exit, we will no longer print the aggregation
+	 * by default, since it was just printed.
+	 */
+	exit(0);
+}
diff --git a/examples/language_features/508aggregations-normalize.d b/examples/language_features/508aggregations-normalize.d
new file mode 100755
index 000000000..5c2429f74
--- /dev/null
+++ b/examples/language_features/508aggregations-normalize.d
@@ -0,0 +1,49 @@
+#!/usr/sbin/dtrace -s
+
+# pragma D option quiet
+
+/*
+ *  SYNOPSIS
+ *    sudo ./508aggregations-normalize.d
+ *
+ *  DESCRIPTION
+ *    Here, is another use of trunc() -- with an additional
+ *    argument to focus attention on the top values.
+ */
+
+BEGIN
+{
+	treport = timestamp;
+	ttick = timestamp;
+}
+
+/* add the number of nanoseconds since the last tick */
+tick-100hz
+{
+	@ = sum(timestamp - ttick);
+	ttick = timestamp;
+}
+
+/* report at erratic intervals */
+tick-3100ms,
+tick-3600ms
+{
+	/* determine number of usecs since last report */
+	this->us_since_last = (timestamp - treport) / 1000;
+	treport = timestamp;
+	printf("%8d usecs since the last report\n", this->us_since_last);
+
+	/* normalize the total number of nsecs by the number of usecs */
+	normalize(@, this->us_since_last);
+
+	/* report aggregation (do not worry about formatting) */
+	printa(@);
+
+	/* clear the aggregation before resuming */
+	clear(@);
+}
+
+tick-12sec
+{
+	exit(0);
+}
-- 
2.47.3

