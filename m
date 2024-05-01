Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925664400
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 01:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714528107; cv=fail; b=WxGvyT6rMS8CpLhZLFCUrsyOu2Ie/bC8Pu4/4aiA11kasg5zieH45NmtBFxWIxo7E54/X42nrRJ8Lcxjvt/3rSHi9fsHaTFx+cxyH1Vwd6SbgI1TXDow6ZNgzL8+odyXjH/WnroXlz1Rwjf5A2YSe5J0j2BYuP1aBjs/t7Qs5SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714528107; c=relaxed/simple;
	bh=vbq/E1tE1kVUyfWkgJ/2qnXhUco1hTr6lP9ioAFhScI=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=aOdtViaJSjZ9+7GkE1RTaP2zvPqF/kMaacky1zkyElIZcQK76YmcuMNaECF7PbS84KxvHyyVMPCYxEDwvnOiN6rkKAzPcQP4dNKNdTwQigxanEBhlBWwTlHSIUkwxuY2YKxybc/Z/8KW3hjHD3/ElyLDGCVmMMPmDYGVRu6t6Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nHEWW6cN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dn8YRTEs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nHEWW6cN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dn8YRTEs"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UNu0PK023423
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 01:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2023-11-20;
 bh=y60T3UqsdhqByEeOyfG1tW5r/r5DaWwtbm+309aSJjI=;
 b=nHEWW6cNZpK9eryYHVLIt+jnA8lIzDezZgJeZmxlpmqPTZeMjT1SEnInQShlsagxDPnf
 NZzgJY1ue2Q6n50WsefkvXkEMOvEpHNhTbn1I+cdozXw2ADjNRjjFYgs3eXin4Vy8Igm
 3gWwfZcQZneO50uqi8Zk5NCDmmBdawZUomVYrhtaw1XLYxgqtgikZxxznC+zfwyy23vg
 gLGsEpQ3iWA+v6Hsn6AfU7iC1pkUmLfTfycNbjc5eozy0iMd2sN7LkBQ4PZ/Pioct8gh
 W9w9NFxePqajuNyWv5lsFOnjRJo6afe4Ra233tIjNTDNzz2whsex4IcjelkcRMsgOzZC Mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrsdepdqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 01:48:24 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4410CvkO008543
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 01:48:23 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt8tc0k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 01:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMiA5FiS+CQPS+fCkuGmUTwsV7t4vN9EewxJfHyFB8FYlPnkpBOJk+BkXMbWlcFNI2Q3NoIXCHwvGsiXhujorCfaf1ac4KtrE7iKw5TpmsSzVuYWZp41fkAp8GgovCZIDur6+L+FAw8IWItbSfNYYk/VHNTHrRSobgaoJWM1qQPMVuh5imlbHu9nFkUgfAnNfYW7Q+B+gh3hOFoVGhavbnkKI6iyGY2Xm6xozDzyBVDQYivyt2MQ+CY9RQZmPcKjKEfwTDOkJ3x65JgXEUS7qPRZslejolmDlqgBUfMWT/JCrW4yafVe9HjQ4j0AJhLMO8Jvj+8dnSQHLwDO43zLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y60T3UqsdhqByEeOyfG1tW5r/r5DaWwtbm+309aSJjI=;
 b=hOWV3bNE+TTj7MzOQaSYAVQ0BdJJ71iG5kxCvUDleEh8iGetveLTHK+1zVHKjb9atqVn10uREGV60L4edWk/OcSwUDFlSbNuOsLDoZDnlDGwtBylFv8L0PDRxqgKnI2Wt4pzmCcK8cTQD472acOwYeP6HLBZn1tsOAyx7HHyVAcUMN0RTc9/q1iLJ8S02NH2fvrQKAypEERPfMcjdZZyrpAf1Qaqp60WLFEVqQhcTEdJqNrGakpxNGAD36a8iGBDKVSucInKr53vc4/+LQBVXZQPMNlMoYi8E/4d4oMrIp4UN1gyrUGk19cBwMUY2/gaiMLhfax9iEqqnMlYHmnSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y60T3UqsdhqByEeOyfG1tW5r/r5DaWwtbm+309aSJjI=;
 b=Dn8YRTEsRI/pzaqYmQgYuUBhcPQPAe+uQr8HEx0rFQ2pj6zW3cxlyIbQB2RnDIRbPR9c6Fp5x+y/w4aM3oP1Xp8aYyzfr4NeDp2z5wk5a0uBq3A0O0eNQ7y4qIisAdbeTgqgXauihSRDHM7MFEVtP5tgJzy8EXp/jbsYsE6jEIQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7844.namprd10.prod.outlook.com (2603:10b6:408:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Wed, 1 May
 2024 01:48:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 01:48:04 +0000
Date: Tue, 30 Apr 2024 21:48:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
Subject: Issue with stack) on 6.x kernels
Message-ID: <ZjGfUr/Zj/2taTAW@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: ea269cb6-e5a9-443c-5ae3-08dc6980be2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x/7AMGpBg1sXvtx35WmjOeTs+i/K5x5idWdxGdTZZhWU0pohm9Y8vzLp4Dby?=
 =?us-ascii?Q?3Jl+Mf9QUrHGqSSmIO73zQqkQORi1wEU3g3m6i4cF7tBFnrwl0lWO8BJRysG?=
 =?us-ascii?Q?w9mUbtX5x0sxgZ46T2JIFP/1+pgPnwkgI6/MK236obkK0v1tRiL5ayZsLqvV?=
 =?us-ascii?Q?tqnhPSxZI1oiV3GJpAiL4dSy1n8viaqHyPXNc7YAsDPek8EWo0YNtQ90LEFP?=
 =?us-ascii?Q?r6ovq8R1Xk/9oO2F1EwB7jgbLGghVqBUK4B70LVv4kUPog58I4AjueLxnXq2?=
 =?us-ascii?Q?zfWoqzannXu4tOOxDxxC/Bdm/6nlD+Ytjx7UJ4dfYLeDU1tT9i1kivY83+XU?=
 =?us-ascii?Q?bIpG/5l4Nn/sek3UExOooHf+tpJCLIrwCyvPxnFF9duNTyeLpn/GqrL0aiCL?=
 =?us-ascii?Q?UmAUEI5QC7FfSRw10a6/mw8/JvewK2bdO1J41qTm1/tJK6cfWZjpq0x0Smyt?=
 =?us-ascii?Q?G4qdanvKJSR/jc5tw0uvBjTlPiXTaXkIPitKYwQvwkjKX4cdkH1TwlhqLMLV?=
 =?us-ascii?Q?OWxVv79fYZnZDqeoZXU4N5f7Q79a/Lm/Z6O9OVGzdaQalsLIEV8E4NNVCXcG?=
 =?us-ascii?Q?38h5lAfw+QOJKSC4fEnljVwpL3gA8ySlYjJlKWJZcxd0SzdXLXX0Xh5AZbNB?=
 =?us-ascii?Q?P+yh2J+aGF0kzOo1whFMNWLZYKU7VpfZSy09BU0aXGQvuVU0+iMO1wOBUI6e?=
 =?us-ascii?Q?+ur4fAwmGounb2RmfSwilPanVCRhpRSAb7hCSuob7otBYfQcoClN3YvWehS+?=
 =?us-ascii?Q?7lS7feUuJObbS1uPTK7KPHDmOIoxLO/7EpN7njZMhFdY4TN4cYWgjZxVqGKB?=
 =?us-ascii?Q?lRg6RpkEPg2K9txcanj7f8npWUJyhYBONFxOyF+54tjtWqiQOeLex/wg6MsC?=
 =?us-ascii?Q?OlT/LE+zF8e8yfwykktZSMOV2eIJ7zIVnqyzNwGTUyNElXHzEMBVBoAkKx+N?=
 =?us-ascii?Q?hlaBw/is9vCEcTChH1QbsQtrMTHgXd+gaYfJDGh8W+KLNuo4bGIsOiCRu4Bf?=
 =?us-ascii?Q?idhSjc8bHlcZnBisa67PvksAvJKZn6y1WEPIqZfRMDEez+SZydbpWsLfSE1d?=
 =?us-ascii?Q?hKfpDXVJFEPeYJxNeTvWfvhCKmWK7/l2itwe2pffLKA2KDW72cDYj+tlEJTS?=
 =?us-ascii?Q?kOwnPaCc/THOPYGKqms5pwvfaPXZ6f6ECf2tw4SfXIRtuRfepVpBq0D4VJgW?=
 =?us-ascii?Q?fF+hN3m/VtrgZKLvA2eywKSCMFGVPJqgo1PCZnv2av5UpydSZSViNldc9mQB?=
 =?us-ascii?Q?CHlNs3tMqQLIaTGeRAGZWWP8m2CvGySOtouMrlXeow=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wvPYzuvzvu5CoLAS4qs9uu3P8qKJkC9yMsqpnIsx7AjU3gYCxCFneZH15hNE?=
 =?us-ascii?Q?mzmhEGrIGP4FMLgFAd/hxtZPidHDZCF7YlnCFbeDSK0T5uyo+FLNlPssHrrc?=
 =?us-ascii?Q?SiMSBWj/9PS2HzMaYElhAtcouXSGXPyyQ9E2PwXkCVY/Hos0gycXlw69Y8jh?=
 =?us-ascii?Q?0qi+iXqX+vUc8V0ka1d6b9dj3R0CEu3O+Y/OERqlcbRiyleCvwMTTMjnJZgH?=
 =?us-ascii?Q?fq1lu8zB27i3MJxKHnqpfKBU6W7QFSUDTnPte0AJ/R/1CNWszSaAwRsSIk3g?=
 =?us-ascii?Q?CJmrzyQEjd65EzwwQZw6M+OKvjEoAjHc7eMEMTe0p+XnjWrSSkSELRV4xk4C?=
 =?us-ascii?Q?2zOOFmU2S6mvdUOif1kSidtWXdSq8KZtWvP0pqLQFV/BQFpJOuDuNJcdTW3m?=
 =?us-ascii?Q?3+qS+SSGOy/dEW9w/Xop/6UXh/SU0iywi5FN5jaOkK+HID0DAaOdRsr7MmzJ?=
 =?us-ascii?Q?3IxHjGWQ/1hTD346z77M8pVcezfbyHXr+b1hC3PK1nj9Bw2+ls4W+/ik8Nls?=
 =?us-ascii?Q?gxDKYpw6Dx1ZL1/4rEiTnrdd82nMqeublf/+hnsMpRmdzkylzULpgGwf6E42?=
 =?us-ascii?Q?5RCoaTCX6k555Ha6yfLoAhFGNVM5TwIjiujgOYDe1lIG53M0IxAzzazLMuiR?=
 =?us-ascii?Q?ZL0Jf7QJdHPD1vHKfG78+GbcknKYrufaftCi2yw4lMY/tCisKSqaDS901SLg?=
 =?us-ascii?Q?ttPA+wyuJdzxgs3b2RA1hq/PGbRt/pwUpq+qev3IPi8fhryuOKtKMRgXaU4l?=
 =?us-ascii?Q?r2xdZfjA70bAoi82V88thwo4niNRX54PjxWgplyWboSZfae1Xdy8ZMiB0zhr?=
 =?us-ascii?Q?PmaRZF8mevMW+4+Kq88t9umuByqjB4gJ+A7x72BW2EnOHjYTx97LYA5FAmP7?=
 =?us-ascii?Q?3SuFsiGa+B7o+PVJvfzBqFKEwCeuPdydqye3KK8kfwRMgEIdPENbLhqXGFHQ?=
 =?us-ascii?Q?daIBVAgPwTkcQd0G+yxRcEqhiIA+6wbafntcklio14ZXcgNA0k8BccuAX7Bx?=
 =?us-ascii?Q?eMYf81lcV2H/0MZY8Ci5eBYbx+adYhAiIQhaX6p17opp8ARQzWJZqQ+SssQV?=
 =?us-ascii?Q?eWWYjlJJAQmoTzQ/y/Doay+1X+HxT3W9Npvvg+OyWSuaHqVzyEPmy+gftOs+?=
 =?us-ascii?Q?O/r6vs1ohSqAuUn9lf9rAohYh7tn0VKBeqQ8rvUpI+co3ME84UWde5yB802N?=
 =?us-ascii?Q?au/jOYPlAENBtDq6vSJNho7NNQVJk0cqFerVQ8Ud6fASINctRPMSm1xoP2Z+?=
 =?us-ascii?Q?LGIgM6YASrySSFY0okwIkkyn4VBRaTfOXr5Zxa6se9nQFYd5bORyJ2LnzuN6?=
 =?us-ascii?Q?FDINAwLyWVn404tJ7lDkA86zM6VNjC+yzIssGVMsld5xtbPWJ224lx6DcuIw?=
 =?us-ascii?Q?OoEG4rWhBeIld5HCiuZzAT+nNltVSHKUpIBDFZ9hYhs+XoSQwSrwecQC6IRg?=
 =?us-ascii?Q?SXM2Al7AQX2EQh4vLgTGAYemyY1+PgxDIdZrPBSB3fP2sNvCImlKrni7Qx+Z?=
 =?us-ascii?Q?lb1G6bnNijZqzW5CqzaYAuH1hI57kqpADd74nfuqv9hAIfT3qG7tvbqnbPDo?=
 =?us-ascii?Q?60jP5ikpjf4PbrYJonAviyZhOkYXLZOspyNWGnfBbn9LFwh8zKO3pkBe6Csz?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mXTq2EeGjrKePkxejWTDdip1n16AETPdu9prthliKo7bI3RlY+hb2ecigv7hBDueyAX8z8sERBKfL/wWn0OX9060MYlcXgzaW7HsolScsGipPLW3J+U85E+wBCoT8djRMzro8l3tsW+E6TfG3O4scnlyUF6n43cnOOhE8znybuNnuxtqUEU1oW86dY0LuOaSToQ1QjTFj6d39Wo2AMsJtIgPrH8Lg6IwaP6xo02W6Shvqp25Az36qX1FdQV9bO2o8+DtaNvQZd5kKoRgtHdGVbkPcxhtCTBnsuCyImSgPXJ7kbImtWcQay/7NDqlZDMiKzgUF+XgoYw+JBYVKGCN/G8ofQXpOg+XxuX55t/k3rCnis8N0qJHQGvlPls+5vkh+tXRw21z8d2eiKUmdNVXHnl/QzK2y8fBPyB1aKpsnSzNzFZa/Zfp5edIMaj0/GfhSFMseLr/SZMMPyg4xoXrqXjuw+QiEkf2rq1qav/OJIgpVSbQOkkR6zf7A4+pCSre/3X0wiLpim3GmRkrbGc0CGHCsJIDpb7smuw7Kx889U6Y47UJEM6IqTU74hH3lyN0Hx+f+20B34BQ917O/OmDcU/LhGvda3UWbMZ4SAlGsU4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea269cb6-e5a9-443c-5ae3-08dc6980be2a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 01:48:04.7751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMT68sqX6flCjyDHEiM2OWKLjF7+Ii/lV+zhBO6oJ3q9+ZMuibw+KzCPXN9oRv79VzGDz1D3iXP/YGoboJrVtpbArm2X3Dqbnln0wqMsn9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7844
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_01,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010012
X-Proofpoint-GUID: unRm5TqmppNT1LCzdpxysZm__Htt4Tej
X-Proofpoint-ORIG-GUID: unRm5TqmppNT1LCzdpxysZm__Htt4Tej

Newer 6.x kernels (I tried 6.5.0 and 6.8.0) seem to behave differently for
stack() than e.g. 5,15,0,  Test test/unittest/aggs/tst.stack.d FAILs on those
6.x kernels whereas it passes on 5.15.0.  I am not sure yet why there is a
difference, but Eugene, perhaps you can take a look into this?

	Kris
