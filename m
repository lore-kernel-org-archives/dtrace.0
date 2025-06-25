Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17935942
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825283; cv=fail; b=nvsDm34fcyRgAuL9tV6YrFi+OQit67c3QNKlxugBNsKJC1ojMY5wZjyKTU9yUL2kI6TrHGInlRTi3mxf9befvwPy8HJS70rzRHbwk9mepVm3OanPAeAWIazOPypXE3ZineKFHSAJ5nyg5NQeONbbHZDrX+8cW/ZAwtvTq8ZEOU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825283; c=relaxed/simple;
	bh=fF75VHN0cY4KgpsF7BU0qfoSgaIDQqna21QdQZ1qrAw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QfwnLoC4r721sWHn86ATIsThf/2UdC1W/b2AbVIYKAMqtkwS5hIRYTKCuMNlapZwpHUcm1zqW4IRXzOyc9Kdn5GGZiqOxMSTwFNAR3OtqrWC70YZYxqKrFkc1aMOiwTjnUFn+J9PkbzQUYSozpxe6lQ0VNv8fGQnvRfa853sgsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jDp1pj7E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kWMUeQiE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jDp1pj7E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kWMUeQiE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMif1Y019163
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eb80a7aRYC/1NdzCPp
	pbyG/xuD0GTB+kebSJjWeleAs=; b=jDp1pj7EUpVx6QsSwrczwRn1KZ80Z9Ynuh
	ONoPW8AXH1Kuf5eINnRdAVDzLoBNWl9RaL9n8faY7y8+38HRk38t0u9ERr82MqT3
	xUdsr0NB1gMOTHd0ny2CMzS+be4dzS6qn4RcXVCedXmxTGrUzsiJYaCaXlRAIYhg
	+9rH3BHpw3/1C7DXnK5kG3px7BVj/tBKViZ6k12i2wATz/ZfbDK0KqEcHXnbErLr
	DZMkglJY5zmzWoAkq/4M9nO+wKgLANjlKO8wh7+zWSEL7L9C480cTAt9M9Tec/cV
	Jjqk/2Utm0z28w++9P4PCaWyca6mo0ikOHgY49d8UkBqBVhjTGiQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPo5007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmjU3JgnXTQIDLAcjRzo3dbYLJJau1usfnl53voYkC4cH4YPPJfrQYUr2IAtLUjFsGRPZH+jccLqojYaPIUt5nbJNdBSbF1Y82sQHWzviGtPnE+mNT1GS8OIoaiTGH4tLS2q8OaJD4WIDkeDwQXf/CPsJCRo3hfe4aiGT+gC9wtMkPLYmwvh2vJrf9XMtzCt1dXufPeOSmSp9Gdm70mLiAnS5QA0IOQHDea7vMEg+gFZz1m3Dfp4RWfris7p3gWG1jOnLHXz1nzWlxXBhD90DRMJ2BvnyBpvaZrkHievRShSwmgpTPr7IOtrfue6OIVR9TjotUGeagCjZnjv5MFTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb80a7aRYC/1NdzCPppbyG/xuD0GTB+kebSJjWeleAs=;
 b=gAI5E7obSTxM4SiNuG8lfYbJq5gkBQg+xk0/WiO2B8Tya7ceOFXJYkSG+r8Bm/Mx/W3A/NHNQ5z9T9zYNAYQljcX7AVPNLuXR4wjEpTyVWU7b+Z4WE2lA6/guhkw2i2VtQ7PM2Nwm89Jp5E1BWkOxMFOC7dl0EcXgFEU1nWbobA/L234Yp9io2+zNVi0qUlc/67GuQJGACIuwfINUubfB627kS6SkdoRSbvWBnxUJMnq/B7NTpELEOOCDPTtSAKXo84sQSkLOFY5eD0WdpDP0HPqazVvr7H12f10jrPolDkY6ebMVKXWFceOO6GVBkuW+ft0nOTcnxIGhebnKTRAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb80a7aRYC/1NdzCPppbyG/xuD0GTB+kebSJjWeleAs=;
 b=kWMUeQiESOuFFsKrnUP1owBKMBHkcaf3bTCv5UecsxbdDua5IE6rEVAq0vr71xi8WL8ClN0VCECfwtAoEUpCtLM9um1iz/3uAAhLPlnLGNAaLg4nbyD9ln2gYkos8lRallO2clxuEvuGuabgDOhN0rTHe4EPXtQAXZu5XadzAl0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 06/14] test: caller and stackdepth tests for rawtp provider
Date: Wed, 25 Jun 2025 00:20:59 -0400
Message-Id: <20250625042107.13571-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dc614e-d1d3-4171-c57e-08ddb39fbb52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2RxlE/aoILvmxFx/7RLKYIMWM2kwpTrOhkGQ/NZyuwGKzfARzQrt0Bhnjq5B?=
 =?us-ascii?Q?77kJo1I+J9T/AIr5L71bYYKCKi+dufgp2z9M3gNsp2l88dRj73MQDTktD4nL?=
 =?us-ascii?Q?15ZkqRbCudPo8qSId7GsUZdkF7J0I0LFEcybuJKUsAlqvuwtCK1yazgF4PwP?=
 =?us-ascii?Q?SS+U796vW4aDY4ZHrUomZAANJGtyAthQrkU9qFp+xTuaehSAB/HT+opIuXUF?=
 =?us-ascii?Q?4oUyVD76y3BFVYpUC/+5luoLs3S2XyoNFXdEzEIUX2KemjGImetGBlmthmdD?=
 =?us-ascii?Q?de57SgYV7EY2kHzO+T27QwmIrWLldFHnz0yx/td3yxgbjvNNpmF1pU7H6xjq?=
 =?us-ascii?Q?AEWG75Pl8WdlEvdwm8XMeHtZa0bYcod1Bw4fQ26vewe+0tptsLcJYpqXZKio?=
 =?us-ascii?Q?F1OpkEyEg86R9iWdkx94t2L70+6w/a7yQDuMJTH/B6ZoJ0XkVgmab/T0vWJM?=
 =?us-ascii?Q?CY0GO82WPGEVw0kDRR0ADQU7nvT4518ci4RgJ3/w0G+NrvyOQF339wyafeqw?=
 =?us-ascii?Q?Gx878AFIRd1bGknzJdcsu76uVnCf4ccLS9FFplg+/W4AmpgUYgjoOvl9M67V?=
 =?us-ascii?Q?ZODcdmQt7VtrzoP14O9rSW0MujLAcdN4/rt6bJRMsQyONSNAU5bCT4JoP1oN?=
 =?us-ascii?Q?cLCGjTnBPwiGa939dqUDeGgv0K2iGkC/WiY/h2/+Hdx87RZTbRDDkJDo71V0?=
 =?us-ascii?Q?JF1F5tujeVnZgzRkOybVeh4/bAQIsHY4vOf/ncigNw7urxuoPTZpPhEv1Eym?=
 =?us-ascii?Q?dTwbGnVdmA3+az24jhrgX5uZV0o8pXuFhP6HUKX43+LdglDpgwUerCM0wnvx?=
 =?us-ascii?Q?4DU8sS7NqPDphwHixIUwVS/XUP6+QR1LLpa/JHH8PnPVCfiBzheOxCF2y/dY?=
 =?us-ascii?Q?7KwxU5UnodgJcapnIsCysxDqOKKYAsjx+qpokdGB1Io0Aql9r+UTmehuVzBX?=
 =?us-ascii?Q?Tk6vxME8H70Ds72sgXcHvhvu1HUlbx91jfn35IUwXUEf9x94t3CV17Iql6h1?=
 =?us-ascii?Q?XRzmvwXvuAvhaU9N1J6cuWjUpejHCNWTHM1u3IcQesMGmXXRr3UW47qPX9et?=
 =?us-ascii?Q?oaiJHmKvLmnhQRbUPwhlNQCJ5Gw/r3hOJu8mJNPW6SU5CeLCAPT0d/tmX4hP?=
 =?us-ascii?Q?TJktLgF1GPAKa7KbrrT1O9iHvDfAKPerz1B3d5aFi1WCmDIZyCldT/zaSFre?=
 =?us-ascii?Q?jHfn04OYTBMxZghxzoZHP9pDmkXiK+LgksBXY6ceM5OfzffBSJFeuKgmATWY?=
 =?us-ascii?Q?XsACZsaCVvlxUQYhLf1539MEJsP4v2itRFJHutKy6bqc+rhtmnDj9ziSJi0g?=
 =?us-ascii?Q?eRwANheWEAZMd/g8yjJ3EzT6ZABRNAQuqMBRg9qs5nc28M3sDYMvjj6AIoAH?=
 =?us-ascii?Q?fOaAexvt0Tf3k/MDOd3DpSSOQ5SN7SB1K8VvW/VBOQ8ZDWGMpBZFaPCHDO9E?=
 =?us-ascii?Q?h4zroCEnpMM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fCNECnCR3DJsgu0xIfrckfWW0TQqJmNOC3tKOmJw6Z1tvDGOgfAoota4tQmf?=
 =?us-ascii?Q?3u7xjUWsCxCRf53YhJ4fsn5peQvfOxBEl6K0eD7cCLRuxf6eTKxLYQoh8FKY?=
 =?us-ascii?Q?tngvpTj4o3XVazTb8d4J/QHR1CcG0WfqR1YxbCRguEsuUwmUXxugbxbaDvKW?=
 =?us-ascii?Q?ifTIi3vglhlBKvLj9usHm8dYXppsYcdLYBJ03HTeDXVmZrNgmp4MVrSThLa/?=
 =?us-ascii?Q?lMo4M1tL/LbSk/PgILUagdEFCXDAH7Ev6hbNZi7rQjBM1u0Fahp3JOKx7mST?=
 =?us-ascii?Q?LA6lL5CCxJJBLyKHqKe2yLI7VI7SfwoIaM9Kcqo5mr9eibX3HSWgO5KFsnDW?=
 =?us-ascii?Q?yburLPpxctyZhl+RlrqAcWUV/j2FtCggBbadkNGoMlJRO4IVxn+f3TD6MYbr?=
 =?us-ascii?Q?WNsvxukDEu5zqTrhoOlMqtTiUShDy2cxf2T0aFMHh/T5iRO+rbVWn29ZvTPE?=
 =?us-ascii?Q?5ENXHZ0iWzy3GXoERQiZ2EKJqE6iQKfs5ewLOlKC1Ovu6t8iHErk8Ix2XRpO?=
 =?us-ascii?Q?EoJPXEbVYs2wDO+8pT5h70d6fDkf0C05dmNiiyYyPley6R1Biha3GtjH0XBI?=
 =?us-ascii?Q?9MFIa2xkLz9J89EzywV/OrUak3bgLN6FgMTWVV6V4yFxkdJUIPsEF7IheYKG?=
 =?us-ascii?Q?mUexa5GQ/g8fjgcErqkMFkoSr4DgRATh+7yZwIgVPnOSA38La/k+aHziQUVJ?=
 =?us-ascii?Q?YOsNDqi6dpIdqRedgSiwwg5IQbA72pcbX17H8e/+VjpLA0D0nrW2GWA6rmY6?=
 =?us-ascii?Q?tWKRVVaCRMqGIMYBLErVocteZNuQdHgkmw/KFtr+6l6bapWgtpHCiQPkjsqY?=
 =?us-ascii?Q?cjEfEXKzCq6dF0AZn2bPpHBAumiQ8P+fbMbWtEUmq6rxpIo5JZ4Vg7PSvnQb?=
 =?us-ascii?Q?9viacsUH1okmmt9sA5KblrsfLg3U800U0uOjpZJqpA0cgv+vLn+8/i3I1gHG?=
 =?us-ascii?Q?TFurs6/Jps+bPcfSuJKUTKziNFabpnbPlu5tE43P47zsuNhe3RIYaeMyGVP+?=
 =?us-ascii?Q?MQlXIS+TbaRw5ILP/iZwBoDKuq5iVdUhT6iCYOPD7BCoaidTcRKh+VmoZ7jw?=
 =?us-ascii?Q?CbIDqGcrLCh/d95g3o2HXmLrZftgtF0A0hb6G8JUiLkAlkJHSdJV7lUXLHfF?=
 =?us-ascii?Q?kb9Q+Aw0yhLiManOL5xXxRS+Ljhi1RIeQ+mpZvCSFYDqen76ZzluKz0sej9G?=
 =?us-ascii?Q?NWxsG0mV7ax5SIvVvX2tBBu2Rn27INl0FHu7vhV2VqVkYqP25Ya1vqYbqV/7?=
 =?us-ascii?Q?WbFUQ/N+TZpIH4lPVaLO2pMfykogZeO6fZ/t99xipvmJLp+DcnjB9xrpzaEE?=
 =?us-ascii?Q?HY8/QvSlmIWh0epgyLQGUFBdyEyj6W/u2bV301ZIwV6TA2ljMFBpOjQMeVkB?=
 =?us-ascii?Q?wP4LbPipk2/4IYOWD6ygUuQSlVwAQHuNQct+ATFRMsuEm/erSypG2KfO+udF?=
 =?us-ascii?Q?H5yU9XzzyL5WgyqAq8agQpz3Ga0v5N/atphzZjPiBRkOWzs5PbVuBwbIj9GV?=
 =?us-ascii?Q?tIYfYxAfHSnFV1Sb0HB7HGrKaBYrx2FLf7B5LrWggwLX8TVppOSdoDomnXsj?=
 =?us-ascii?Q?yJQafZ7I1PmHEstH816PrN/iPdFwqdkvqKZAkYws?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yXE+AVQ4h2WtGLL0yf/zgEspqOYu/HFx8C1Y/qgt6l8AhXmSECsu+z1vU9WU9m5aVBUdkObrLYTPd2kWO2k6neQGMRyzsjyaUOsNdK3KyFMBc+f6tRc8xBnrpVVwadenbgk1z5J2deHtHt3Ep0ArqTaOw1e/8uV8PskiP6XurM1pPFIrs0Kpow/CXY4TtCtCH/UkmAyl6Ghu+KmORJ/utov5MiZK40M7rdyB39nRnTrXcwuOulxrRq/uXO7XGIiOqZVlktrm4KeFPUZRyvYWgMENPNWpBiAdFn0Fgd7+CIwaHaKsthPchdUPY3vk2reztdqSodBQEUbn6M2l0tOR/Mcmf37dbnOz+BYj4eAlE7vcFY5Ag4dFsTxUmD0rED746dOx9/jUOjPXwAHikTX65YTHRf2qeC8ofh6PoefzUF00gi3MmXC/gVhegWgCF+6thEb5w7zuf4ZZy2mmz+E9711uVVhQFvwZp4xwlMhSYXLVOo/pa8e4vurgaAo8YT3ffAEBNcbLCuoCCbcOQ5lsUs2PnYbxU4yXrvHofWBrXOVNkWNLIAoXPKFm6YuVT7NSXkixZpZr0TbU/21P5tBWkW/CfTV/niYTm9cgb2eG4w8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dc614e-d1d3-4171-c57e-08ddb39fbb52
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:18.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1Le2QJDjnEtPDkeUwlSfD54NqrIV9fwVSS/6nzNxXw3grnQaHC118y2MXp6quG0qwvJ7J79Nc8qPmYanVOXcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: GsZLDSaYsDpQjhlghWMxWNkZWoauQLwj
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b7940 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ghPTfNQJJ7Tc4bI1EqIA:9
X-Proofpoint-ORIG-GUID: GsZLDSaYsDpQjhlghWMxWNkZWoauQLwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfXwq6Td93+ouui xpK3XpvwEvZIDVicSXjv29h8jHivCmTjNAfz/Y0LxpWzWF/acbQeOjydoVguB9KFFrFf8Q1Xt9f xeD0My8ZOPG3iqUCaOGtoxGukYnYDVSdoEGUPFSNDQy7pcOkvitJv8VFjWOrgVZf7yKfjl1vtF5
 vtnjzUg/zYEH/oe4hA0O7M94l0qbax+FGedlhDcDUV/zp44M45r/tdtDPFm7du/HUGNy4N5VPpW g/lEJ4MV48fZfj45SnONn5+ab90xbWN0R7kseqNOFyYOYH4eMOz0O/ONR99C7L87lvNbnTcfBja /IGk4fh7cVHDksU1SCX7QsJ3ApP8o6/BJ7z2Z/3hEL8RokVGPp/naGAA5wspB6RkX7k3O2oX3Fx
 h1u/X6WIv43ibStKlJVDF/ISf02FO1uXKLgmB6rdiTgR7CSPmfRf+EWhQY/Nfj1YpfJN/p+O

From: Eugene Loh <eugene.loh@oracle.com>

Also, add skip_rawtp_old.x, to skip rawtp testing on older kernels
for the reasons described in the file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/variables/bvar/skip_rawtp_old.x | 31 +++++++++++++++++++
 .../variables/bvar/tst.caller-rawtp.d         | 25 +++++++++++++++
 .../variables/bvar/tst.caller-rawtp.r         |  1 +
 .../variables/bvar/tst.caller-rawtp.r.p       |  1 +
 .../variables/bvar/tst.caller-rawtp.x         |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.d     | 27 ++++++++++++++++
 .../variables/bvar/tst.stackdepth-rawtp.r     |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.r.p   |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.x     |  1 +
 9 files changed, 89 insertions(+)
 create mode 100755 test/unittest/variables/bvar/skip_rawtp_old.x
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawtp.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawtp.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawtp.r.p
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawtp.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawtp.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawtp.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawtp.x

diff --git a/test/unittest/variables/bvar/skip_rawtp_old.x b/test/unittest/variables/bvar/skip_rawtp_old.x
new file mode 100755
index 000000000..bf7970832
--- /dev/null
+++ b/test/unittest/variables/bvar/skip_rawtp_old.x
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+#
+# In older kernels (e.g., UEK6), the BPF helper function had a bug with
+# skipping stack frames.  While that many stack frames were correctly
+# skipped on the leaf end of the stack, that many frames were also
+# incorrectly skipped at the root end of the output buffer.
+#
+# Only two DTrace providers ask for a nonzero skip count.  One is the
+# fentry/fexit implementation of fbt, but it was not used on such older
+# kernels.
+#
+# The other is rawtp.  Therefore, rawtp stack(), caller, and stackdepth
+# results on such older kernels can be incorrect.
+#
+# A few other providers also have some or most probes implemented in
+# terms of rawtp probes.  They could have similar problems, depending
+# on which probes are used.
+#
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -gt 5 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+	exit 0
+fi
+
+echo "rawtp caller, stack(), and stackdepth problematic in old kernels"
+exit 2
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.d b/test/unittest/variables/bvar/tst.caller-rawtp.d
new file mode 100644
index 000000000..9bc91b67a
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+rawtp:sched::
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
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.r b/test/unittest/variables/bvar/tst.caller-rawtp.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.r.p b/test/unittest/variables/bvar/tst.caller-rawtp.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.x b/test/unittest/variables/bvar/tst.caller-rawtp.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.d b/test/unittest/variables/bvar/tst.stackdepth-rawtp.d
new file mode 100644
index 000000000..b99ada9a3
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+rawtp:sched::
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
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.r b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.x b/test/unittest/variables/bvar/tst.stackdepth-rawtp.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
-- 
2.43.5

