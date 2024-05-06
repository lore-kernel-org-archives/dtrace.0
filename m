Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECAC158DB9
	for <dtrace@lists.linux.dev>; Mon,  6 May 2024 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715022340; cv=fail; b=e+fq+JzDS2Gf+RsVi+ML4RlGbEyg7amRGJx29yoh213cfasY/aL6QxKKZ3fKieTD7wUA1LcXPB5B1lhcomqJqmTrhmkF/RPit+P3UBb0hxEghz1POsaA5/YDyyvUdKQOzuCchBqdB3gsqtR663iRdo703sjn1PPU46mMbh9iKAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715022340; c=relaxed/simple;
	bh=WNuY5s8mVClV/0m20+bPv7GSAlqTwQRI9uVbRXIY9JA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=u6q9gtC6Czo4XeEbI2gMCeZ7Qcz30ytVnK/Pq7Q0YPuYlA7qG59umnkZKo0IVe4g6eeigf8MUf+DbHlxGKm6ktQ5yaln0uoV2cxtCaeUKQOP1NWUbkQYI062ddtCv5UdF6zLfAHxPuaTAUcJHc8KKJQr2vDAb1AuWE1Wo03UEjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iw4PRHsf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dN6CBXez; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iw4PRHsf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dN6CBXez"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446IMEhw027851
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=4ocp0S2Gdfdd+TlO1SlTiWGXSR9X3jnl+rQT7XNAb1Y=;
 b=iw4PRHsfORxgJSzO37jdIEruZmQ9kw8kSJrQNp2+dk7CaTjQjxbfy5ADHaQkRyDqbuWq
 AB3Q+8a9W0s7NXPuj7yefepjWNPhrVsRGrT72wtpPJHTcjj6rTYlie2STKOYOYGiruJR
 oZdPHZeqq5XhTAbw5PJNOVNfkOE8dZqxFz6oKoeG4oerrK27KDqRd14z8zPWtUR10IGT
 9YlK7oYz92zN4eptU9aQ9EwfoNP7gkZPmJ7KeZCY4ZR7WCReaq8+4SUax6e/haoibPYP
 t7Sz/vKA1ydRv3p1Eh3kiMdjeE3+w7TG00fT94G91hLOZFSTtCzKOm772fOW6BQHR5pV zQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xwd2duagf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:05:35 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 446HG2wq027567
	for <dtrace@lists.linux.dev>; Mon, 6 May 2024 19:05:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xwbfd8wk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 May 2024 19:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmZq0/XpQslEWUuISvQ3hGRxiz+749DkrP0jGGGMsQJu9WtJAeDRL+sc+1GMOTYxhPgk65egJtayRL9kbUNxFJgrTOyYxNJ4zv2/rBjBWNNRvjns/SG/G+1R2uJooTHq5LElrBDV3OdKf57swv1tuZBw+K09x/15BkiqCkVUi+kzx5MoQKj+KodSwyf03RETlYAEboQi3fDSC1IzuNosDRUVup0N299xI6D+7l0m7fBZ2G0hPF++oVvnO+weA/nWkmz86z2cBN8Ip9AjdmZoZlqoJBxRVjkVuo89tZQtylJVM/0DF3J8pJ5dyGwkmsqCKUDXtUiz9j+s9AhpSefhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ocp0S2Gdfdd+TlO1SlTiWGXSR9X3jnl+rQT7XNAb1Y=;
 b=IaANE5m94owPZTKHwrbZBHCzSMSZd59wkBg35W8aNZCmSM639oRundRegGlCY2ppPPh7J2HsFie+WbV5BvDfmCDuTscQjaTB1qrWqbnV1alBH8aCCXBlrQN22ljTjLUxO7zZ1Y9nz8jZJ568KPXprzkTpVwoeqgBmhlKFXmIxg+Bi3Ch3u0kRilQaIETOFoDKyuIn8u+yQlRpYb6jNr884qzyCnrMh5De28lPnFq/bXz3pYyhqVAn1F2RIcIFr2nvlNk7hOOsYOvPDIjNeknmzXXN2hQVMZNP4m3v2kbbtMs5rqwS5Wdc8f+cJqVvfX80o0wqetT6xt36sRkVlejPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ocp0S2Gdfdd+TlO1SlTiWGXSR9X3jnl+rQT7XNAb1Y=;
 b=dN6CBXezzB/vccz6TStE+okrk6WUjPTs14laOrA6VWkjExw6yPDFqwcwjDBFNnhCYcMQpkuwsKfy71R+zeL3Unu+ZARA25UuCIf/xkMnDSGN9Ew96i9zO9/o+NlStvnUqrbF1Ti7q7ihQAcD231xA15TD8yuWcEwMcz2FjodUzM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB5830.namprd10.prod.outlook.com (2603:10b6:510:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 19:05:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 19:05:27 +0000
Date: Mon, 06 May 2024 15:05:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: be less picky about the content of bpf_helper_defs.h
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB62872FF9878DAAEE6F33AFD3C21C2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 25909cd9-8026-4bdf-3d4f-08dc6dff7dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HI5bE5f37lubS2W0zBUIDsXBkIClZUR9tfQX/JKg5mT/1340ggdzrsv8acKt?=
 =?us-ascii?Q?hnZdzXWS4su+0Q6dEtz5Fld68Re7BMNcZbWIbiiL4RNxR/eElCp/N+4fxGyr?=
 =?us-ascii?Q?PqK7suvLRxhYTOwVrkKefPBFpz5UPMLPa0QTdI6ta//gM6ogWOwazoe0ypFW?=
 =?us-ascii?Q?MBSrDe5oQ8HHiJzOIoGJKogSjYsM06ZiPJlvIxdMttbCWrPbKR744tZft5lK?=
 =?us-ascii?Q?OGZ3/f5Saal0taEPKI4l7HlzJg1RAecw363eIG2hVfO2EDjN2fsI7Sfoxla/?=
 =?us-ascii?Q?Bk/zMYtRDW4AHc5QWbn0HSLDIVOo5jMQsVgKL6tfcE7J/8c97o5DlY3k2ofQ?=
 =?us-ascii?Q?4wZyFAJV2a6WdYOWKezbO4lFlGnsOmmxe6j5LwV3BPaPDMZis0LZevBAEHfP?=
 =?us-ascii?Q?iTmSUuwXgbJrzQiV1UYFe+K/bWTWECpmryiDQ1ZTyO1oFqSHlUjFsdrEd1WG?=
 =?us-ascii?Q?II4lgWBcd+QjOTB/f6aWAivkctJqxNwchwAWIO/qwlovtZ/i6RY1y7eYvsbv?=
 =?us-ascii?Q?yJoJNJgBXpPJ6RFQqF4XLyinK84iqQMSqZrK439jw6XYEK212swPx4in10OE?=
 =?us-ascii?Q?Sz64jEzcW/TkRHWaGvkf/WGLByI/s/9+P1RFwF7MVodP7k9EdY24QJLQgEts?=
 =?us-ascii?Q?A421bKJr7fwkqHanD4Kyz7EM+/bs2EjnHonDNFGS/XezrL2sxwuJ1aD2GenU?=
 =?us-ascii?Q?c0szzA2H/90DQYKnk6Q/GN97jyQr0lY3sp5FQDWTdGizOnD5MID551kMvHZA?=
 =?us-ascii?Q?F6J/bGrni0osDxOXaks+F9N7lltqYkp70qq+eC8MyLMKQGQAl58zjOOyLqRB?=
 =?us-ascii?Q?Br+GcN57lK3EkmJ93uVrHtwnIzP9lUi5DAoAnAoyEOMaH7xC0LXwHBzm0SYT?=
 =?us-ascii?Q?E1xPgqBn5vgaQx9BIDVXFUnhugBQLiCajPkYNcRublEXckXO13JbtF/j43CO?=
 =?us-ascii?Q?Pf0o5ZeEKOhzCfOIi9+gk7REa5xCTGvkAxmWZ6B1iZDrOTdD1le1pQusiE8B?=
 =?us-ascii?Q?uJpGRVNrz9DhxSnfntB1tn3hwDoG37xz9UZq6JrAnAGcC1Yfs2NHUr7hoi/+?=
 =?us-ascii?Q?1L56zbToXaI0B+9zLV5KBv54prBfcNNvdFD7QabR3DKq+6fY+aP6Ef7e6CQp?=
 =?us-ascii?Q?9a9q6A2RI7Ducy2tq/XR6pG5wbv5SW/J9D9c5D6yJXvfDhc0bvLMjiymxC3C?=
 =?us-ascii?Q?sNmgPQuSQHHWy/qjeh3tbevIQB3xiWNCWocNknAml9KzNgnicweT+5eRn98O?=
 =?us-ascii?Q?T9DVDTnSMBX9lsUncys+gPqjgg5lTn51exM3ObQ8Pg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SDqiUk8O19WpdJ0ipTKfZEFZJNBP8I2EcZN1rRa8+tgYEnXAdJkEuRjUgRw1?=
 =?us-ascii?Q?jUW06umkhzOHXt93eefTxuzKLPzr1cveFcjgK7uVRqB3lNIAfxcR2TQsxQNa?=
 =?us-ascii?Q?UIrjATIrrOGuzZtPVyy+dHOH3CQN6royqAOTgviVHPhCBHf/HEbqHwtFBuTa?=
 =?us-ascii?Q?CKIC2tl5d34wNaPOS1JIdOzwJTo2iX9b4WbEoFbtdp0fvLQr92lFrTCtxd9b?=
 =?us-ascii?Q?waswOxCgF0m3buzkkHssQmTPGqLzP+tR6ZSdBVEXGTubjbdgQtit75MOJ/QM?=
 =?us-ascii?Q?BfvjahbY1zclolSm/DC9l4aCMfOKFGmyRLGWxAbi369mXLyxH1DT2cPbMBbV?=
 =?us-ascii?Q?4JLImUBtFLVu5H2lgai4TIhnq8BpXKJ6V7QyoHl+dkCs6eKevnB0fqi8rIAH?=
 =?us-ascii?Q?0OcacuuZTpAZUI6lbCYH+qJuErORc8JrGoJCyxwUJeVpUdGEq+2qRn/pvZeJ?=
 =?us-ascii?Q?QUCrD57wbVgDwd03KfSmK+KnQE+bsHI02HMuaRVrzzWWBZ+nIq53zBza7jLB?=
 =?us-ascii?Q?KKAPU+Fo+c6oWFW3eKEcfNPB7hIP0YccmfMFk4xVgQKX6eu2KEzPYvJm5jtc?=
 =?us-ascii?Q?+S2aINOHWekMY00GnjA9HqsJBnY6mqs3enrhTVvi+YoOf4GWVezRXSg9wCLO?=
 =?us-ascii?Q?4gGzBi3tc0LHhrBsZz8Ex93ExF0u9IakKRWyHWH6gtNuK+FbxVAfEK4JbE+y?=
 =?us-ascii?Q?LaFcjDmDi0Bpk/qAqDEXyA5zwoZ/LrR3BefmkfV7/SGQWytKu4YHv27spS3e?=
 =?us-ascii?Q?ztn2HfGkW2qEByCISc05FQqRkxE7tHvtAB3SJabVjHMDsBgvKoi9rrJtOMCd?=
 =?us-ascii?Q?GWgkiuzxNpbw/mWuiFUjvuN7H1z+IA42Kqbe6pIDkydKVVm4/LYSEDtS+/8Y?=
 =?us-ascii?Q?/RohDZz6EKDkBXBudD7y5jgIhOu6Ref1mWxsmiTy94PKQVn9qK9Vm9uT621Q?=
 =?us-ascii?Q?x3ZPR+vjPlyVf9v0CC9WDSEWo7q4hPDgzDR17evHEpjlOr4kvJ1SpxaDTYSZ?=
 =?us-ascii?Q?P/qadzo8nlCdaOz1JmLpIpPK6pWwElpuoNq4TvEhJtnvNgGhCHXQYmJuZInw?=
 =?us-ascii?Q?5LFl+XQTnjzMGRuq2Ox1zjMwM2aQNRpB242LryXjA1O+mO+NwINrlVo/1iyp?=
 =?us-ascii?Q?3Fei8LrEvHxrN8uXCKpi5Nac4ygjKz8irVRpsRo/PLTgQRj/NK+ehyTGuuNQ?=
 =?us-ascii?Q?PyV4123++EsQ3XXIIh/+ZudNBAid5WqwyAufZb9uipkdamBSi7uUmgcdoH52?=
 =?us-ascii?Q?4KVKo6qWwJ0ts+DXbuhcl1pwX7GxuZfV5vI0F/mjGfr7z8nxgj0GHx1i9/me?=
 =?us-ascii?Q?+HrhoW4nZFnjOVaOIBNUJyKWJekYMxBuyPTU1oMclxpl7d7rvPbckiewQsK9?=
 =?us-ascii?Q?rGNcuCjJxjFCc142AqQA0r/UwMFdaJoR6UWRMZL/wH9h8Hpk7Uo4Ov725QMo?=
 =?us-ascii?Q?IRjJ2FmeyF4oaLJBlByQ/0hHixE+AUaL/L2cFf73N06m9BpanUy9YSd7HD/4?=
 =?us-ascii?Q?yY5Y0pMapRM9oSM4/Y1EONydPwnSqozu/M0l7kixQNyTZo7nDejN6bIpODjO?=
 =?us-ascii?Q?jDL+A8OH9vOUtVFfVnWJggWQU8jtwAb/InrgPqRbIYxBo6ICGCdTh0Agl5Sx?=
 =?us-ascii?Q?ZDTlJATevHJwqXfTrlY5iaI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	okKvVn7Pa9GCetaLeQaYPUyVWuIykWjXI6lDfZrDujo7I5ywOUYbveLPyATxC/u05W9PAgVY9/8jsZ4jN2wyt1Zf96YYHRyDvRHnKgwUX95dJXgztk1w6VLAepXp43JfFI+yPifqabwml8LPcPdCGizX7lDUXBmsx9ly4rapipEWqNH7efHDUfSdHZQOA/0qfk+FhxbRdy8lGLxuMenQ+JNCMKvB8byIFedYYJ0ZS8HNhHOn8vgdgTiguXBkrH/Y7EAAXNQr5TI7qbKJvL7fQcWFjzHUZWn3asx2MD8g53SlZef6BzH/R4RW8leu28lLFx+HAq3G3lDUY2Cfu9Xy4odkEHV64Dkr9xTudthFRZS/8d6tWExh5wvPThp+ht6MIIPB3n27RSpDvMisf2oX5FxFn/WfN7vozgi/+7attV+KhRusUJvS12G+1Q+PIWN05urQT/GEhlE+oXOuiDuhvkSDH74/IyMrCTO6gdyfOmqN/uRtEV040x6fVw2Bz8/5XQDBo+GMlt9HbEzSeS6J47DsQTm/fO5ME5k7gplC3+dvnHC1VotTbu+d0E5K1VY/mlu3GzGhbi9I0C/L2z8ytPtNu9ND2Axo2sNAjhPQiTc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25909cd9-8026-4bdf-3d4f-08dc6dff7dcf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 19:05:27.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWlAOaDEUrJRAR1KAYGgKl0fhMGEUz0maAV99iWUNjDOhhXt0MIb36Vdpi0kM78xZTcikAJS9XKZuYDVA8LAyiqpHTMajcNt1zpCBcui/bI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=919 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060137
X-Proofpoint-GUID: GPEs0CQUtJc8c87CwgGYOAgRwQ3cYJEk
X-Proofpoint-ORIG-GUID: GPEs0CQUtJc8c87CwgGYOAgRwQ3cYJEk

There are small differences in the format of the BPF helper definitions
in bpf_helper_defs.h in libbpf headers.  This patch allows mkHelpers to
be more accepting of these differences.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/mkHelpers | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/mkHelpers b/include/mkHelpers
index 1a7537ca..dc5e62c8 100755
--- a/include/mkHelpers
+++ b/include/mkHelpers
@@ -8,14 +8,15 @@ BEGIN {
 }
 
 $1 == "static" && /=/ && /[ \t]+[1-9][0-9]*[ \t]*;/ {
-	match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
-	id = substr($0, RSTART, RLENGTH - 1);
-	gsub(/[ \t]+/,"", id);
-	match($0, /\([ \t]*\*[ \t]*bpf_[_A-Za-z0-9]+/);
-	fn = substr($0, RSTART + 1, RLENGTH - 1);
-	sub(/[ \t]*\*[ \t]*bpf_/, "", fn);
+	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+/) > 0) {
+		fn = substr($0, RSTART + 5, RLENGTH - 5);
 
-	print "#define BPF_FUNC_"fn " " id;
+		match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
+		id = substr($0, RSTART, RLENGTH - 1);
+		gsub(/[ \t]+/,"", id);
+
+		print "#define BPF_FUNC_"fn " " id;
+	}
 }
 
 END {
-- 
2.42.0

