Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A107EEF5
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181998; cv=fail; b=D+iSWm1+uN+iMlR5e6QI5h/eETRRZwNFLj9+ymPMJkUftcXCbqz+fLzUraPBvz6XqLjFqa1mJ8uYYMR2kUqXjIXcJJMfWDo9Rf0TMCAbww/m4xh6nN1O/IwDepKGWk/IAhc6uf19araa1lLg/rK+WRQzUorSpTh16CKukVaU7io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181998; c=relaxed/simple;
	bh=sqsHa8gkF9KgBdUpqeVzvlWZPN+pi/wbb1V9JmDDXas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U8YO9pCpVbct60nYVE+FSR4ISnC+VlpjDW9efxvLzVWluSglEY4xC40lauXJULE9fgqjXP5xBs+OjqpmzIt+Li6ZIDFV30YMX06uaKzBfjBwWKoiMTT+u8VASKuJLKrP3VzoxcqvIZ7xxFfG2jg+VC/42qmT0Y9TitnkQSgHUX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHsc61020114
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:53 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3D4zZh98U5lsMELDnVGjlgIsl7Wd+RW2Q69diAviNsRAM=3D;_b=3D?=
 =?UTF-8?Q?Js8ORj7FO//5cqC3g4qwS+vbx3MQzbrYxGvRRKSJJuZ9KqzCk4r4pYqJx4SVoi3?=
 =?UTF-8?Q?5QLpO_WYOcszOSvdJK3fE55+GOz3ldD81jvUAzZuCuqwj4DuhlPsef48S5f2V+F?=
 =?UTF-8?Q?jAVa9mQjhHh_vaBmX+SH4W3QnfYi6gGUFhJyizBTGAcyVVjv1/sToL2eJ7eLcoC?=
 =?UTF-8?Q?u8RoGTukKlIRCKANu_FOLg+BEUeIEF8cBkQR9g9/InUoYppvpAHOdBWUUBMFKVJ?=
 =?UTF-8?Q?ewn4CojmYQP3X+4bP/Z83ZQ_2cQKY/yALHOmKaTTFCE2PO60kDl3HGZLD0uxy3d?=
 =?UTF-8?Q?Yhxhze6MBtpWUy6/GMDFvSkkPXVT+_kQ=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8kbbvfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:52 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHYP8F026546
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yc50a876n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf9FtjC/6TUNBFjihXaMPKL5KxFv+nU9JF74BZHTrqX6YB+K1CNNBIJb0oyzG5AswQRIz3a4/E8R+dLnzGEBNz5+MZr6crN+UN3OW1MFGJuOEB7CU+NhdArvbK3aapxedt6w8HMnlSmiiivBxwppGz53VlhT6x6V2LFwo6jEOg6Ag82vVrlIgYUd/ImJGFheBscOzdrAZL1uAV2cIiltZyBr6ppX7hCka1LTRhTr3NwHFwNLuMINJZaiEpHLZPePAVMWV7jnZoXPgMwX+dti4m+JCHVjv+ksUtNtgVxkpcFvRyih3DEvXUDVJ/4feywMtlvW2T6FvBZEd6W1M2S5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zZh98U5lsMELDnVGjlgIsl7Wd+RW2Q69diAviNsRAM=;
 b=hLdQ2lay3rh+Iz4v5toEtuVD4On2CyYXw4fcX6EFpt0AFrdSu5gV1kYjUR9X8RdgdC6H0Syj4NumMBgjyF5ix1MIb1vMHDZjqf8TwEhipdrtf63SvU+6DybnNFbghkquf/ME29O0qkPyvqVrARFtW7OYj9TOSh0LnYmqYGuRp03TXZ4SZdCaV795kve1jVqvpK5iUd4sV9Z09O5mIPIt2TbBx63qLBi90bjYwLtMXQHWrktvgOndWT/8coSgiKvwvl8ucEMpjYMg9Z2SrRXc6u1AUm4Ms/AU1hPCfAMoX/weNNJSikzrzAppKh1PbIwPCIiiiXbY4ZFhEE6c4NISlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zZh98U5lsMELDnVGjlgIsl7Wd+RW2Q69diAviNsRAM=;
 b=hte45gV+6cChA+FH/4ujFusQhyaIF/UmuSv2WGkc7irPCKq69KFbuduhS1d/otT0IGPUvzeo2cj84K8ebM+qd2yN6n2WjddFtTU/erQiQBprFBKAW69oi4c3D0miw9hQoBq4BF1GPOLl7vBdEIoHFvxW2ZNYo4PGYWMjoA9SFX4=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:49 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/9] build: --bindir is supposed to be equivalent to --sbindir
Date: Fri, 31 May 2024 19:59:23 +0100
Message-ID: <20240531185928.363245-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0535.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::20) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 271cfce2-0102-4fdb-90dc-08dc81a3d86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8CIS+Uh5rizsG/rSJp+yfffIZ+QWXEm8PTjy6yCHcQO2jmmxny5LEH6vApiK?=
 =?us-ascii?Q?DXfIiE77+hnRg2079d5mLL+dLqXPwKQzTfVF101WgWm6IDLJbHn7CGWAYyny?=
 =?us-ascii?Q?vRF4ECGSKsqSw8KBSyne6Qqpriy0G8/kNZb0M1kqpd15aILV1SaFbpkigpVu?=
 =?us-ascii?Q?rtz7wodSe+ZX+lWxPm+VZxhfr4zfPmYmo5zVsc+5OhV7Yw9iznD5+VCe0wf0?=
 =?us-ascii?Q?fllLzwaj93jSObZUHjkJGRRNysT3uwaj7Sbn2aguJZK9kge6MMGh7Kib5EwC?=
 =?us-ascii?Q?i856K2GNWz6HgmKHSuEr8mpvhyLoWKhHhcqRqJXfVH8Hl3FjAn9EMXVicHbo?=
 =?us-ascii?Q?5fJ3K47Ql4c7s2vR6Qb2YyzD+FXIhsJ1uRtcroa9qbip2KrKk/ZeQpbA+C4h?=
 =?us-ascii?Q?DA4o5RBceJ/qTsLohN+n23RkkSsUx86pl9ET54l8HoyfW2eno6/gXhi751BI?=
 =?us-ascii?Q?omZrnCOAqP+S1+/y0fERHtCmXeBQ4zd68B4nojFad9qzu6+fBwNNMchjf0Sd?=
 =?us-ascii?Q?07zBEBoIFdeqZ8Ki+rDV0WHF87XyaSgQV+MMDelEMD2/C8RXQ06XwnqOy01S?=
 =?us-ascii?Q?QV1slu1fg16LAjy+urgzjxQbKF9wUcTczFjBoyUy2e9XYDmK9kQMaCH8/iU+?=
 =?us-ascii?Q?DkgqNvf1g0u7lyGEQNY9TYWRQ/XarahUh1ju1JHO7yavNA6wDQT0wFPw5LG2?=
 =?us-ascii?Q?fM41BM139Ii2k5nLhDpRTe2HYV2kcJ/kmlQwHibmjLFVty6yV8mbg80ACcMb?=
 =?us-ascii?Q?Me9Mqy/DXmMGZEvWgJbwFhY9uP+UB4OMrKxJ+Lk26/rHRknRvIuHFIfSg3W/?=
 =?us-ascii?Q?/wE/TOgNKm4p0hg61yp6GjziLqEbfPxRmwo07RmTn0xdAy1fUUeRfPxu12A4?=
 =?us-ascii?Q?ixynTi9ZXHeQ4n6wZ2vHe8b8LM4DxsVvv6/o49E1BlFHe8OEZRoZdHxE1OyR?=
 =?us-ascii?Q?Af3ySEeF/2wq/kBLk9bKVMgsK1lOfhgTGApzaqQw0/uT6JYLMLELhre2lEbb?=
 =?us-ascii?Q?YRI05IJe/pQyhnP0geiZrXEcvu3ALqfICmESIGFULoOsdgGiyb/KVsx44j/1?=
 =?us-ascii?Q?y/ab6Ysr0AUyD6ZE9lvdnI50m9Dv1gU8DUW87FEMSKoIZLNI87Gypw9E9CWR?=
 =?us-ascii?Q?qx8X3fVv7kYEPyiK34k0DrqebT4N/qR3Ei62Z9lNdyfMdbXdT7B6rSltWwod?=
 =?us-ascii?Q?nK6286BHO/pOmo3KPh2yqEFIZKIVULYSgfeTAGQvEuz0a++qLN3g4U6WMFKJ?=
 =?us-ascii?Q?wLMlQ1ne968990xwpnrMcyjhdjJenXqsTQuI5xDXTA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CeoZ7sbnHq7VUGPegbCHt03P/ARCRC9fcG6ip5gWQ2UrGdEI6PN9Pplgp5iK?=
 =?us-ascii?Q?phiOvs9XEofbXtOrrh0V1DmVEC2l1ld5YokKO49lV165f2KTPiEMI+tHUjsg?=
 =?us-ascii?Q?+AdhSSbOiPV5RfH5gIECe9WS3QKtsLINHe4qSWEWwaSRAOiuVfd6L7OUAHhN?=
 =?us-ascii?Q?JWsqrHUGeZ6BhrkcVF+Iea/k85Ofr5A1Dl8vZy4bZqUHjUHFfKk9C58Pbw/p?=
 =?us-ascii?Q?xp4lEaNPLWGJX+1NGMQjCNBoowf0DJCxj2w7J1jJDBaCGqtHMdLAQdX0jGRk?=
 =?us-ascii?Q?dlRNfvjF7eZHI2vJ88HbJtVlXQGNGU7sErdJz+UPYNb7vqYlMYHR6xEskU4Q?=
 =?us-ascii?Q?JwcRyn8e6B3bBsGU7xs9sAJuO/FbFfQ3QjCPOnl2KkWrRTGD66iq54qO1477?=
 =?us-ascii?Q?oojV0FTtSBoqp1neJlwXoG1l6zrZfXyjPhmhtvC5cELGqMwMdvJA0ZbGowtZ?=
 =?us-ascii?Q?hWmXlosGkvScr9M26YlDHvqTXF3AsT+mHLg9CNYeUUpbg/LZ5V7vRucCU2G2?=
 =?us-ascii?Q?afs2S+3Y+aUha0PHQ3H/lwzr9Z4XajBMkhIPn57LOJOvRoROiZcMU7xsbp77?=
 =?us-ascii?Q?lIY2HPw0hN3vRwj9isyWjlq1Qc+79d6hV1Zl+b53tyeFsToTdEJOok4uFaN0?=
 =?us-ascii?Q?6RdRnhHO+kaNFRQpwdETipzEkxxMeBVlEB1KVPt7wdPhiH1CLPCMkmcc233a?=
 =?us-ascii?Q?ift140W2eqp15Ms4XA+/hijgasI+QHK9noukQpAwNu/4pKRD3zAHkO1IzqzB?=
 =?us-ascii?Q?05GeTkbghKg+QxNoJIqX3k0LNgNxrT/Iuaj/5gOwlBIXGEMuPHtLD67r40Dj?=
 =?us-ascii?Q?dOEO5GKbOXK2GApTs0Bc8IXXpKHCYGI9ApFQnTZp3P6wmfQ2fkqtgd3q9P4K?=
 =?us-ascii?Q?WNk37VWSWAQePNtURAJWPS1JTzUQmEj2QZGIJ+zbULGNKXuLXfDwPRHwXv/2?=
 =?us-ascii?Q?Ucw3PxxYR3QQgmKUhLR3Ngw578rmK+Bqj+wBIVj4KX7no2NbtMiu103BOQtg?=
 =?us-ascii?Q?ZUahH3wGSpDKxrYumOAtL7DlLIH2HEYeux9lZrs/yTocus55KfPBLHOmtpUn?=
 =?us-ascii?Q?WlcaFUCEQ0Vh6qBkKwdZMw8hCg6Fz6EQgYC6wvPJ3MnzQD2FDkwvLSVwj0R2?=
 =?us-ascii?Q?xzADfuQuIt8+lk6awVftkT8lziRLw0yWFHXqJ9IppoGbX4eO6MyBE2HRPJ+q?=
 =?us-ascii?Q?a1HcfEi8D+kECeCJH6DrzIKHrh1/4sRU/BCmD/fJFwmzrFcJBKVS8V616Kk1?=
 =?us-ascii?Q?wOgGf3gL9ul4Nbu7mt8k2ABbaFnY0DHFh/OQ4Xyqb5n/t5t+ZrzclYWTIHbQ?=
 =?us-ascii?Q?+7V8t0EPp7h9ktg78giEJdH3dW2Ub9HXtGvWzgciU6RD6jC5sirwyG47eKT1?=
 =?us-ascii?Q?28mX9fpyjb9ZefzDePxbzcywvRFX74LBGTmLAVkPmxAU8KsThF9b7gKz/C+4?=
 =?us-ascii?Q?AbEvNjkNEHVt0J3DxsMp380/J+ROKJCnZSp+6vArW11jOAWjWLgeRpCwKG50?=
 =?us-ascii?Q?cDky4jdnOYND9WYJ4UoR5FtmvSRM1VVzgeynss1ymSd/rkwg50yme1uHwlcH?=
 =?us-ascii?Q?NSqM5aEks4q3BllAV27PlvfkKKdYHYNtFMiiNAtRAU72J/rTAViHAJI6R9RR?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lRiC8EF3G2OCB9dAq6+KauQfmFegoXaQJwoivsOzMhGEPovZ/Zp/vTFATRVonSZro0kyzamTB3eOvYLWyFQ3BWMcvsIlKX6C6izMH+2skze9DNbXi4yb5ywnrbyNsum53j++/iE81BRcZKdFahvBNEXOMdkjRcaZn8wB9E+pu733X5OpBkmTRU+CSTM89vULhsyK0X5PAK11PoTBHj0xBDHGFFXreBwPXAamPlmGKDkDDT91iBqza0eOvJ8YcwaXndaZKrTXFmSO2uoDfFc80LZxBXVmG8kKWiDq4fEToqCDOHBkY26Xh7yMg120uRM5rHu/0tbLX4Nlz7U+9oef5uhyUBs9TEhyVbmYtn42oiGOIALIgCym3+ikvOYXrD7Z51NGsfdvUNCzj2uQVjUD2jl6hZvqyFO0igPamoV+Y3iIIZrb8drQXJoGzjR4CKKCuNwfBdCVTRa1PjPUloy6ydmHZRp9Lc7TFOkXOR9BufCw/Ber6hI3x09txFtNQMuVcs8EXn5HwjIDvTNjFAJkfcq2SUJkChJZRt8swHjGTN9sYzMn1dvI9m47QGGo1ehhlBoF96I6tgiZYP14t4jxa2HJp2pposNMa6rcA/oS7eM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271cfce2-0102-4fdb-90dc-08dc81a3d86d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:49.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMs6E8FUUez2hRL04vQuw9bFFhCwaTZMDyXREqlC7e+ZB8v7MHWnQQQapB19aQ7fZqz9eKVYYhRKJV2HeJ/Q6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: vr5OaqfxvjwJnDDZazsRwHt9I3UwzcX9
X-Proofpoint-ORIG-GUID: vr5OaqfxvjwJnDDZazsRwHt9I3UwzcX9

The configure script said as much, but actually it set a
BINDIR variable that was never used for anything.

Fix this.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile | 2 --
 configure   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 0fc9b3b5e85cd..5903a8e355f61 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -82,8 +82,6 @@ prefix ?= /usr
 export objdir := $(abspath build)
 LIBDIR = $(prefix)/lib$(BITNESS)
 INSTLIBDIR = $(DESTDIR)$(LIBDIR)
-BINDIR = $(prefix)/bin
-INSTBINDIR = $(DESTDIR)$(BINDIR)
 INCLUDEDIR = $(prefix)/include
 INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
 SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
diff --git a/configure b/configure
index fb9a45cda1b77..4026a3eafcd36 100755
--- a/configure
+++ b/configure
@@ -125,7 +125,7 @@ for option in "$@"; do
 	--prefix=*) write_make_var prefix "$option";;
         --objdir=*) write_make_var objdir "$option";;
         --libdir=*) write_make_var LIBDIR "$option";;
-        --bindir=*) write_make_var BINDIR "$option";;
+        --bindir=*) write_make_var SBINDIR "$option";;
         --sbindir=*) write_make_var SBINDIR "$option";;
         --includedir=*) write_make_var INCLUDEDIR "$option";;
         --udevdir=*) write_make_var UDEVDIR "$option";;
-- 
2.45.1.275.g567cb0950c

